//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct EditView: View {
  @Environment(\.dismiss) var dismiss
  var onSave: (Location) -> Void

  @State private var viewModel: EditView.Model

  var body: some View {
    NavigationStack {
      Form {
        Section {
          TextField("Place name", text: $viewModel.name)
          TextField("Description", text: $viewModel.description)
        }

        Section("Nearby...") {
          switch viewModel.loadingState {
          case .loading:
            Text("Loading...")
          case .loaded:
            ForEach(viewModel.pages, id: \.pageId) { page in
              Text(page.title)
                .font(.headline)
              + Text(": ") +
              Text(page.description)
                .italic()
            }
          case .failed:
            Text("Please try again later.")
          }
        }
      }
      .navigationTitle("Place details")
      .toolbar {
        Button("Save") {
          onSave(viewModel.makeNewLocation())
          dismiss()
        }
      }
      .task {
        await viewModel.fetchNearbyPlaces()
      }
    }
  }

  init(location: Location, onSave: @escaping (Location) -> Void) {
    self.onSave = onSave
    _viewModel = State(initialValue: EditView.Model(location: location))
  }
}

#Preview {
  EditView(location: .example) { _ in }
}
