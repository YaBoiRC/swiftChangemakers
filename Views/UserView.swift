//
//  UserView.swift
//  swiftChangemakers
//
//  Created by Alumno on 26/03/25.
//

import SwiftUI

struct UserView: View {
    @AppStorage("username") private var username = "Juan451"
    @State private var email = "juanpersonal123@gmail.com"
    @State private var showSettings = false
    @State private var forumThreads: [ForumThread] = sampleThreads
    @State private var selectedColor: Color = .blue
    
    var body: some View {
        NavigationView {
            VStack() {
                Text("👋 Hola ¡" + username + "!")
                    .font(.headline)
                VStack(spacing: 20){
                    // Profile Picture
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(selectedColor)
                        .padding(.top)
                    
                    Text(username)
                        .font(.title)
                        .bold()
                    
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showSettings = true
                    }) {
                        Image(systemName: "gearshape.fill")
                    }
                    .sheet(isPresented: $showSettings) {
                        SettingsView(selectedColor: $selectedColor)
                    }
                }
            }
        }
        .navigationTitle("User")
    }
}

struct SettingsView: View {
    @AppStorage("username") private var username: String = "Juan451"
    @State private var newUsername: String = ""
    @Binding var selectedColor: Color
    @State private var tappedColor: Color = .blue
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Username")
                    .font(.title3)
                    .bold()
                
                TextField("Nuevo nombre de usuario", text: $newUsername)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                
                Button {
                    if !newUsername.isEmpty {
                        username = newUsername
                        newUsername = ""
                    }
                } label: {
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
                
                Text("Background Color")
                    .font(.title3)
                    .bold()
                
                HStack {
                    ForEach([Color.blue, Color.green, Color.red, Color.orange, Color.purple, Color.yellow,], id: \.self) { color in
                        Circle()
                            .fill(color)
                            .frame(width: tappedColor == color ? 50 : 40, height: tappedColor == color ? 50 : 40)
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .onTapGesture {
                                withAnimation {
                                    selectedColor = color
                                    tappedColor = color
                                }
                            }
                            .padding(5)
                    }
                }
            }
            .padding()
            .navigationTitle("User Settings")
        }
    }
}

#Preview{
    UserView()
}
