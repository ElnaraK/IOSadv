//
//  LOOKmeAPPApp.swift
//  LOOKmeAPP
//
//  Created by Elnara  on 5/16/21.
//

import SwiftUI

@main
struct LOOKmeAPPApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
