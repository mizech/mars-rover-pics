import SwiftUI

struct ContentView: View {
    @Environment(ContentViewModel.self) var contentVM
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await contentVM.loadPhotos()
            print(contentVM.photos)
        }
    }
}

#Preview {
    ContentView()
}
