//	
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import CoreLocation
import LocalAuthentication
import SwiftUI

extension ContentView {
  @Observable
  class Model {
    private(set) var locations: [Location]
    var selectedPlace: Location?
    let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
    var isUnlocked = false

    init() {
      do {
        let data = try Data(contentsOf: savePath)
        locations = try JSONDecoder().decode([Location].self, from: data)
      } catch {
        locations = []
      }
    }

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

    func save() {
      do {
        let data = try JSONEncoder().encode(locations)
        try data.write(to: savePath, options: [.atomic, .completeFileProtection])
      } catch {
        print("Unable to save data")
      }
    }

    func authenticate() {
      let context = LAContext()
      var error: NSError?

      if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        let reason = "Please authenticate yourself to unlock your places."
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
          if success {
            self.isUnlocked = true
          } else {
            // error
          }
        }
      } else {
        // no biometrics
      }
    }
  }
}
