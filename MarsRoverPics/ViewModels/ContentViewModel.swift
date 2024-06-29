import Foundation

@Observable
class ContentViewModel {
    var photos = [Photo]()
    
    func loadPhotos(selectedCam: Cam) async {
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            var abbr = ""
            
            switch selectedCam {
            case .front:
                abbr = "fhaz"
            case .rear:
                abbr = "rhaz"
            case .mast:
                abbr = "mast"
            case .nav:
                abbr = "navcam"
            }
            
            let url = URL(string: "\(Consts.baseURL)?sol=1000&camera=\(abbr)&api_key=\(apiKey)")
            
            if let url = url {
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
