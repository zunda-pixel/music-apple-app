import SwiftUI

@Observable
final class NowPlayingState {
  var music: Music?
  var duration: TimeInterval = 0.0
  var playing = false
  
  init(music: Music? = nil) {
    self.music = music
  }
  
  func play() {
    playing = true
  }
  
  func pause() {
    playing = false
  }
}

struct NowPlayingView: View {
  @Environment(\.dismiss) var dismiss
  @Environment(NowPlayingState.self) var state
  @State var soundVolume = 0.5
  @State var isShowLyrics = false
  
  var body: some View {
    @Bindable var state = state
    
    NavigationStack {
      VStack {
        VStack(spacing: 30) {
          Capsule()
            .frame(maxWidth: .infinity, maxHeight: 20)
            .foregroundStyle(.clear)
            .contentShape(.capsule)
            .overlay {
              Capsule()
                .frame(width: 60, height: 5)
                .foregroundStyle(.primary.secondary)
            }
            .onTapGesture {
              dismiss()
            }

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
                if state.playing {
                  state.pause()
                } else {
                  state.play()
                }
              } label: {
                Image(systemName: state.playing ? "pause.fill" : "play.fill")
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
