//
//  ArticleNews.swift
//  swiftChangemakers
//
//  Created by Alumno on 27/03/25.
//

//0c65fdd04c474542af0c39f2bba9bad8

import SwiftUI
import Combine

// Modelo para representar un artículo de noticias
struct ArticuloNoticia: Identifiable, Decodable {
    let id = UUID()
    let titulo: String
    let descripcion: String
    let url: String

    private enum CodingKeys: String, CodingKey {
        case titulo = "title"
        case descripcion = "description"
        case url = "url"
    }
}

// ViewModel para manejar la lógica de obtención y actualización de datos
class NoticiasViewModel: ObservableObject {
    @Published var articulos: [ArticuloNoticia] = []
    private var cancellable: AnyCancellable?
    private var timerCancellable: AnyCancellable?

    init() {
        fetchNoticias()
        configurarTemporizador()
    }

    // Función para obtener noticias de la API
    func fetchNoticias() {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=clima%20OR%20contaminación&apiKey=0c65fdd04c474542af0c39f2bba9bad8") else { return }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [ArticuloNoticia].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.articulos, on: self)
    }
    


    // Configurar un temporizador para actualizar las noticias cada hora
    private func configurarTemporizador() {
        timerCancellable = Timer.publish(every: 86400, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.fetchNoticias()
            }
    }
}

// Vista que muestra la lista de artículos de noticias
struct NoticiasView: View {
    @StateObject private var viewModel = NoticiasViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.articulos) { articulo in
                VStack(alignment: .leading) {
                    Text(articulo.titulo)
                        .font(.headline)
                    Text(articulo.descripcion)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .onTapGesture {
                    if let url = URL(string: articulo.url) {
                        UIApplication.shared.open(url)
                    }
                }
            }
            .navigationTitle("Noticias de Clima y Contaminación")
        }
    }
}

