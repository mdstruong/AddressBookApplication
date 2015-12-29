//
//  Contact.swift
//  AddressBookApp
//
//  Created by Sam Truong on 2015-12-28.
//  Copyright © 2015 Sam Truong. All rights reserved.
//

import Foundation

class Contact {
    
    var gender:String
    var title:String
    var first:String
    var last:String
    var street:String
    var city:String
    var state:String
    var zip:String
    var email:String
    var username:String
    var password:String
    var registered:String
    var dob:String
    var phone:String
    var cell:String
    var ssn:String
    var pictureLarge:String
    var pictureMedium:String
    var pictureThumbnail:String
    
    // MARK: Initialization
    init?(gender:String,
         title:String,
         first:String,
         last:String,
         street:String,
         city:String,
         state:String,
         zip:String,
         email:String,
         username:String,
         password:String,
         registered:String,
         dob:String,
         phone:String,
         cell:String,
         ssn:String,
         pictureLarge:String,
         pictureMedium:String,
         pictureThumbnail:String
 ){
        // Initialize stored properties.
        self.gender = gender
        self.title = title
        self.first = first
        self.last = last
        self.street = street
        self.city = city
        self.state = state
        self.zip = zip
        self.email = email
        self.username = username
        self.password = password
        self.registered = registered
        self.dob = dob
        self.phone = phone
        self.cell = cell
        self.ssn=ssn
        self.pictureLarge = pictureLarge
        self.pictureMedium = pictureMedium
        self.pictureThumbnail = pictureThumbnail
    
        // Initialization should fail if there is no name or if the rating is negative.
        if first.isEmpty || last.isEmpty  {
            return nil
        }
    
    }
    
}
