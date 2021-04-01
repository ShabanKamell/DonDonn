//
// Created by Shaban Kamel on 01/04/2021.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import Moya

let menuApi: MoyaProvider<MenuApi> = createProvider()

enum MenuApi {
    case promotions
    case categories
    case menu
}

extension MenuApi: TargetType {
    public var baseURL: URL {
        URL(string: "https://github.com/ShabanKamell/DonDonn")!
    }

    public var path: String {
        switch self {
        case .promotions:
            return "/promotions"
        case .categories:
            return "/categories"
        case .menu:
            return "/menu"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .promotions,
             .categories,
             .menu:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .promotions:
            let params: [String: Any] = ["query": ""]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)

        case .categories:
            let params: [String: Any] = ["query": ""]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .menu:
            let params: [String: Any] = ["query": ""]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }

    public var validationType: ValidationType {
        .none
    }

    public var sampleData: Data {
        switch self {
        case .promotions:
            let json = "[{\"id\":1,\"image\":\"http://www.scsk12.org/discounts/img/2017/discount.jpg\"},{\"id\":2,\"image\":\"http://www.scsk12.org/discounts/img/2017/discount.jpg\"},{\"id\":3,\"image\":\"http://www.scsk12.org/discounts/img/2017/discount.jpg\"},{\"id\":4,\"image\":\"http://www.scsk12.org/discounts/img/2017/discount.jpg\"},{\"id\":5,\"image\":\"http://www.scsk12.org/discounts/img/2017/discount.jpg\"},{\"id\":6,\"image\":\"http://www.scsk12.org/discounts/img/2017/discount.jpg\"}]"
            return json.data(using: .utf8)!

        case .categories:
            let json = "[{\"id\":1,\"name\":\"Fruits\"},{\"id\":2,\"name\":\"Vegetables\"},{\"id\":3,\"name\":\"Dairy\"},{\"id\":4,\"name\":\"Meat\"}]"
            return json.data(using: .utf8)!

        case .menu:
            let json = "[{\"id\":1,\"image\":\"https://top10cairo.com/wp-content/uploads/2015/12/best-pizza-pizzas-restaurants-cairo.jpg\",\"title\":\"Papa John’s Pizza\",\"description\":\"\",\"stars\":5,\"price\":\"25 USD\"},{\"id\":2,\"image\":\"https://top10cairo.com/wp-content/uploads/2015/12/papa-johns.jpg\",\"title\":\"Lujo’s Fresh Junk\",\"description\":\"\",\"stars\":5,\"price\":\"25 USD\"},{\"id\":3,\"image\":\"https://top10cairo.com/wp-content/uploads/2015/12/porta-doro.jpg\",\"title\":\"Porta D’oro\",\"description\":\"\",\"stars\":5,\"price\":\"25 USD\"},{\"id\":4,\"image\":\"https://top10cairo.com/wp-content/uploads/2015/12/crust.jpg\",\"title\":\"6Crust\",\"description\":\"\",\"stars\":5,\"price\":\"25 USD\"},{\"id\":5,\"image\":\"https://top10cairo.com/wp-content/uploads/2015/12/il-mulino.jpg\",\"title\":\"Il Mulino\",\"description\":\"\",\"stars\":5,\"price\":\"25 USD\"},{\"id\":6,\"image\":\"https://top10cairo.com/wp-content/uploads/2015/12/il-divino.jpg\",\"title\":\"Il Divino Pizzeria\",\"description\":\"\",\"stars\":5,\"price\":\"25 USD\"}]"
            return json.data(using: .utf8)!
        }
    }

    public var headers: [String: String]? {
        ["Authorization": "Bearer \("TOKEN")"]
    }

    var parameters: [String: Any]? {
        nil
    }

}

