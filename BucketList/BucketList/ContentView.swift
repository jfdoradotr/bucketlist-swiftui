//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import MapKit
import SwiftUI

struct ContentView: View {
  let startPosition = MapCameraPosition.region(
    MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
      span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )
  )

  @State private var locations = [Location]()

  var body: some View {
    MapReader { proxy in
      Map(initialPosition: startPosition)
        .onTapGesture { position in
          if let coordinate = proxy.convert(position, from: .local) {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
            locations.append(newLocation)
          }
        }
    }
  }
}

#Preview {
  ContentView()
}
