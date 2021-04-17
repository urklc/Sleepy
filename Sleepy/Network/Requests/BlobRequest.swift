//
//  BlobRequest.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

final class BlobRequest: Request {

    let endpoint: Endpoint

    init(blobID: String) {
        endpoint = BlobEndpoint(blobID: blobID)
    }
}
