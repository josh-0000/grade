import SwiftUI

class ViewSwitcher: ObservableObject {
    @Published var currentPage: String = "get started"
}

struct ContentView: View {
    @StateObject private var viewSwitcher = ViewSwitcher()
    var body: some View {
        VStack {
            NavBar()
            Spacer()
            if viewSwitcher.currentPage == "get started" {
                GetStarted()
            } else if viewSwitcher.currentPage == "main" {
                MainBody()
            } else if viewSwitcher.currentPage == "settings" {
                settings()
            } else if viewSwitcher.currentPage == "create class" {
                NewClass()
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .environmentObject(viewSwitcher)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewSwitcher = ViewSwitcher()
    
    static var previews: some View {
        ContentView()
            .environmentObject(viewSwitcher)
    }
}
