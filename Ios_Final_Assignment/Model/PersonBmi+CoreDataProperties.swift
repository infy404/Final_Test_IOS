//
//  PersonBmi+CoreDataProperties.swift
//  Ios_Final_Assignment
//
//  Created by Shreya Karki on 12/17/21.
//
//

import Foundation
import CoreData


extension PersonBmi {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonBmi> {
        return NSFetchRequest<PersonBmi>(entityName: "PersonBmi")
    }

    @NSManaged public var name: String?
    @NSManaged public var weight: Float
    @NSManaged public var date: Date?
    @NSManaged public var bmi: Float

}

extension PersonBmi : Identifiable {

}
