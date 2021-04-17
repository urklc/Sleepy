//
//  DashboardRequest.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

struct DashboardRequest: Request {

    let endpoint: Endpoint

    init(blobID: String) {
        endpoint = BlobEndpoint(blobID: blobID)
    }
}
