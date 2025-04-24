//
//  ContentView.swift
//  AIReviewSwiftUI
//
//  Created by kanagasabapathy on 23.04.25.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle = ""

    var body: some View {
        VStack {
            TextField("Enter task...", text: $newTaskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Add Task") {
                viewModel.addTask(title: newTaskTitle)
                newTaskTitle = ""
            }

            List {
                ForEach(viewModel.tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        Button(action: { viewModel.toggleComplete(task) }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                    }
                }
            }

            Text("Total: \(viewModel.tasks.count) • Completed: \(viewModel.tasks.filter { $0.isCompleted }.count)")
                .padding(.top)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
