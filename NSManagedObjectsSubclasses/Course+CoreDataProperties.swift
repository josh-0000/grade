//
//  Course+CoreDataProperties.swift
//  grade
//
//  Created by Joshua Gmys on 7/8/23.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var name: String?
    @NSManaged public var split: String?
    @NSManaged public var weighted: Bool
    @NSManaged public var task: NSSet?

}

// MARK: Generated accessors for task
extension Course {

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: Task)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: Task)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSSet)

}

extension Course : Identifiable {

}
