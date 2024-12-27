//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct EditView: View {
  @Environment(\.dismiss) var dismiss
  var location: Location

  @State private var name: String
  @State private var description: String
  var onSave: (Location) -> Void

  var body: some View {
    NavigationStack {
      Form {
        Section {
          TextField("Place name", text: $name)
          TextField("Description", text: $description)
        }
      }
      .navigationTitle("Place details")
      .toolbar {
        Button("Save") {
          dismiss()
        }
      }
    }
  }

  init(location: Location, onSave: @escaping (Location) -> Void) {
    self.location = location
    self.onSave = onSave

    _name = State(initialValue: location.name)
    _description = State(initialValue: location.description)
  }
}

#Preview {
  EditView(location: .example) { _ in }
}
