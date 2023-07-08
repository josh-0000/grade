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
        Color(hue: 1.0, saturation: 0.0, brightness: 0.397) // Change the color here
            .frame(width: UIScreen.main.bounds.width,
                   height: 130)
            .opacity(0.6)
            .overlay(
                VStack{
                    
                    Spacer(minLength:80)
                    
                    HStack {
                        Button(action: {
                            viewSwitcher.currentPage = "main"
                        }){
                            Image("h")
                                .resizable()
                                .frame(width:32,height: 32)
                        }
                        .padding(.leading, 16.0)
                        
                        Spacer()
                        
                        Button(action: {
                            viewSwitcher.currentPage = "settings"
                        }) {
                            Image("settings")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        .padding(.trailing, 16.0)
                        
                    }

                    Spacer()
                    
                }
                
            )
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
