//
//  RemoteControl_iOSTests.swift
//  RemoteControl-iOSTests
//
//  Created by Aaqib Hussain on 26/8/17.
//  Copyright © 2017 Aaqib Hussain. All rights reserved.
//

import XCTest
@testable import RemoteControl_iOS

class RemoteControl_iOSTests: XCTestCase {
    
    var udpModel: UDPModel?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        udpModel = UDPModel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testUDPModel() {
        udpModel?.hostAddress = "192.168.1.108"
        udpModel?.port = 8080
        udpModel?.message = "start video1"
        udpModel?.delay = "500"
        udpModel?.postPacket(completion: { (success) in
            if success{
            XCTAssertTrue(success)
            }else{
            XCTAssertFalse(success)
            }
        })
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            
        }
    }
    
}
