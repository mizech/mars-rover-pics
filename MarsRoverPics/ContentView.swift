import SwiftUI

struct ContentView: View {
    @State var contentVM = ContentViewModel()
    
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
