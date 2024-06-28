import Foundation

@Observable
class ContentViewModel {
    var photos = [Photo]()
    
    func loadPhotos(selectedCam: Cam) async {
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            var cam = ""
            
            switch selectedCam {
            case .front:
                cam = "fhaz"
            case .rear:
                cam = "rhaz"
            case .mast:
                cam = "mast"
            case .nav:
                cam = "navcam"
            }
            
            let oURL = URL(string: "\(Consts.baseURL)?sol=1000&camera=\(cam)&api_key=\(apiKey)")
            
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
