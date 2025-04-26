//
//  TaskSummaryView.swift
//  AIReviewSwiftUI
//
//  Created by kanagasabapathy on 26.04.25.
//


import SwiftUI

struct TaskSummaryView: View {
    let totalTasks: Int
    let completedTasks: Int
    let overdueTasks: Int

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Total Tasks")
                    .font(.headline)
                Text("\(totalTasks)")
                    .font(.largeTitle)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("Completed Tasks")
                    .font(.headline)
                Text("\(completedTasks)")
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}
