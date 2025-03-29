//
//  AddForumView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

// Vista para agregar un nuevo foro
// Vista para agregar un nuevo foro
struct AddForumView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var content = ""
    @State private var selectedSection: ForumSection = .todos
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Título")) {
                    TextField("Ingresa el título", text: $title)
                }
                Section(header: Text("Contenido")) {
                    TextField("Ingresa el contenido", text: $content)
                }
                Section(header: Text("Categoría")) {
                    Picker("Categoría", selection: $selectedSection) {
                        ForEach(ForumSection.allCases) { section in
                            Text(section.rawValue).tag(section)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .navigationTitle("Nuevo Foro")
            .navigationBarItems(
                leading: Button("Cancelar") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Guardar") {
                    // Aquí deberías implementar la lógica para guardar el nuevo foro,
                    // utilizando title, content y selectedSection para crear un nuevo ForumThread.
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}
