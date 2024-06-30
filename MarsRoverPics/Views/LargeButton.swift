import SwiftUI

struct LargeButton: View {
    var caption: String = ""
    var color: Color = Color.blue
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(caption)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(color)
                .foregroundStyle(Color.white)
                .cornerRadius(12)
                .padding(.top, 25)
        }
    }
}

#Preview {
    LargeButton(action: {})
}
