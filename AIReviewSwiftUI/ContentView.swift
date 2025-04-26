//
//  ContentView.swift
//  AIReviewSwiftUI
//
//  Created by kanagasabapathy on 23.04.25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle = ""
    @State private var newTaskDueDate = Date()

    var body: some View {
        VStack {
            TextField("Enter task...", text: $newTaskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            DatePicker("Due Date", selection: $newTaskDueDate, displayedComponents: .date)
                            .padding()

            Button("Add Task") {
                viewModel.addTask(title: newTaskTitle)
                newTaskTitle = ""
            }

            TaskSummaryView(
                totalTasks: viewModel.tasks.count,
                completedTasks: viewModel.completedTasks,
                overdueTasks: viewModel.overdueTasks
            )

            List {
                ForEach(viewModel.tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        Text(task.dueDate?.formatted(date: .abbreviated, time: .omitted) ?? "No Due Date")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Button(action: { viewModel.toggleComplete(task) }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
