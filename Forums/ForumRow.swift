//
//  ForumRow.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//
import SwiftUI

struct ForumRow: View {
    let thread: ForumThread
    
    var body: some View {
        NavigationLink(destination: ForumDetailView(thread: thread)) {
            VStack(alignment: .leading, spacing: 5) {
                Text(thread.title)
                    .font(.headline)
                HStack {
                    Text(thread.author)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(thread.date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Text(thread.excerpt)
                    .font(.body)
                    .lineLimit(2)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 8)
        }
    }
}


