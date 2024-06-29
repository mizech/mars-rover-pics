import SwiftUI

struct ContentView: View {
    @Environment(ContentViewModel.self) var contentVM
    @State var selectedCam = Cam.front
    
    var body: some View {
        VStack(spacing: 25) {
            Picker("Camera", selection: $selectedCam) {
                ForEach(Cam.allCases, id: \.self) { cam in
                    Text(cam.rawValue)
                        .tag(cam)
                }
            }
            List {
                ForEach(contentVM.photos) { photo in
                    Section {
                        AsyncImage(url: URL(string: photo.img_src)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(6)
                        } placeholder: {
                            ProgressView()
                        }
                        Text("Taken on: \(photo.earth_date)")
                    }
                }
            }.listStyle(.plain)
        }
        .padding()
        .task {
            await contentVM.loadPhotos(selectedCam: selectedCam)
        }
        .onChange(of: selectedCam) { oldValue, newValue in
            Task {
                await contentVM.loadPhotos(selectedCam: selectedCam)
            }
        }
    }
}

#Preview {
    ContentView()
}
