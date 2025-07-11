import SwiftUI
import Kingfisher

struct RadioView: View {
  @Environment(NowPlayingState.self) var nowPlayingState
  @State var musics: [Music] = [
    .union,
    .unofficial,
    .mySoftMachine,
    .togenkyo,
  ]
  
  var body: some View {
    NavigationStack {
      List {
        Section("Top Picks for You") {
          ScrollView(.horizontal) {
            LazyHStack {
              ForEach(musics) { music in
                VStack {
                  KFImage(music.artworkURL)
                    .resizable()
                    .frame(width: 200, height: 220)
                  
                  Text(music.name)
                    .bold()
                  Text(music.artist.name)
                    .font(.caption)
                  Text(music.releaseDate, format: .dateTime.year())
                    .font(.caption)
                }
                .background(music.color)
                .clipShape(.rect(cornerRadius: 10))
                .contentShape(.rect)
                .onTapGesture {
                  nowPlayingState.music = music
                }
              }
            }
          }
          .scrollIndicators(.hidden)
        }
        .listRowSeparator(.hidden)
      }
      .listStyle(.plain)
      .navigationTitle("Radio")
    }
  }
}

#Preview {
  RadioView()
    .environment(NowPlayingState())
}
