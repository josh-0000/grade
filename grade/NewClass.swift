//
//  NewClass.swift
//  grade
//
//  Created by Joshua Gmys on 7/7/23.
//
// Class name, wieghted or points, Class split
//

import SwiftUI

struct NewClass: View {
    @State private var className: String = ""
    @State private var type: String = "points"
    @State private var weightedFields: String = "false"
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            Group {
                Text("Create Class")
                
                Divider()
                    .padding(.vertical)
                
                Text("What is the name of your class?")
                
                TextField("Class Name", text: $className)
                    .frame(width:180,height: 50.0)
                    .padding(.horizontal, 50.0)
                    .cornerRadius(/*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    .background(RoundedRectangle(cornerRadius: 15).strokeBorder().padding(10))
                
                Text("How is your class graded?")
                    .padding(.top, 10.0)
                    
                
                Picker("type", selection: $type) {
                    Text("Points").tag("points")
                    Text("Weighted").tag("weighted")
                }
                .padding(.horizontal, 50.0)
                .pickerStyle(WheelPickerStyle())
                .padding(.top,-70)
                
                if (type == "points") {
                    
                    Button (action: {
                        
                    }){
                        Text("Submit")
                            .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                    }
                    .padding(.top, -30.0)
                    .background(Color.black)
                    
                } else {
                    
                    Button (action: {
                        
                        weightedFields = "true"
                        
                    }){
                        Text("Next")
                            .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                    }
                    .padding(.top, -30.0)
                }
            }
            .padding(.horizontal)
            
            Divider()
        }
    }
}


struct NewClass_Previews: PreviewProvider {
    static var previews: some View {
        NewClass()
    }
}
