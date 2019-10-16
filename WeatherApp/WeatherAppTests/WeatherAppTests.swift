//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Kimball Yang on 10/14/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testZipCodeHelper() {
        var ourCityName = ""
    ZipCodeHelper.getLatLong(fromZipCode: "11368") { (result) in
        DispatchQueue.main.async {
            
        
        switch result {
        case .success(let (_, _, cityName)):
           ourCityName = cityName
           
        case .failure(let error):
            XCTFail()
    }
    }
         XCTAssert(ourCityName != "", "Our city name is \(ourCityName)")
       
        }
}


}
