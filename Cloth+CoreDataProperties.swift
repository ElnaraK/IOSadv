//
//  Cloth+CoreDataProperties.swift
//  LOOKmeAPP
//
//  Created by Elnara  on 5/16/21.
//
//

import Foundation
import CoreData


extension Cloth {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cloth> {
        return NSFetchRequest<Cloth>(entityName: "Cloth")
    }

    @NSManaged public var categoryIndex: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var imageData: Data?
    @NSManaged public var name: String?
    @NSManaged public var seasonIndex: Int16
    @NSManaged public var looks: NSSet?

}

// MARK: Generated accessors for looks
extension Cloth {

    @objc(addLooksObject:)
    @NSManaged public func addToLooks(_ value: Look)

    @objc(removeLooksObject:)
    @NSManaged public func removeFromLooks(_ value: Look)

    @objc(addLooks:)
    @NSManaged public func addToLooks(_ values: NSSet)

    @objc(removeLooks:)
    @NSManaged public func removeFromLooks(_ values: NSSet)

}

extension Cloth : Identifiable {

}
