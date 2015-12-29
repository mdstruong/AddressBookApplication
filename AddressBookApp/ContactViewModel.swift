//
//  ContactViewModel.swift
//  AddressBookApp
//
//  Created by Sam Truong on 2015-12-28.
//  Copyright © 2015 Sam Truong. All rights reserved.
//

import Foundation

class ContactViewModel {
    
    var urlString = ""
    var contacts = [Contact]()
    
    func fetchContacts(success:() -> ()) {
        let numberOfContact = 5
        urlString = "http://api.randomuser.me/?results=\(numberOfContact)"
        
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let url = NSURL(string: urlString)
        let task = session.dataTaskWithURL(url!) { (data, response, error) -> Void in
            
            let json = JSON(data: data!)
            for var i=0; i<numberOfContact; i++ {
                
                let gender = json["results"][i]["user"]["gender"].stringValue
                let title = json["results"][i]["user"]["name"]["title"].stringValue
                let first = json["results"][i]["user"]["name"]["first"].stringValue
                let last = json["results"][i]["user"]["name"]["last"].stringValue
                let street = json["results"][i]["user"]["location"]["street"].stringValue
                let city = json["results"][i]["user"]["location"]["city"].stringValue
                let state = json["results"][i]["user"]["location"]["state"].stringValue
                let zip = json["results"][i]["user"]["location"]["zip"].stringValue
                let email = json["results"][i]["user"]["email"].stringValue
                let username = json["results"][i]["user"]["username"].stringValue
                let password = json["results"][i]["user"]["password"].stringValue
                let registered = json["results"][i]["user"]["registered"].stringValue
                let dob = json["results"][i]["user"]["dob"].stringValue
                let phone = json["results"][i]["user"]["phone"].stringValue
                let cell = json["results"][i]["user"]["cell"].stringValue
                var ssn:String? = json["results"][i]["user"]["SSN"].stringValue
                let pictureLarge = json["results"][i]["user"]["picture"]["large"].stringValue
                let pictureMedium = json["results"][i]["user"]["picture"]["medium"].stringValue
                let pictureThumbnail = json["results"][i]["user"]["picture"]["thumbnail"].stringValue
                if  (ssn!.isEmpty || ssn == nil) {
                    ssn = "N/A"
                }
                let contact = Contact(gender:gender,
                    title:title,
                    first:first,
                    last:last,
                    street:street,
                    city:city,
                    state:state,
                    zip:zip,
                    email:email,
                    username:username,
                    password:password,
                    registered:registered,
                    dob:dob,
                    phone:phone,
                    cell:cell,
                    ssn:ssn!,
                    pictureLarge:pictureLarge,
                    pictureMedium:pictureMedium,
                    pictureThumbnail:pictureThumbnail)
                self.contacts.append(contact!)
            }
            success()
        }
        task.resume()
        
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return contacts.count
    }
    
    func contactForItemAtIndexPath(indexPath: NSIndexPath) -> Contact {
        return contacts[indexPath.row]
    }
}