//
//  DocusketchApp.swift
//  Docusketch
//
//  Created by Artem Shuneyko on 12.07.23.
//

import SwiftUI

@main
struct DocusketchApp: App {
    @StateObject private var dataManager = DataManager.shared
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataManager.persistentContainer.viewContext)
        }
    }
}
