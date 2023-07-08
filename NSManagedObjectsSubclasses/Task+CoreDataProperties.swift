//
//  Task+CoreDataProperties.swift
//  grade
//
//  Created by Joshua Gmys on 7/8/23.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var grade: Double
    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var course: Course?

}

extension Task : Identifiable {

}
