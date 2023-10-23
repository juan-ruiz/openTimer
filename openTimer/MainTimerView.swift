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
        TabView {
            IntervalTimerView()
            ProgramTimerView()
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

struct IntervalTimerView: View {
    var body: some View {
        NavigationView {
            // Your code for the main alarm view goes here
            Text("Interval Timer View")
                .navigationBarTitle("Interval Timer", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    // Action for adding a new alarm
                }) {
                    Image(systemName: "plus")
                })
        }
        .tabItem {
            Label("Interval", systemImage: "alarm")
        }
    }
}


struct ProgramTimerView: View {
    var body: some View {
        Text("Program Timer View")
            .tabItem {
                Label("Program", systemImage: "ellipsis.circle")
            }
    }
}


#Preview {
    MainTimerView()
        .modelContainer(for: Item.self, inMemory: true)
}
