//
//  UserView.swift
//  swiftChangemakers
//
//  Created by Alumno on 26/03/25.
//

import SwiftUI

struct UserView: View {
    // Cargamos el usuario base el AppStorage y su informacion basica
    @AppStorage("username") private var username = "Juan451"
    @State private var email = "juanpersonal123@gmail.com"
    @State private var selectedColor: Color = .blue
    
    var body: some View {
        NavigationView {
            List {
                // Informacion del usuario
                Section(header: Text("User Information")) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(selectedColor)
                            .offset(y: 3)
                        // Despliegua el usuario y su correo electronico
                        Text(username)
                            .font(.title)
                    }
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Section {
                    // Una tab para los ajustes
                    DisclosureGroup("Settings") {
                        SettingsView(selectedColor: $selectedColor)
                    }
                }
            }
            .navigationTitle("👋 Hola ¡" + username + "!")
        }
    }
}

// Ajustes para personalizacion del usuario
struct SettingsView: View {
    @AppStorage("username") private var username: String = "Juan451"
    @State private var newUsername: String = ""
    @Binding var selectedColor: Color
    @State private var tappedColor: Color = .blue
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Username")
                .font(.title3)
            
            // Cambio de usuario
            TextField("Nuevo nombre de usuario", text: $newUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .cornerRadius(10)
                .shadow(radius: 2)

            // Cambio de color de fondo
            // No se permite cambiar la IMAGEN especificamente
            Text("Background Color")
                .font(.title3)
            
            HStack {
                ForEach([Color.blue, Color.green, Color.red, Color.orange, Color.purple, Color.yellow,], id: \.self) { color in
                    Circle()
                        .fill(color)
                        .frame(width: tappedColor == color ? 50 : 40, height: tappedColor == color ? 50 : 40)
                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        .onTapGesture {
                            withAnimation {
                                selectedColor = color
                                tappedColor = color
                            }
                        }
                }
            }
            
            // Checa que el usuario del textbox si tenga alguna letra para el usuario
            Button {
                if !newUsername.isEmpty {
                    username = newUsername
                    newUsername = ""
                }
            } label: {
                // Boton para guardar cambios del usuario y fondo del icono
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Guardar")
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 2)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview{
    UserView()
}
