//
//  ContactStore.swift
//  UITableViewDemo
//
//  Created by jiangchao on 15/12/28.
//  Copyright © 2015年 jiangchao. All rights reserved.
//

import UIKit

class ContactStore {
    
    static var Instance: ContactStore = ContactStore()
    
    var contactGroups: [ContactGroup] = [ContactGroup]()
    
    func initData() {
        
        var tempContacts: [Contact] = [Contact]()
        tempContacts.append(Contact(firstName: "Cui", lastName: "Kenshin", phoneNumber: "18700001234"))
        tempContacts.append(Contact(firstName: "Cui", lastName: "Tom", phoneNumber: "18700001235"))
        
        self.contactGroups.append(ContactGroup(name: "C", detail: "With names beginnig with C", contacts: tempContacts))
        
        tempContacts = [Contact]()
        tempContacts.append(Contact(firstName: "Lee", lastName: "Terry", phoneNumber: "13426471231"))
        tempContacts.append(Contact(firstName: "Lee", lastName: "Jack", phoneNumber: "13426471232"))
        tempContacts.append(Contact(firstName: "Lee", lastName: "Rose", phoneNumber: "13426471233"))
        
        self.contactGroups.append(ContactGroup(name: "L", detail: "With names beginnig with L", contacts: tempContacts))
        
        tempContacts = [Contact]()
        tempContacts.append(Contact(firstName: "Sun", lastName: "Kaoru", phoneNumber: "15401011231"))
        tempContacts.append(Contact(firstName: "Sun", lastName: "Rosa", phoneNumber: "15401011232"))
        
        self.contactGroups.append(ContactGroup(name: "S", detail: "With names beginnig with S", contacts: tempContacts))
        
        tempContacts = [Contact]()
        tempContacts.append(Contact(firstName: "Wang", lastName: "Lucy", phoneNumber: "18612341231"))
        tempContacts.append(Contact(firstName: "Wang", lastName: "Lily", phoneNumber: "18612341232"))
        tempContacts.append(Contact(firstName: "Wang", lastName: "Emily", phoneNumber: "18612341233"))
        tempContacts.append(Contact(firstName: "Wang", lastName: "Andy", phoneNumber: "18612341234"))
        
        self.contactGroups.append(ContactGroup(name: "W", detail: "With names beginnig with W", contacts: tempContacts))
        
        tempContacts = [Contact]()
        tempContacts.append(Contact(firstName: "Zhang", lastName: "Joy", phoneNumber: "13632320001"))
        tempContacts.append(Contact(firstName: "Zhang", lastName: "Vivan", phoneNumber: "13632320002"))
        tempContacts.append(Contact(firstName: "Zhang", lastName: "Joyse", phoneNumber: "13632320003"))
        tempContacts.append(Contact(firstName: "Zhang", lastName: "Stephone", phoneNumber: "13632320004"))
        
        self.contactGroups.append(ContactGroup(name: "Z", detail: "With names beginnig with Z", contacts: tempContacts))
    }
    
    func insert(indexPath: NSIndexPath) {
        let count = self.contactGroups[indexPath.section].contacts.count
        let firstname = self.contactGroups[indexPath.section].contacts[0].firstName
        
        self.contactGroups[indexPath.section].contacts.append(Contact(firstName: firstname, lastName: "Joy" + String(count), phoneNumber: "136323200" + (count > 9 ? String(count) : "0" + String(count))))
    }
    
    func moveRow(sourceIndex: NSIndexPath, destIndex: NSIndexPath) {
        let contact = self.contactGroups[sourceIndex.section].contacts[sourceIndex.row]
        
        self.contactGroups[destIndex.section].contacts.insert(contact, atIndex: destIndex.row)
        
        self.contactGroups[sourceIndex.section].contacts.removeAtIndex(sourceIndex.row)
    }
    
}
