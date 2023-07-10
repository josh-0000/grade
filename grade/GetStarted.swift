//
//  GetStarted.swift
//  grade
//
//  Created by Joshua Gmys on 7/8/23.
//

import SwiftUI

struct GetStarted: View {
    @EnvironmentObject private var viewSwitcher: ViewSwitcher
    var body: some View {
        VStack {
            Button(action: {
                viewSwitcher.currentPage = "create class"
            }) {
                Text("Get Started")
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct GetStarted_Previews: PreviewProvider {
    static var previews: some View {
        GetStarted()
    }
}
