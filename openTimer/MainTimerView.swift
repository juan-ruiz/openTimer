//
//  ContentView.swift
//  openTimer
//
//  Created by Juan Ruiz on 21/10/23.
//

import SwiftUI
import SwiftData

struct MainTimerView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addTimer) {
                        Label("Add T1mer", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a timer")
        }
    }
    
    //Refactor for model
    private func addTimer() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    MainTimerView()
        .modelContainer(for: Item.self, inMemory: true)
}
