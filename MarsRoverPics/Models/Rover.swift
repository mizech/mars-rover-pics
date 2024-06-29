import Foundation

struct Rover: Codable, Identifiable {
    var id: Int
    var name: String
    var landing_date: String
    var launch_date: String
    var status: String
    var total_photos: Int
}
