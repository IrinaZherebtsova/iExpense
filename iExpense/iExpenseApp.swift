//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Irina Zherebtsova on 6/5/24.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
