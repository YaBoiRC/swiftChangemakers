//
//  BusinessCardView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

struct BusinessCardView: View {
    // Variables para configurar la tarjeta
    var backgroundImage: Image
    var logoImage: Image
    var name: String
    var description: String
    var contact: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Imagen de fondo
            backgroundImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            
            // Gradiente para mejorar la legibilidad del texto
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1), Color.clear]),
                           startPoint: .bottom,
                           endPoint: .center)
                .frame(height: 200)
            
            // Contenido: logo, nombre, descripción y contacto
            VStack(alignment: .leading, spacing: 8) {
                // Logo circular
                logoImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 4)
                
                // Nombre, descripción y contacto
                Text(name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text(contact)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding()
        }
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct BusinessCardView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCardView(
            backgroundImage: Image("businessBackground"), // Asegúrate de tener esta imagen en Assets
            logoImage: Image("businessLogo"),             // Asegúrate de tener esta imagen en Assets
            name: "Nombre del Negocio",
            description: "Breve descripción del negocio.",
            contact: "Contacto: 123-456-7890"
        )
    }
}
