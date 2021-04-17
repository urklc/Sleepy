//
//  DashboardEndpoint.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

struct BlobEndpoint: Endpoint {

    private let blobID: String

    init(blobID: String) {
        self.blobID = blobID
    }

    var path: String {
        "api/jsonBlob/\(blobID)"
    }
}
