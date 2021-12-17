//
//  PersonBmi+CoreDataProperties.swift
//  Ios_Final_Assignment
//
//  Created by Shreya Karki on 12/16/21.
//
//

import Foundation
import CoreData


extension PersonBmi {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonBmi> {
        return NSFetchRequest<PersonBmi>(entityName: "PersonBmi")
    }

    @NSManaged public var name: String?
    @NSManaged public var weightInKilos: Double
    @NSManaged public var weightInPounds: Double
    @NSManaged public var heightInInches: Double
    @NSManaged public var heightInMeters: Double
    @NSManaged public var age: Int64
    @NSManaged public var gender: String?

}

extension PersonBmi : Identifiable {

}
