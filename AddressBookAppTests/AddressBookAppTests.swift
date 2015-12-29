//
//  AddressBookAppTests.swift
//  AddressBookAppTests
//
//  Created by Sam Truong on 2015-12-28.
//  Copyright © 2015 Sam Truong. All rights reserved.
//

import UIKit
import XCTest
@testable import AddressBookApp

class AddressBookAppTests: XCTestCase {

    // MARK: AddressBookApp Tests
    func testContactInitialization() {
        // Success case.
        let potentialItem = Contact(gender:"female",
            title:"mrs",
            first:"maria",
            last:"mitchell",
            street:"8621 george street",
            city:"cardiff",
            state:"ON",
            zip:"12345",
            email:"maria.mitchell@example.com",
            username:"tinymeercat479",
            password:"mnbv",
            registered:"1375658690",
            dob:"771897846",
            phone:"123456789",
            cell:"123456789",
            ssn:"123456789",
            pictureLarge:"https://randomuser.me/api/portraits/women/48.jpg",
            pictureMedium:"https://randomuser.me/api/portraits/med/women/48.jpg",
            pictureThumbnail:"https://randomuser.me/api/portraits/thumb/women/48.jpg")
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        let noName = Contact(gender:"female",
            title:"mrs",
            first:"",
            last:"",
            street:"8621 george street",
            city:"cardiff",
            state:"ON",
            zip:"12345",
            email:"maria.mitchell@example.com",
            username:"tinymeercat479",
            password:"mnbv",
            registered:"1375658690",
            dob:"771897846",
            phone:"123456789",
            cell:"123456789",
            ssn:"123456789",
            pictureLarge:"https://randomuser.me/api/portraits/women/48.jpg",
            pictureMedium:"https://randomuser.me/api/portraits/med/women/48.jpg",
            pictureThumbnail:"https://randomuser.me/api/portraits/thumb/women/48.jpg")
        XCTAssertNil(noName, "Empty first and last name is invalid")
        
    }
}
