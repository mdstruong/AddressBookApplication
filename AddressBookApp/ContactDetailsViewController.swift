//
//  ViewController.swift
//  AddressBookApp
//
//  Created by Sam Truong on 2015-12-28.
//  Copyright © 2015 Sam Truong. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    // MARK: Label properties
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var streetlabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var zipLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var dobLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var ssnLabel: UILabel!
    
    // MARK: contact variable from the contact list
    var contact : Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: populate all labels in details
        nameLabel.text = contact.title.capitalizedString + " " + contact.first.capitalizedString + " " + contact.last.capitalizedString
        genderLabel.text = "Gender: "+contact.gender.capitalizedString
        streetlabel.text = "Street: "+contact.street.capitalizedString
        cityLabel.text = "City: "+contact.city.capitalizedString
        stateLabel.text = "State: "+contact.state.capitalizedString
        zipLabel.text = "Zip: "+contact.zip
        emailLabel.text = "E: "+contact.email
        dobLabel.text = "DoB: "+contact.dob
        phoneLabel.text = "Tel: "+contact.phone
        cellLabel.text = "Cell: "+contact.cell
        ssnLabel.text = "SSN: "+contact.ssn
        self.navigationItem.title = contact.first.capitalizedString + " " + contact.last.capitalizedString
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

