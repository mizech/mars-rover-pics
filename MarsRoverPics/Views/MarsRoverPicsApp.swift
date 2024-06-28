import SwiftUI

@main
struct MarsRoverPicsApp: App {
    @State var contentVM = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(contentVM)
        }
    }
}
