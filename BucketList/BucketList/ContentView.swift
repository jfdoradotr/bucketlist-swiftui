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

  @State private var viewModel = ContentView.Model()

  var body: some View {
    MapReader { proxy in
      Map(initialPosition: startPosition) {
        ForEach(viewModel.locations) { location in
          Annotation(location.name, coordinate: location.coordinate) {
            Image(systemName: "star.circle")
              .resizable()
              .foregroundStyle(.red)
              .frame(width: 44, height: 44)
              .background(.white)
              .clipShape(.circle)
              .onLongPressGesture {
                viewModel.selectedPlace = location
              }
          }
        }
      }
      .onTapGesture { position in
        if let coordinate = proxy.convert(position, from: .local) {
          viewModel.addLocation(at: coordinate)
        }
      }
      .sheet(item: $viewModel.selectedPlace) { place in
        EditView(location: place) {
          viewModel.update(location: $0)
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
