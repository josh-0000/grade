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

struct Settings: View {
    @EnvironmentObject private var viewSwitcher: ViewSwitcher
    
    var body: some View {
        Text("Settings")
        
    }
}

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
            }
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


struct SemesterInputField: View {
    @EnvironmentObject private var viewSwitcher: ViewSwitcher
    @EnvironmentObject private var semester: SemesterList
    @State private var semesterYear: String = ""
    @State private var semesterSeason: String = ""
    
    var body: some View {
        VStack {
            Text("New Semester")
            // input field for season
            TextField("Season", text: $semesterSeason)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // input field for year
            TextField("Year", text: $semesterYear)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
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
            }
        }
        .padding()
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
                Settings()
            } else if viewSwitcher.currentPage == "create semester" {
                SemesterInputField()
            }
            Spacer()
        }
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
