import Foundation

@Observable
class ContentViewModel {
    var photos = [Photo]()
    
    func loadPhotos() async {
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            let sURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=fhaz&api_key=\(apiKey)"
            let oURL = URL(string: sURL)
            
            if let url = oURL {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    photos = try JSONDecoder().decode(Photos.self, from: data).photos
                } catch {
                    print(error)
                }
            }
        }
    }
}
