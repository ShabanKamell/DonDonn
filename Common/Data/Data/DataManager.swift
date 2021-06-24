//
// Created by Shaban on 23/06/2021.
//

import Foundation

public struct DataManager {
    public lazy var menuRepo: MenuRepo = { MenuRepo.build() }()
    public static func create() -> DataManager { DataManager() }
}
