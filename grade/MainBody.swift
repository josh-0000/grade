//
//  MainBody.swift
//  grade
//
//  Created by Joshua Gmys on 7/7/23.
//

import SwiftUI

struct MainBody: View {
    @EnvironmentObject private var viewSwitcher: ViewSwitcher
    @EnvironmentObject private var semester: SemesterList
    
    var body: some View {
        VStack {
            //if there are no semesters display a spacer to get the message in the middle of the screen
            if(!semester.all.isEmpty){
                Spacer(minLength: 10)
            }
            //Button to go to create semester page
            Button(action: {
                viewSwitcher.currentPage = "create semester"
            }) {
                Text("Create Semester")
            }.foregroundColor(Color.white)
            
            //if semester had info display a scroll view with the semesters
            if(!semester.all.isEmpty){
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(semester.all, id: \.self) { sem in
                            Button(action: {
                            }) {
                                Color.blue
                                    .frame(width:300, height: 50)
                                    .overlay(
                                        Text(sem)
                                            .foregroundColor(.white)
                                    )
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
            }
                        if(!semester.all.isEmpty){
                Spacer()
            }
        }
    }
}

struct MainBody_Previews: PreviewProvider {
    static var previews: some View {
        MainBody().environmentObject(SemesterList())
    }
}
