import SwiftUI
import Combine

struct ViewState: View {
    @State private var isToggleOn = true
    
    var body: some View {
        PlayerView(title: "title")
    }
}

struct PlayerView: View {
    var title: String
    @State private var isPlaying = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding()
            PlayButton(isPlaying: $isPlaying)
                .font(.largeTitle)
        }
    }
}


struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button {
            self.isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
    }
}


struct ViewState_Previews: PreviewProvider {
    static var previews: some View {
        ViewState()
    }
}
