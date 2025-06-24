import SwiftUI

struct NowPlayingBottomAccesory: View {
  let music: Music
  
  // FIXME: tabViewBottomAccessoryPlacement has no value on iOS 26 beta 2
  @Environment(\.tabViewBottomAccessoryPlacement) var tabViewBottomAccessoryPlacement
  
  var body: some View {
    HStack(alignment: .center, spacing: 10) {
      AsyncImage(url: music.artworkURL) { image in
        image
          .resizable()
          .frame(maxWidth: 30, maxHeight: 30)
          .clipShape(.rect(cornerRadius: 10))
        
      } placeholder: {
        ProgressView()
      }
      .padding(.leading, 5)
      
      VStack(alignment: .leading, spacing: 0) {
        Text(music.name)
          .font(.caption)
        Text(music.artist.name)
          .foregroundStyle(.secondary)
          .font(.caption2)
      }
      
      Spacer()
      
      Button {
        
      } label: {
        Image(systemName: "play.fill")
      }
      
      if let tabViewBottomAccessoryPlacement {
        switch tabViewBottomAccessoryPlacement {
        case .inline:
          Spacer()
            .frame(maxWidth: 15)
          Button {
            
          } label: {
            HStack(spacing: 0) {
              Image(systemName: "play.fill")
              Image(systemName: "play.fill")
            }
          }
        case .expanded:
          EmptyView()
        default:
          fatalError()
        }
      }
    }
  }
}

#Preview {
  NowPlayingBottomAccesory(music: .mySoftMachine)
}
