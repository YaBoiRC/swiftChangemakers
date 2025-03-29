//
//  ForumDetailView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

// Vista de detalle para un hilo seleccionado
struct ForumDetailView: View {
    @State var thread: ForumThread
    @State private var newComment = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(thread.title)
                        .font(.largeTitle)
                        .bold()
                    HStack {
                        Text("Por \(thread.author)")
                            .foregroundColor(.gray)
                        Spacer()
                        Text(thread.date)
                            .foregroundColor(.gray)
                    }
                    Divider()
                    Text("Contenido completo del hilo... (contenido simulado)")
                        .font(.body)
                    Divider()
                    Text("Comentarios")
                        .font(.headline)
                    ForEach(thread.comments) { comment in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(comment.author)
                                    .font(.subheadline)
                                    .bold()
                                Spacer()
                                Text(comment.date)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Text(comment.content)
                                .font(.body)
                                .padding(.vertical, 4)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                .padding()
            }
            // Sección para agregar un nuevo comentario
            HStack {
                TextField("Agrega un comentario...", text: $newComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    // Añadir el comentario a thread.comments
                    let comment = Comment(id: thread.comments.count + 1,
                                          author: "Tú",
                                          content: newComment,
                                          date: "Hoy")
                    thread.comments.append(comment)
                    newComment = ""
                }, label: {
                    Text("Enviar")
                })
            }
            .padding()
        }
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
    }
}
