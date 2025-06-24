import SwiftUI

@Observable
final class NowPlayingState {
  var music: Music?
  var duration: TimeInterval = 0.0
  
  init(music: Music? = nil) {
    self.music = music
  }
}

struct NowPlayingView: View {
  @Environment(NowPlayingState.self) var state
  @State var soundVolume = 0.5
  @State var isShowLyrics = false
  @State var isPlaying = false
  
  var body: some View {
    @Bindable var state = state
    
    NavigationStack {
      VStack {
        VStack(spacing: 30) {
          Spacer()

          if let music = state.music {
            AsyncImage(url: music.artworkURL) { image in
              image
                .resizable()
                .clipShape(.rect(cornerRadius: 14))
                .aspectRatio(1, contentMode: .fit)
                .padding(20)
            } placeholder: {
              ProgressView()
            }
            
            HStack(spacing: 0) {
              VStack(alignment: .leading) {
                Text(music.name)
                  .font(.title.bold())
                Text(music.artist.name)
                  .font(.title2)
                  .foregroundStyle(.secondary)
              }
              Spacer()
              
              Menu {
                Group {
                  ControlGroup {
                    Button("Add", systemImage: "plus.circle") {
                      
                    }
                    Button("Favorite", systemImage: "star") {
                      
                    }
                    Button("Share", systemImage: "square.and.arrow.up") {
                      
                    }
                  }
                  
                  Divider()
                  
                  Button("View Credits", systemImage: "info.circle") {
                    
                  }
                  Button("Share Litycs...", systemImage: "quote.bubble") {
                    
                  }
                  Divider()
                  Button("Add to a Playlist...", systemImage: "text.badge.plus") {
                    
                  }
                  Divider()
                  Button("Create Station", systemImage: "badge.plus.radiowaves.forward") {
                    
                  }
                  Divider()
                  Button("Go to Album", systemImage: "music.pages") {
                    
                  }
                }
                .tint(.primary)
              } label: {
                Image(systemName: "ellipsis")
                  .padding(6)
              }
              .buttonStyle(.bordered)
              .buttonBorderShape(.circle)
            }
            
            VStack {
              Slider(value: $state.duration, in: 0...(state.music?.length ?? 0))
              HStack {
                let formatter: DateComponentsFormatter = {
                  let formatter = DateComponentsFormatter()
                  formatter.allowedUnits = [.minute, .second]
                  formatter.unitsStyle = .positional
                  formatter.zeroFormattingBehavior = [.pad]
                  return formatter
                }()
                Text(formatter.string(from: state.duration)!)
                Spacer()
                Text(formatter.string(from: state.duration - (state.music?.length ?? 0))!)
              }
              .font(.caption)
              .foregroundStyle(.secondary)
            }
            
            HStack {
              Spacer()
              Button {
                
              } label: {
                HStack(spacing: 0) {
                  Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                  Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                }
                .compositingGroup()
                .contentTransition(.symbolEffect(.replace, options: .default))
              }
              Spacer()
              Button {
                isPlaying.toggle()
              } label: {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                  .resizable()
                  .frame(width: 40, height: 40)
                  .contentTransition(.symbolEffect(.replace, options: .default))
              }
              Spacer()
              Button {
                
              } label: {
                HStack(spacing: 0) {
                  Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                  Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                }
                .compositingGroup()
                .contentTransition(.symbolEffect(.replace, options: .default))
              }
              Spacer()
            }

            HStack {
              Image(systemName: "volume.fill")
              Slider(value: $soundVolume, in: 0...1)
              Image(systemName: "volume.3.fill")
            }
            
            HStack {
              Spacer()
              Button {
                isShowLyrics.toggle()
              } label: {
                Image(systemName: "quote.bubble")
                  .symbolVariant(isShowLyrics ? .fill : .none)
              }
              Spacer()
              Button {
                
              } label: {
                Image(systemName: "airplay.audio")
              }
              Spacer()
              Button {
                
              } label: {
                Image(systemName: "list.bullet")
              }
              Spacer()
            }
            Spacer()
          }
        }
        .padding(.horizontal, 30)
        .foregroundStyle(.white)
      }
      .background(state.music?.color ?? .secondary)
      .tint(.white)
    }
  }
}

#Preview {
  NowPlayingView()
    .environment(NowPlayingState(music: .unofficial))
}

extension Music {
  static let union = Self(
    name: "Union",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music221/v4/f0/5a/91/f05a91ee-b7bb-e654-1c88-1ff0c847dc9e/25UMGIM60711.rgb.jpg/316x316bb.webp")!,
    releaseDate: .now.addingTimeInterval(-10000000),
    artist: .dukeDumont,
    length: 60 * 3 + 15,
    color: Color.cyan
  )
  static let mySoftMachine = Self(
    name: "My Soft Machine",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/b3/71/24/b3712425-be1d-925d-5b88-dbfa1d1a0f91/5400863128395_cover.jpg/316x316bb.webp")!,
    releaseDate: .now.addingTimeInterval(-20000000),
    artist: .arloParks,
    length: 60 * 3 + 15,
    color: .blue
  )
  static let togenkyo = Self(
    name: "togenkyo",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/7d/f7/16/7df7162f-fa7e-e2cf-0645-ac0f1f86dacb/4547366569926.jpg/316x316bb.webp")!,
    releaseDate: .now.addingTimeInterval(-30000000),
    artist: .yama,
    length: 60 * 3 + 15,
    color: .pink
  )
  static let unofficial = Self(
    name: "UNOFFICIAL",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music111/v4/ca/1f/dc/ca1fdca8-4ab2-7934-1327-031df9553c72/4562256124283.jpg/316x316bf.webp")!,
    releaseDate: .now.addingTimeInterval(-40000000),
    artist: .theOralCigalettes,
    length: 60 * 3 + 15,
    color: .pink
  )
}
