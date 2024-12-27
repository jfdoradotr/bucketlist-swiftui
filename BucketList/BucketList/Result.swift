//	
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

struct Result: Codable {
  let query: Query
}

struct Query: Codable {
  let pages: [Int: Page]
}

struct Page: Codable, Comparable {
  let pageId: Int
  let title: String
  let terms: [String: [String]]?

  enum CodingKeys: String, CodingKey {
    case pageId = "pageid"
    case title
    case terms
  }

  var description: String {
    terms?["description"]?.first ?? "No further information"
  }

  static func <(lhs: Page, rhs: Page) -> Bool {
    lhs.title < rhs.title
  }
}
