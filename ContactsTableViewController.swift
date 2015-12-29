//
//  ContactsTableViewController.swift
//  AddressBookApp
//
//  Created by Sam Truong on 2015-12-28.
//  Copyright © 2015 Sam Truong. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    static let reuseIdentifier = "ContactCell"
    static let segueIdentifier = "contactDetailSegue"
    var contactViewModel = ContactViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refresh()
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: "refresh", forControlEvents: .ValueChanged)
        navigationItem.leftBarButtonItem = editButtonItem()
        
    }
    func refresh() {
        contactViewModel.fetchContacts(){
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView!.reloadData()
                self.refreshControl?.endRefreshing()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactViewModel.numberOfItemsInSection(section)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ContactsTableViewController.reuseIdentifier, forIndexPath: indexPath) as! ContactTableViewCell
        
        // Fetches the appropriate product for the data source layout.
        let contact = contactViewModel.contactForItemAtIndexPath(indexPath)
        cell.contactNameLabel.text = contact.first.capitalizedString + " " + contact.last.capitalizedString
        cell.contactImageView.image = UIImage(named: "men")
        cell.contactPhoneLabel.text = contact.phone
        self.navigationItem.title = "Contact List"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            contactViewModel.contacts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard segue.identifier == ContactsTableViewController.segueIdentifier else { return }
        let viewController = segue.destinationViewController as! ContactDetailsViewController
        
        if let selectedContactCell = sender as? ContactTableViewCell {
            
            let indexPath = tableView.indexPathForCell(selectedContactCell)!
            let selectedContact = contactViewModel.contacts[indexPath.row]
            viewController.contact = selectedContact
            
            
        }
    }


}
