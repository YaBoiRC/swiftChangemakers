//
//  MarketView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//
import SwiftUI

// Vista principal de usuario con botón para abrir la sidebar
struct MarketView: View {
    @State private var showSidebar = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Text("Contenido del Mercado")
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                }
                .navigationBarTitle("Market")
                .navigationBarItems(leading: Button(action: {
                    withAnimation {
                        showSidebar.toggle()
                    }
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .foregroundColor(.blue)
                }))
            }
            
            // Fondo semitransparente para cerrar la sidebar al tocar fuera
            if showSidebar {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showSidebar.toggle()
                        }
                    }
                
                // Sidebar deslizable desde el borde izquierdo
                HStack {
                    SideBarView()
                        .transition(.move(edge: .leading))
                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#Preview {
    MarketView()
}


