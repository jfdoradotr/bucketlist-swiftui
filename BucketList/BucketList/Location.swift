//	
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation
import MapKit

struct Location: Codable, Equatable, Identifiable {
  let id: UUID
  var name: String
  var description: String
  var latitude: Double
  var longitude: Double

  var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
