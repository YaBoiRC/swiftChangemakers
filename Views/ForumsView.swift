//
//  ForumsView.swift
//  swiftChangemakers
//
//  Created by Alumno on 27/03/25.
//

import SwiftUI

// Vista principal de Foros con botón “+” en la barra
// Vista principal de Foros con selección de secciones
struct ForumsView: View {
    @State private var selectedSection: ForumSection = .todos
    @State private var showAddForum = false
    
    // Filtra los hilos según la sección seleccionada
    var filteredThreads: [ForumThread] {
        if selectedSection == .todos {
            return sampleThreads
        } else {
            return sampleThreads.filter { $0.section == selectedSection }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Reemplazamos el Picker por nuestro HorizontalCategoryPicker
                                HorizontalCategoryPicker(selectedCategory: $selectedSection)
                                    .padding(.top)
                
                List {
                    ForEach(filteredThreads) { thread in
                        ForumRow(thread: thread)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Foros")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation { showAddForum.toggle() }
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            }
            .sheet(isPresented: $showAddForum) {
                AddForumView()
            }
        }
    }
}

#Preview {
    ForumsView()
}
