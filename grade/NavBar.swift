//
//  NavBar.swift
//  grade
//
//  Created by Joshua Gmys on 7/7/23.
//

import SwiftUI

struct NavBar: View {
    @EnvironmentObject private var viewSwitcher: ViewSwitcher
    
    var body: some View {
        VStack {
            Color.blue // Change the color here
                .frame(width: UIScreen.main.bounds.width, height: 130)
                .overlay(
                    HStack{
                        Button(action: {
                            viewSwitcher.currentPage = "main"
                        }){
                            Text("Gradebook")
                                .bold()
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .position(x: 80, y: 95)
                        }
                        Button(action: {
                            viewSwitcher.currentPage = "settings"
                        }) {
                            Image("settings")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .position(x:150, y:95)
                                
                        }
                    }
                )
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
