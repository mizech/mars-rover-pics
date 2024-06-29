import SwiftUI

struct PicDetails: View {
    var photo: Photo
    
    var body: some View {
        VStack(alignment: .leading) {
            Section(content: {
                Text("Rover launch-date: \(photo.rover.launch_date)")
                Text("Rover landing-date: \(photo.rover.landing_date)")
                Text("Rover status: \(photo.rover.status)")
                Text("Total photos taken by rover: \(photo.rover.total_photos)")
            }, header: {
                Text("Rover name: \(photo.rover.name)")
                    .font(.title2)
            })
            AsyncImage(url: URL(string: photo.img_src)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(6)
                    .padding(.top, 20)
            } placeholder: {
                ProgressView()
            }
            Text("Photo taken on: \(photo.earth_date)")
                .frame(maxWidth: .infinity)
            Spacer()
        }.padding()
    }
}

#Preview {
    PicDetails(photo: Photo(id: 1, img_src: "", 
                            earth_date: "",
                           rover: Rover(id: 1, name: "",
                                        landing_date: "",
                                        launch_date: "",
                                        status: "",
                                        total_photos: 3)))
}
