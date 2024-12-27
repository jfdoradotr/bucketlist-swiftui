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

  var body: some View {
    Map(initialPosition: startPosition)
      .onTapGesture { position in
        print("Tapped at \(position)")
      }
  }
}

#Preview {
  ContentView()
}
