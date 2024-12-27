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

struct Page: Codable {
  let pageId: Int
  let title: String
  let terms: [String: [String]]?

  enum CodingKeys: String, CodingKey {
    case pageId = "pageid"
    case title
    case terms
  }
}
