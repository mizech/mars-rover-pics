import SwiftUI

struct ContentView: View {
    @Environment(ContentViewModel.self) var contentVM
    
    var body: some View {
        VStack(spacing: 25) {
            Button("Load Pictures") {
                Task {
                    await contentVM.loadPhotos()
                }
            }
            List {
                ForEach(contentVM.photos) { photo in
                    Section {
                        AsyncImage(url: URL(string: photo.img_src))
                            .frame(width: 200)
                        Text("Taken on: \(photo.earth_date)")
                    }
                }
            }.listStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
