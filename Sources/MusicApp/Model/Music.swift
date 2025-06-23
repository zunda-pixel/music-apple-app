import SwiftUI

struct Music: Identifiable {
  var id = UUID()
  var name: String
  var artworkURL: URL
  var releaseDate: Date
  var artist: User
  var length: TimeInterval
  var color: Color
}

