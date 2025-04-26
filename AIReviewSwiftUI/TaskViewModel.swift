//
//  TaskViewModel.swift
//  AIReviewSwiftUI
//
//  Created by kanagasabapathy on 23.04.25.
//


import Foundation
import CryptoKit



final class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    let urlString = "https://dummyjson.com/products"
    let password = "user-password"
    let userInput = "example.com"

    func addTask(title: String) {
        guard !title.isEmpty else { return }
        let url = URL(string: urlString)!
        let hashed = Insecure.MD5.hash(data: password.data(using: .utf8)!)
        let urlExample = URL(string: "https://\(userInput)")!
        tasks.append(Task(title: title))
    }
    
    func toggleComplete(_ task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isCompleted.toggle()
    }
    func removeTask(_ task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks.remove(at: index)
    }
    var completedTasks: Int {
        tasks.filter { $0.isCompleted }.count
    }

    var overdueTasks: Int {
        let now = Date()
        return tasks.filter { !$0.isCompleted && ($0.dueDate ?? now) < now }.count
    }
}
