//
//  BaseView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

/*
struct BaseView: View {
    @State var showMenu: Bool = false
    
    //Hiding Native One
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab = "Home"
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        
        //Whole Nav View
        NavigationView {
            HStack(spacing:0){
                
                //Side menu
                SideMenu(showMenu: $showMenu)
                
                //Main Tab View
                /*VStack(spacing:0){
                    TabView(selection: $currentTab){
                        MarketView((showMenu: .constant(true))).navigationBarTitleDisplayMode(.inline).navigationBarHidden(true)
                    }*/
                    
                    //CustonTab Bar
                    HStack(spacing:0){
                        
                    }
                }
                .frame(width: getRect().width)
            }
            //MaxSize
            .frame(width: getRect().width + sideBarWidth ).offset(x: sideBarWidth / 2)
            //No Nav Bar title
            //Hiding nav bar
            .navigationBarTitleDisplayMode(.inline).navigationBarHidden(true)
        }
    }
    /*
    @ViewBuilder
    func TabButton(image: String)-> some View{
        Button{
            
        }label:{
            Image(image).resizable().renderingMode(.template).aspectRatio(contentMode: .fit).frame(width:23, height: 22).foregroundColor(currentTab == image ? .primary : .gray)
        }
    }
*/
*/
/*
struct BaseView: View {
    @State var showMenu: Bool = false
    @State var currentTab = "Home"
    
    var body: some View {
        let sideBarWidth = getRect().width - 90
        
        ZStack(alignment: .leading) {
            // Vista principal (TabView o similar)
            TabView(selection: $currentTab) {
                MarketView(showMenu: $showMenu)
                    .tabItem {
                        Image(systemName: "bag.fill")
                        Text("Market")
                    }
                // Otras pestañas
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                // ...
            }
            // Aplica desplazamiento cuando el menú esté activo
            .offset(x: showMenu ? sideBarWidth : 0)
            .disabled(showMenu) // Evita interacción con la vista principal cuando el menú está abierto
            
            // Menú lateral
            if showMenu {
                SideMenu(showMenu: $showMenu)
                    .frame(width: sideBarWidth)
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: showMenu)
    }
}

#Preview {
    BaseView()
}
*/
