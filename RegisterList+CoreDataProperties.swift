//
//  RegisterList+CoreDataProperties.swift
//  
//
//  Created by webwerks on 28/12/22.
//
//

import Foundation
import CoreData


extension RegisterList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RegisterList> {
        return NSFetchRequest<RegisterList>(entityName: "RegisterList")
    }

    @NSManaged public var confirmPassword: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var gender: String?
    @NSManaged public var image: Data?
    @NSManaged public var lastName: String?
    @NSManaged public var password: String?
    @NSManaged public var phoneNo: String?
    @NSManaged public var designation: String?
    @NSManaged public var domain: String?
    @NSManaged public var education: String?
    @NSManaged public var yearOfPassing: String?
    @NSManaged public var grade: String?
    @NSManaged public var experiance: String?
    @NSManaged public var city: String?
    @NSManaged public var address: String?
    @NSManaged public var landmark: String?
    @NSManaged public var pincode: String?
    @NSManaged public var state: String?

}
