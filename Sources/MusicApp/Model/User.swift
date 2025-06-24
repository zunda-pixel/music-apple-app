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
  static let enaMori = Self(name: "ena mori")
  static let doloresFoever = Self(name: "Dolores Forever")
  static let tomASmith = Self(name: "Tom A. Smith")
}
