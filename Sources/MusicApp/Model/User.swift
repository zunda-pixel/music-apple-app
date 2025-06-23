import Foundation

struct User: Identifiable {
  var id = UUID()
  var name: String
}

extension User {
  static let dukeDumont = Self(name: "Duke Dumont")
  static let arloParks = Self(name: "Arlo Parks")
  static let yama = Self(name: "yama")
  static let theOralCigalettes = Self(name: "THE ORAL CIGALETTES")
}
