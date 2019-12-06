//
//  ItemInformationExtensions.swift
//  VidLoaderTests
//
//  Created by Petre on 12/6/19.
//  Copyright © 2019 Petre. All rights reserved.
//

@testable import VidLoader

extension ItemInformation {
    static func mocked(identifier: String = "", title: String? = nil, path: String? = nil,
                       mediaLink: String = "", progress: Double = 0, state: DownloadState = .unknown,
                       downloadedBytes: Double = 0, artworkData: Data? = nil) -> ItemInformation {
        return ItemInformation(identifier: identifier, title: identifier, path: path,
                               mediaLink: mediaLink, progress: progress, state: state,
                               downloadedBytes: downloadedBytes, artworkData: artworkData)
    }
}
