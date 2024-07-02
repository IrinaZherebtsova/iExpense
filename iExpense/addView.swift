//
//  addView.swift
//  iExpense
//
//  Created by Irina Zherebtsova on 6/6/24.
//

import SwiftUI

struct addView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State private var name = "New expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                //     TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ??  "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            //  .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        modelContext.insert(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    addView()
        .modelContainer(for: ExpenseItem.self)
}
