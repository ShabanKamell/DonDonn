//
//  FreshRecipesView.swift
//
//  Created by Shaban kamel on 30/3/21.
//

import SwiftUI

struct HomeView: View {
    @State var selectedMenuItems = [MenuItem]()

    @State private var destination: Destination? = nil

    private enum Destination {
        case cart
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .trailing) {
                ScrollView(.vertical, showsIndicators: false) {
                    HomeHeader()
                    VStack(alignment: .leading, spacing: 15) {
                        CategoriesListView()
                        MenuListView { item in
                            if let index = selectedMenuItems.firstIndex(of: item) {
                                selectedMenuItems.remove(at: index)
                                return
                            }
                            selectedMenuItems.append(item)
                        }
                    }
                            .padding(.top, 25)
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(20)
                            .offset(y: -35)
                }.background(Color(.white))
            }

            CartButton().padding()

            NavigationLinks()
        }.navigationBarHidden(true)
    }

    private func CartButton() -> some View {
        Button(action: {
            if selectedMenuItems.isEmpty {
                return
            }
            self.destination = .cart
        }) {
            ZStack(alignment: .center) {
                Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                Image("shopping-cart")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fill)

                if !selectedMenuItems.isEmpty {
                    OrderNoBadgeView().offset(x: 15, y: -15)
                }
            }
        }
    }

    private func NavigationLinks() -> some View {
        Group {
            NavigationLink(
                    destination: CartRouter().makeCartView(items: selectedMenuItems),
                    tag: .cart, selection: $destination) {
                EmptyView()
            }
        }
    }

    private func OrderNoBadgeView() -> some View {
        ZStack {
            Circle()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.green)
                    .shadow(radius: 10)
            Text("\(selectedMenuItems.count)")
                    .foregroundColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(HomePresenterBuilder.build())
    }
}
