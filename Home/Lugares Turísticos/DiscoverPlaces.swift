//
//  DiscoverPlaces.swift
//  swiftChangemakers
//
//  Created by Alumno on 29/03/25.
//

import SwiftUI
import MapKit

// Estructura de las caracteristicas de los lugares turisticos
struct DiscoverPlace: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let coordinate: CLLocationCoordinate2D
}

// Lugares turísticos para Monterrey
let monterreyPlaces: [DiscoverPlace] = [
    DiscoverPlace(
        name: "Parque Fundidora",
        imageName: "Parque Fundidora",
        coordinate: CLLocationCoordinate2D(latitude: 25.6866, longitude: -100.3161)
    ),
    DiscoverPlace(
        name: "Barrio Antiguo",
        imageName: "barrioAntiguo",
        coordinate: CLLocationCoordinate2D(latitude: 25.6745, longitude: -100.3325)
    ),
    DiscoverPlace(
        name: "Museo MARCO",
        imageName: "museoMARCO",
        coordinate: CLLocationCoordinate2D(latitude: 25.6710, longitude: -100.3161)
    ),
    DiscoverPlace(
        name: "Cerro de la Silla",
        imageName: "cerroDeLaSilla",
        coordinate: CLLocationCoordinate2D(latitude: 25.7010, longitude: -100.3060)
    ),
    DiscoverPlace(
        name: "Chipinque",
        imageName: "chipinque",
        coordinate: CLLocationCoordinate2D(latitude: 25.7513, longitude: -100.2782)
    )
]

// Lugares turísticos para Guadalajara
let guadalajaraPlaces: [DiscoverPlace] = [
    DiscoverPlace(
        name: "Teatro Degollado",
        imageName: "teatroDegollado",
        coordinate: CLLocationCoordinate2D(latitude: 20.6747, longitude: -103.3474)
    ),
    DiscoverPlace(
        name: "Instituto Cultural Cabañas",
        imageName: "cabanas",
        coordinate: CLLocationCoordinate2D(latitude: 20.6730, longitude: -103.3440)
    ),
    DiscoverPlace(
        name: "Catedral de Guadalajara",
        imageName: "catedralGuadalajara",
        coordinate: CLLocationCoordinate2D(latitude: 20.6739, longitude: -103.3481)
    ),
    DiscoverPlace(
        name: "Mercado Libertad",
        imageName: "mercadoLibertad",
        coordinate: CLLocationCoordinate2D(latitude: 20.6735, longitude: -103.3447)
    ),
    DiscoverPlace(
        name: "Parque Agua Azul",
        imageName: "parqueAguaAzul",
        coordinate: CLLocationCoordinate2D(latitude: 20.6917, longitude: -103.3500)
    )
]
