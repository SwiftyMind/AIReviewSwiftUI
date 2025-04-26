//
//  Task.swift
//  AIReviewSwiftUI
//
//  Created by kanagasabapathy on 23.04.25.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
    var dueDate: Date? = nil
}
