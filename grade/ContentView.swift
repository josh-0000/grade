import SwiftUI

class ViewSwitcher: ObservableObject {
    @Published var currentPage: String = "main"
}

class SemesterList: ObservableObject {
    @Published var all: [String] = []
    func addSemester(year: String, season: String) {
        
        let semester = "\(season) \(year)"
        if !all.contains(semester) {
            all.append(semester)
        }
        
    }
}

struct SemesterInputField: View {
    @EnvironmentObject private var viewSwitcher: ViewSwitcher
    @EnvironmentObject private var semester: SemesterList
    @State private var semesterYear: String = ""
    @State private var semesterSeason: String = ""
    
    var body: some View {
        VStack {
            Text("New Semester").foregroundColor(Color.blue)
                .padding(.top, 6.0)
                .padding()
            // input field for season
            TextField("Season", text: $semesterSeason)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // input field for year
            TextField("Year", text: $semesterYear)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding().foregroundColor(Color.white)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                
            
            // submit button
            Button(action: {
                guard !semesterYear.isEmpty && !semesterSeason.isEmpty else {
                    // Display an alert or error message indicating that fields are required
                    return
                }
                
                semester.addSemester(year: semesterYear, season: semesterSeason)
                viewSwitcher.currentPage = "main"
            }) {
                Text("Submit")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }.padding(.bottom, 20.0)
        }
        .background(Color.white)
        .cornerRadius(10)
        .frame(width:300,height:200)
    }
}

struct ContentView: View {
    @StateObject private var viewSwitcher = ViewSwitcher()
    @StateObject private var semester = SemesterList()
    var body: some View {
        VStack {
            NavBar()
            Spacer()
            if viewSwitcher.currentPage == "main" {
                MainBody()
            } else if viewSwitcher.currentPage == "settings" {
                settings()
            } else if viewSwitcher.currentPage == "create semester" {
                SemesterInputField()
            }
            Spacer()
        }
        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.all)
        .environmentObject(viewSwitcher)
        .environmentObject(semester)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewSwitcher = ViewSwitcher()
    static let semester = SemesterList()
    
    static var previews: some View {
        ContentView()
            .environmentObject(viewSwitcher)
            .environmentObject(semester)
    }
}
