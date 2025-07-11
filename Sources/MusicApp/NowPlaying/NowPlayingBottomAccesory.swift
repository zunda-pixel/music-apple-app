import SwiftUI
import Kingfisher

struct NowPlayingBottomAccesory: View {
  @Environment(NowPlayingState.self) var nowPlayingState
  let music: Music
  
  @Environment(\.tabViewBottomAccessoryPlacement) var tabViewBottomAccessoryPlacement

  var body: some View {
    switch tabViewBottomAccessoryPlacement ?? .expanded {
    case .inline:
      HStack(spacing: 10) {
        KFImage(music.artworkURL)
          .resizable()
          .frame(maxWidth: 30, maxHeight: 30)
          .clipShape(.rect(cornerRadius: 10))
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
          if nowPlayingState.playing {
            nowPlayingState.pause()
          } else {
            nowPlayingState.play()
          }
        } label: {
          Image(systemName: nowPlayingState.playing ? "pause.fill" : "play.fill")
        }
        .buttonStyle(.plain)
      }
    case .expanded:
      HStack(spacing: 10) {
        KFImage(music.artworkURL)
          .resizable()
          .frame(maxWidth: 30, maxHeight: 30)
          .clipShape(.rect(cornerRadius: 10))
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
          if nowPlayingState.playing {
            nowPlayingState.pause()
          } else {
            nowPlayingState.play()
          }
        } label: {
          Image(systemName: nowPlayingState.playing ? "pause.fill" : "play.fill")
        }
        .buttonStyle(.plain)
        
        Spacer()
          .frame(maxWidth: 3)
        
        Button {

        } label: {
          HStack(spacing: 0) {
            Image(systemName: "play.fill")
            Image(systemName: "play.fill")
          }
        }
        .buttonStyle(.plain)
      }
    default:
      fatalError()
    }
  }
}

#Preview {
  NowPlayingBottomAccesory(music: .mySoftMachine)
    .environment(NowPlayingState())
}
