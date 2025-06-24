import SwiftUI

enum TabItem: CaseIterable {
  case home
  case new
  case radio
  case library
  case search
  
  var title: LocalizedStringKey {
    switch self {
    case .home: return "Home"
    case .new: return "New"
    case .radio: return "Radio"
    case .library: return "Library"
    case .search: return "Search"
    }
  }

  var systemImage: String {
    switch self {
    case .home: return "house"
    case .new: return "square.grid.2x2.fill"
    case .radio: return "dot.radiowaves.left.and.right"
    case .library: return "music.note.square.stack.fill"
    case .search: return "magnifyingglass"
    }
  }
}

public struct ContentView: View {
  @State var text = ""
  @State var isPresentedNowPlayingView = false
  @State var selectedTabItem: TabItem = .home
  @State var nowPlayingState = NowPlayingState(music: .union)
  @Namespace var namespace
  
  public init() {}
  
  @ViewBuilder
  func tabView(_ tabItem: TabItem) -> some View {
    switch tabItem {
    case .home: HomeView()
    case .new: NewView()
    case .radio: RadioView()
    case .library: LibraryView()
    case .search: SearchView()
    }
  }
  
  var swipeUpGesture: some Gesture {
    DragGesture()
      .onChanged {
        if $0.startLocation.y - $0.location.y > 60 {
          isPresentedNowPlayingView = true
        }
      }
  }
  
  public var body: some View {
    TabView(selection: $selectedTabItem) {
      ForEach(TabItem.allCases, id: \.self) { tabItem in
        Tab(value: tabItem, role: tabItem == .search ? .search : nil) {
          tabView(tabItem)
        } label: {
          Label(tabItem.title, systemImage: tabItem.systemImage)
        }
      }
    }
    .tabBarMinimizeBehavior(.onScrollDown)
    .tabViewBottomAccessory {
      if let music = nowPlayingState.music {
        NowPlayingBottomAccesory(music: music)
          .tint(.primary)
          .contentShape(.capsule)
          .onTapGesture {
            isPresentedNowPlayingView.toggle()
          }
          .padding(.leading, 10)
          .padding(.trailing, 15)
          .gesture(swipeUpGesture)
          .matchedTransitionSource(id: 1, in: namespace)
      }
    }
    .fullScreenCover(isPresented: $isPresentedNowPlayingView) {
      NowPlayingView()
        .navigationTransition(.zoom(sourceID: 1, in: namespace))
    }
    .tint(.pink)
    .searchable(text: $text)
    .environment(nowPlayingState)
  }
}

#Preview {
  ContentView()
}
