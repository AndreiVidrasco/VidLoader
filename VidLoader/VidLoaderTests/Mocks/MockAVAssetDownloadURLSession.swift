//
//  MockAVAssetDownloadURLSession.swift
//  VidLoaderTests
//
//  Created by Petre on 12/9/19.
//  Copyright © 2019 Petre. All rights reserved.
//

import AVFoundation
import Foundation
import VidLoader

final class MockAVAssetDownloadURLSession: URLSession, MyAssetDownloadURLSession {
    var getAllTaskFuncCheck = EmptyFuncCheck()
    var getAllTasksStub: [MockAVAssetDownloadTask] = []
    override func getAllTasks(completionHandler: @escaping ([URLSessionTask]) -> Void) {
        getAllTaskFuncCheck.call()
        completionHandler(getAllTasksStub)
    }
    
    var makeAssetDownloadTaskFuncCheck = FuncCheck<String>()
    var makeAssetDownloadTaskStub: MockAVAssetDownloadTask?
    func makeMyAssetDownloadTask(asset URLAsset: AVURLAsset,
                                 assetTitle title: String,
                                 assetArtworkData artworkData: Data?,
                                 options: [String : Any]? = nil) -> MyAssetDownloadTask? {
        makeAssetDownloadTaskFuncCheck.call(title)
        return makeAssetDownloadTaskStub
    }
}
