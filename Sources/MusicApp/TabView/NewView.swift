import SwiftUI

struct NewView: View {
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
        Section("NEW SONGS + UPCOMING ALBUM") {
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
        
        Section("Latest Songs") {
          ScrollView(.horizontal) {
            LazyHGrid(
              rows: .init(repeating: .init(), count: 4),
              spacing: 0
            ) {
              ForEach(musics) { music in
                HStack {
                  AsyncImage(url: music.artworkURL) { image in
                    image
                      .resizable()
                      .frame(width: 50, height: 50)
                      .clipShape(.rect(cornerRadius: 10))
                  } placeholder: {
                    ProgressView()
                  }
                
                  HStack {
                    VStack(alignment: .leading, spacing: 0) {
                      Text(music.name)
                      Text(music.artist.name)
                        .font(.caption)
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
                  }
                }
                .frame(width: 320, alignment: .leading)
                .padding(.trailing, 10)
              }
            }
            .scrollTargetLayout()
          }
          .scrollIndicators(.hidden)
          .scrollTargetBehavior(.viewAligned)
        }
        .listRowSeparator(.hidden)
        
        Section {
          ScrollView(.horizontal) {
            LazyHGrid(
              rows: .init(repeating: .init(), count: 2),
              spacing: 10
            ) {
              ForEach(musics) { music in
                VStack(alignment: .leading, spacing: 0) {
                  AsyncImage(url: music.artworkURL) { image in
                    image
                      .resizable()
                      .aspectRatio(1, contentMode: .fit)
                      .clipShape(.rect(cornerRadius: 10))
                  } placeholder: {
                    ProgressView()
                  }
                  Text(music.name)
                    .lineLimit(1)
                  Text(music.artist.name)
                    .lineLimit(1)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }
                .frame(width: 150, height: 150)
              }
            }
            .scrollTargetLayout()
          }
          .scrollIndicators(.hidden)
          .scrollTargetBehavior(.viewAligned)
        } header: {
          Button {
            
          } label: {
            HStack {
              Text("New Releases")
              Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
            }
          }
          .tint(.primary)
        }
        .listRowSeparator(.hidden)
      }
      .listStyle(.plain)
      .navigationTitle("New")
    }
  }
}

#Preview {
  NewView()
    .environment(NowPlayingState())
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
    color: .yellow
  )
  static let unofficial = Self(
    name: "UNOFFICIAL",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music111/v4/ca/1f/dc/ca1fdca8-4ab2-7934-1327-031df9553c72/4562256124283.jpg/316x316bf.webp")!,
    releaseDate: .now.addingTimeInterval(-40000000),
    artist: .theOralCigalettes,
    length: 60 * 3 + 15,
    color: .pink
  )
  static let sink = Self(
    name: "Sink",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music221/v4/99/d9/df/99d9dfa2-a0dc-4337-e802-3335c792da9e/196873231440.jpg/600x600bb-60.jpg")!,
    releaseDate: .now.addingTimeInterval(-40000000),
    artist: .enaMori,
    length: 60 * 3 + 15,
    color: .pink
  )
  static let iLoveYouButYoureMakingMeSad = Self(
    name: "I Love You But You're Making Me Sad",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/08/fb/44/08fb446f-7e5a-b1c8-f181-41632d527003/197189004940.jpg/316x316bb.webp")!,
    releaseDate: .now.addingTimeInterval(-40000000),
    artist: .doloresFoever,
    length: 60 * 3 + 15,
    color: Color.brown
  )
  static let lover = Self(
    name: "LOVER",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music221/v4/45/25/78/452578de-b78f-912b-2985-6f923291d25f/198704007934_Cover.jpg/316x316bb.webp")!,
    releaseDate: .now.addingTimeInterval(-40000000),
    artist: .doloresFoever,
    length: 60 * 3 + 15,
    color: .red
  )
  static let somedayBest = Self(
    name: "Someday Best",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/7f/34/3a/7f343ad7-96f0-2406-df77-cb9b51f55ee1/197190777758.jpg/316x316bb.webp")!,
    releaseDate: .now.addingTimeInterval(-40000000),
    artist: .doloresFoever,
    length: 60 * 3 + 15,
    color: Color.brown
  )
  static let cloudILiveWithBeingFake = Self(
    name: "Could I Live With Being Fake",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/aa/5a/37/aa5a37e9-6354-3198-8dbf-f67811450345/190296153372.jpg/316x316bb.webp")!,
    releaseDate: .now.addingTimeInterval(-40000000),
    artist: .tomASmith,
    length: 60 * 3 + 15,
    color: .black
  )
  static let ep2 = Self(
    name: "EP 2",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/90/2c/92/902c92f5-ee64-3ce9-eb00-3d7c7dac8f7e/5054197218521.jpg/316x316bb.webp")!,
    releaseDate: .now.addingTimeInterval(-40000000),
    artist: .tomASmith,
    length: 60 * 3 + 15,
    color: .blue
  )
  static let getMeStarted = Self(
    name: "Get Me Started",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/13/27/3c/13273c99-102f-1fe4-2826-7020f87b19da/085365693555.jpg/316x316bb.webp")!,
    releaseDate: .now.addingTimeInterval(-40000000),
    artist: .tomASmith,
    length: 60 * 3 + 15,
    color: .red
  )
  static let dragonfly = Self(
    name: "Dragonfly",
    artworkURL: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/bd/b8/dc/bdb8dc2a-0337-db0b-f00b-bde81d13ec9a/190296316715.jpg/316x316bb.webp")!,
    releaseDate: .now.addingTimeInterval(-40000000),
    artist: .tomASmith,
    length: 60 * 3 + 15,
    color: .black
  )
}
