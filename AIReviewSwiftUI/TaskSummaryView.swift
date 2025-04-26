//
//  TaskSummaryView.swift
//  AIReviewSwiftUI
//
//  Created by kanagasabapathy on 25.04.25.
//

import SwiftUI

struct TaskSummaryView: View {
    let totalTasks: Int
    let completedTasks: Int
    let overdueTasks: Int

    var body: some View {
        VStack {
            Text("Task Summary")
                .font(.headline)
                .padding(.bottom, 8)

            HStack {
                Text("Total Tasks:")
                Spacer()
                Text("\(totalTasks)")
            }
            .padding(.vertical, 4)

            HStack {
                Text("Completed Tasks:")
                Spacer()
                Text("\(completedTasks)")
            }
            .padding(.vertical, 4)

            HStack {
                Text("Overdue Tasks:")
                Spacer()
                Text("\(overdueTasks)")
            }
            .padding(.vertical, 4)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemGray6)))
        .padding()
    }
}
