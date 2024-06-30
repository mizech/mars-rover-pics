import SwiftUI

@main
struct MarsRoverPicsApp: App {
    @AppStorage("isOnboardViewShown") var isOnboardViewShown = true
    @State var contentVM = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(contentVM)
                .fullScreenCover(isPresented: $isOnboardViewShown) {
                    OnboardView(isOnboardShown: $isOnboardViewShown)
                }
        }
    }
}
