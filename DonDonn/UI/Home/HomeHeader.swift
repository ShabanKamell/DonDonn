//
// Created by Shaban Kamel on 31/03/2021.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
        VStack {
            GeometryReader { reader in
                ZStack {
                    PromotionsView()
                }
                        .offset(y: -reader.frame(in: .global).minY)
                        .frame(width: UIScreen.main.bounds.width,
                                height: reader.frame(in: .global).minY + 400)
            }.frame(height: 410)
        }
    }
}

struct PromotionsView: View {
    @State var selectedIndex = 0
    @EnvironmentObject var vm: HomeVM

    var body: some View {
        ZStack {
            if !vm.promotions.isEmpty {
                GeometryReader { reader in
                    TabView(selection: $selectedIndex) {
                        ForEach(vm.promotions) { item in
                            Image("discount")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: reader.frame(in: .global).maxX)
                        }
                    }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }

                VStack {
                    Text("DonDonn")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .padding(.top, 50)

                    Spacer()

                    PageIndicator(numPages: vm.promotions.count, currentPage: $selectedIndex)
                            .padding(.bottom, 50)
                }
            }
        }.onAppear(perform: vm.loadPromotions)
    }
}

