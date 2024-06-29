import SwiftUI

struct ContentView: View {
    @Environment(ContentViewModel.self) var contentVM
    @State var selectedCam = Cam.front
    
    var body: some View {
        VStack(spacing: 25) {
            Button("Load Pictures") {
                Task {
                    await contentVM.loadPhotos(selectedCam: selectedCam)
                }
            }
            Picker("Camera", selection: $selectedCam) {
                ForEach(Cam.allCases, id: \.self) { cam in
                    Text(cam.rawValue)
                        .tag(cam)
                }
            }.pickerStyle(.wheel)
                .clipped()
            Spacer()
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
