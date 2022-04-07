//
//  MockSession.swift
//  VidLoaderTests
//
//  Created by Petre on 12/11/19.
//  Copyright © 2019 Petre. All rights reserved.
//
import AVFoundation
@testable import VidLoader

final class MockSession: Session {
    func setup(injectedSession: MyAssetDownloadURLSession?, stateChanged: ((DownloadState, ItemInformation) -> Void)?) {
        setup(injectedSession: injectedSession as? MockAVAssetDownloadURLSession, stateChanged: stateChanged)
    }
    
    var allTasksFuncCheck = EmptyFuncCheck()
    var allTasksStub: [MyAssetDownloadTask] = []
    func allTasks(completion: Completion<[MyAssetDownloadTask]>?) {
        completion?(allTasksStub)
        allTasksFuncCheck.call()
    }
    
    var taskFuncCheck = FuncCheck<String>()
    var taskStub: MockAVAssetDownloadTask?
    func task(identifier: String, completion: Completion<MyAssetDownloadTask?>?) {
        taskFuncCheck.call(identifier)
        completion?(taskStub)
    }
    
    var addNewTaskFuncCheck = FuncCheck<(AVURLAsset, ItemInformation)>()
    var addNewTaskStub: MockAVAssetDownloadTask?
    func addNewTask(urlAsset: AVURLAsset, for item: ItemInformation) -> MyAssetDownloadTask? {
        addNewTaskFuncCheck.call((urlAsset, item))
        return addNewTaskStub
    }
    
    var cancelTaskFuncCheck = FuncCheck<String>()
    var cancelTaskStub: Bool = false
    func cancelTask(identifier: String, hasNotFound: @escaping () -> Void) {
        cancelTaskFuncCheck.call(identifier)
        if cancelTaskStub { hasNotFound() }
    }
    
    var sendKeyLoadedFuncCheck = FuncCheck<ItemInformation>()
    func sendKeyLoaded(item: ItemInformation) {
        sendKeyLoadedFuncCheck.call(item)
    }
    
    var suspendAllTasksFuncCheck = EmptyFuncCheck()
    func suspendAllTasks() {
        suspendAllTasksFuncCheck.call()
    }
    
    var resumeAllTasksFuncCheck = EmptyFuncCheck()
    func resumeAllTasks() {
        resumeAllTasksFuncCheck.call()
    }
    
    var setupFuncCheck = FuncCheck<MockAVAssetDownloadURLSession?>()
    var setupStub: ((DownloadState, ItemInformation) -> Void)?
    func setup(injectedSession: MockAVAssetDownloadURLSession?, stateChanged: ((DownloadState, ItemInformation) -> Void)?) {
        setupFuncCheck.call(injectedSession)
        setupStub = stateChanged
    }

    let resumeTaskFuncCheck = FuncCheck<String>()
    func resumeTask(identifier: String) {
        resumeTaskFuncCheck.call(identifier)
    }

    let suspendTaskFuncCheck = FuncCheck<String>()
    func suspendTask(identifier: String) {
        suspendTaskFuncCheck.call(identifier)
    }
}
