import SwiftUI

struct ContentView: View {
    @Environment(ContentViewModel.self) var contentVM
    @State var currURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=mast&api_key=2gIfAt1DFeSbbkW3mhznlJy0hmntriwXCWBE1Dda"
    
    var body: some View {
        VStack(spacing: 25) {
            Button("Load Pictures") {
                print(currURL)
                Task {
                    await contentVM.loadPhotos(sURL: currURL)
                }
            }
            Picker("Camera", selection: $currURL) {
                Text("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=fhaz&api_key=2gIfAt1DFeSbbkW3mhznlJy0hmntriwXCWBE1Dda")
                    .tag("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=fhaz&api_key=2gIfAt1DFeSbbkW3mhznlJy0hmntriwXCWBE1Dda")
                Text("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=rhaz&api_key=2gIfAt1DFeSbbkW3mhznlJy0hmntriwXCWBE1Dda")
                    .tag("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=rhaz&api_key=2gIfAt1DFeSbbkW3mhznlJy0hmntriwXCWBE1Dda")
                Text("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=mast&api_key=2gIfAt1DFeSbbkW3mhznlJy0hmntriwXCWBE1Dda")
                    .tag("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=mast&api_key=2gIfAt1DFeSbbkW3mhznlJy0hmntriwXCWBE1Dda")
                Text("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=navcam&api_key=2gIfAt1DFeSbbkW3mhznlJy0hmntriwXCWBE1Dda")
                    .tag("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=navcam&api_key=2gIfAt1DFeSbbkW3mhznlJy0hmntriwXCWBE1Dda")
            }.pickerStyle(.wheel)
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
