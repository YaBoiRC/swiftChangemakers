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
                ScrollView{
                    VStack{
                        BusinessCardView(
                            backgroundImage: Image("Bazares"),
                            logoImage: Image("Bazar logo"),
                            name: "Bazar del Mercado",
                            description: "Ven y descubre lo mejor de la ciudad",
                            contact: "Tel: 555-1234"
                        ).padding(.top, 20)
                        
                        BusinessCardView(
                            backgroundImage: Image("Coffee Shop"),
                            logoImage: Image("Coffee Shop Logo"),
                            name: "Cafetería Local",
                            description: "Despiértate con nuestro exquisito espresso",
                            contact: "Tel: 555-1234"
                        ).padding(.top, 10)
                        
                        BusinessCardView(
                            backgroundImage: Image("Cleaning Service"),
                            logoImage: Image("Cleaning Logo"),
                            name: "Limpieza",
                            description: "En menos de 5 horas tu casa estará limpia.",
                            contact: "Tel: 555-1234"
                        ).padding(.top, 10)
                        
                        BusinessCardView(
                            backgroundImage: Image("Local Restaurant"),
                            logoImage: Image("Mr Kebabs"),
                            name: "Restaurante Kebabs",
                            description: "Comida tradicional con un toque moderno.",
                            contact: "Tel: 555-1234"
                        ).padding(.top, 10).padding(.bottom, 10)
                        
                    }
                }
                .navigationBarTitle("Patrocinado")
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


