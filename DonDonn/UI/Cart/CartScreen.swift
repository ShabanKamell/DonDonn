//
//  FreshRecipesView.swift
//
//  Created by Shaban kamel on 30/3/21.
//

import SwiftUI

struct CartScreen: AppScreen {
    @ObservedObject var vm: CartVM
    var menuItems = [MenuItem]()
    @State public var route: Route? = nil

    func ContentView() -> AnyView {
        List {
            ForEach(menuItems) { item in
                CartItemView(item: item).removeListSeparator()
            }
        }.background(Color(.white))
                .padding()
                .eraseToAnyView()
    }

}

extension CartScreen {

    static func build(items: [MenuItem]) -> some View {
        CartScreen(vm: CartVM.build(), menuItems: items)
    }

}

extension CartScreen {
    enum Route: AppRoute {
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen(vm: CartVM.build(), menuItems: Fake.mealItems)
    }
}
