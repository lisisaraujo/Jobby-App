import SwiftUI
import SwiftData

struct ContentView: View {
    
    @AppStorage("username")
     var username: String = ""
    
    @AppStorage("appStart")
     var isAppStarted: Bool = false
    
    
    
    
    var body: some View {
            VStack {
                if !isAppStarted {
                    WelcomeScreenView(username: $username, isAppStarted: $isAppStarted)
                } else {
                   HomeView()
                }
            }
            .padding()
            .modelContainer(for: [
                Job.self
                           ])
        }
    
}

#Preview {
    ContentView()
}
