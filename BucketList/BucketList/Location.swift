//	
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
  let id: UUID
  var name: String
  var description: String
  var latitude: Double
  var longitude: Double
}
