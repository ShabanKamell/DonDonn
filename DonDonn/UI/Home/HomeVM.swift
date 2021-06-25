//
// Created by Shaban Kamel on 01/04/2021.
//

import Combine
import Moya

class HomeVM: AppViewModel {
    @Published public var loadState: LoadingState = .init()
    public var bag = CancelableBag()
    public var dataManager: DataManager
    public var requester: CombineRequester

    @Published private(set) var menuItems = [MenuItem]()
    @Published private(set) var categoryItems = [CategoryItem]()
    @Published private(set) var promotions = [PromotionItem]()

    init(dataManager: DataManager, requester: CombineRequester) {
        self.dataManager = dataManager
        self.requester = requester
    }

    func loadCategories() {
        let api: AnyPublisher<[CategoryItem], MoyaError> = dataManager.menuRepo.categories()
                .tryMap { out in
                    throw MoyaError.encodableMapping(NSError(domain: "eee", code: 100))
                }
                .mapError { error in
                    MoyaError.encodableMapping(NSError(domain: "eee", code: 100))
                }
                .eraseToAnyPublisher()
        request(api)
                .delay(for: .seconds(1), scheduler: DispatchQueue.global(), options: .none)

                .sink(receiveValue: { value in
                    self.categoryItems = value
                })
                .store(in: &bag)
    }

    func loadMenuItems() {
        request(dataManager.menuRepo.menu())
                .delay(for: .seconds(1), scheduler: DispatchQueue.global(), options: .none)
                .sink(receiveValue: { [weak self] value in
                    self?.menuItems = value
                })
                .store(in: &bag)
    }

    func loadPromotions() {
        let api: AnyPublisher<[PromotionItem], MoyaError> = dataManager.menuRepo.promotions()
                .tryMap { out in
                    throw MoyaError.encodableMapping(NSError(domain: "eee", code: 100))
                }
                .mapError { error in
                    MoyaError.parameterEncoding(NSError(domain: "eee", code: 100))
                }
                .eraseToAnyPublisher()
        request(api)
//        request(dataManager.menuRepo.promotions())
                .delay(for: .seconds(1), scheduler: DispatchQueue.global(), options: .none)
                .sink(receiveValue: { [weak self] value in
                    self?.promotions = value
                })
                .store(in: &bag)
    }

}


extension HomeVM {
    static func build() -> HomeVM {
        HomeVM(dataManager: DataManager.create(),
                requester: CombineRequester())
    }
}