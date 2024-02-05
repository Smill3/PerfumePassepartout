import SwiftUI

struct FailView: View {
    var body: some View {
        GeometryReader { geometry in
            
            Image("FailWin")
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height / 2)
            
            
        }
    }
}


#Preview {
    FailView()
}
