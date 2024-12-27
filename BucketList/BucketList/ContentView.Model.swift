//	
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import CoreLocation
import SwiftUI

extension ContentView {
  @Observable
  class Model {
    private(set) var locations = [Location]()
    var selectedPlace: Location?

    func addLocation(at point: CLLocationCoordinate2D) {
      let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: point.latitude, longitude: point.longitude)
      locations.append(newLocation)
    }

    func update(location: Location) {
      guard let selectedPlace else { return }
      if let index = locations.firstIndex(of: selectedPlace) {
        locations[index] = location
      }
    }
  }
}
