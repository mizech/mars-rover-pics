import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
                let sURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=fhaz&api_key=\(apiKey)"
                let oURL = URL(string: sURL)
                
                if let url = oURL {
                    do {
                        let (data, _) = try await URLSession.shared.data(from: url)
                        let response = try JSONDecoder().decode(Photos.self, from: data)
                        print(response.photos)
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
