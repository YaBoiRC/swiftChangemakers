//
//  NewsViewModel.swift
//  swiftChangemakers
//
//  Created by Alumno on 27/03/25.
//

import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var weather: WeatherResponse?
    @Published var pollution: PollutionResponse?
    
    private let apiKey = "fd344e3552018db1297c78e227d20814"  // Reemplaza con tu propia API Key
    private let monterreyLat = 25.6866
    private let monterreyLon = -100.3161

    /// Descarga información del clima actual en Monterrey
    func fetchWeather() {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Monterrey,mx&appid=\(apiKey)&lang=es"

        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        self.weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    } catch {
                        print("Error decodificando el clima:", error)
                    }
                }
            }
        }.resume()
    }
    
    /// Descarga información de la calidad del aire en Monterrey
    func fetchPollution() {
        let urlString = "https://api.openweathermap.org/data/2.5/air_pollution?lat=\(monterreyLat)&lon=\(monterreyLon)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        self.pollution = try JSONDecoder().decode(PollutionResponse.self, from: data)
                    } catch {
                        print("Error decodificando la contaminación:", error)
                    }
                }
            }
        }.resume()
    }
    
    /// Función para cargar ambas informaciones
    func fetchData() {
        fetchWeather()
        fetchPollution()
    }
}
