import SwiftUI

struct HomeView: View {
  @Environment(NowPlayingState.self) var nowPlayingState
  @State var musics: [Music] = [
    .union,
    .unofficial,
    .mySoftMachine,
    .togenkyo,
    .sink,
    .iLoveYouButYoureMakingMeSad,
    .lover,
    .somedayBest,
    .cloudILiveWithBeingFake,
    .ep2,
    .getMeStarted,
    .dragonfly
  ]
  
  var body: some View {    
    NavigationStack {
      List {
        Section("Top Picks for You") {
          ScrollView(.horizontal) {
            LazyHStack {
              ForEach(musics) { music in
                VStack {
                  AsyncImage(url: music.artworkURL) { image in
                    image
                      .resizable()
                      .frame(width: 200, height: 220)

                  } placeholder: {
                    ProgressView()
                  }
                  
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
        
        Section {
          ScrollView(.horizontal) {
            LazyHStack {
              ForEach(musics) { music in
                VStack {
                  AsyncImage(url: music.artworkURL) { image in
                    image
                      .resizable()
                      .frame(width: 150, height: 150)
                      .clipShape(.rect(cornerRadius: 10))
                  } placeholder: {
                    ProgressView()
                  }
                  Text(music.name)
                    .font(.caption.bold())
                  Text(music.artist.name)
                    .font(.caption2)
                  Text(music.releaseDate, format: .dateTime.year())
                    .font(.caption2)
                }
                .contentShape(.rect)
                .onTapGesture {
                  nowPlayingState.music = music
                }
              }
            }
          }
          .scrollIndicators(.hidden)
        } header: {
          Button {
            
          } label: {
            HStack {
              Text("Recently Played")
              Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
            }
          }
          .tint(.primary)
        }
        .listRowSeparator(.hidden)
        
        Section("Made for You") {
          ScrollView(.horizontal) {
            LazyHStack {
              ForEach(musics) { music in
                VStack {
                  AsyncImage(url: music.artworkURL) { image in
                    image
                      .resizable()
                      .frame(width: 200, height: 220)

                  } placeholder: {
                    ProgressView()
                  }
                  
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
      .navigationTitle("Home")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Image(systemName: "person.crop.circle")
        }
      }
    }
  }
}

#Preview {
  HomeView()
    .environment(NowPlayingState())
}
