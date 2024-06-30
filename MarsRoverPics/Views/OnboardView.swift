import SwiftUI

struct OnboardView: View {
    @Binding var isOnboardShown: Bool
    @State var selectedView = 0
    
    var body: some View {
        TabView(selection: $selectedView) {
            VStack(spacing: 15) {
                Label("Mars Rover-Picture", systemImage: "photo.circle")
                    .font(.title)
                Text("Watch pictures from Mars taken by mobile robots")
                LargeButton(caption: "Go to next screen") {
                    selectedView = 1
                }
                Spacer()
            }.tag(0)
            VStack(alignment: .leading, spacing: 15) {
                Label("Instructions", systemImage: "scroll")
                    .font(.title2)
                Text("- Use the menu on top of the screen to choose between different cameras.")
                Text("- Scroll up and down within the list of pictures.")
                Text("- Click upon a specific picture to see a larger view of the picture, as well as the picture-metadata.")
                LargeButton(caption: "Go to previous screen") {
                    selectedView = 0
                }
                LargeButton(caption: "I got it. Let's go.", color: .green) {
                    isOnboardShown = false
                }
                Spacer()
            }.tag(1)
        }.tabViewStyle(.page(indexDisplayMode: .never))
            .padding(.horizontal, 25)
            .padding(.vertical, 25)
    }
}

#Preview {
    OnboardView(isOnboardShown: .constant(false))
}
