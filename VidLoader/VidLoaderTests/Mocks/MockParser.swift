//
//  MockParser.swift
//  VidLoaderTests
//
//  Created by Petre on 12/9/19.
//  Copyright © 2019 Petre. All rights reserved.
//

@testable import VidLoader

final class MockParser: Parser {
    var adjustFunCheck = FuncCheck<Data>()
    var adjustStub: Result<Data, M3U8Error> = .failure(.dataConversion)
    func adjust(data: Data, completion: @escaping (Result<Data, M3U8Error>) -> Void) {
        adjustFunCheck.call(data)
        completion(adjustStub)
    }
}
