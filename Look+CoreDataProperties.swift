//
//  Look+CoreDataProperties.swift
//  LOOKmeAPP
//
//  Created by Elnara  on 5/16/21.
//
//

import Foundation
import CoreData


extension Look {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Look> {
        return NSFetchRequest<Look>(entityName: "Look")
    }

    @NSManaged public var count: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var seasonIndex: Int16
    @NSManaged public var title: String?
    @NSManaged public var clothes: NSSet?

}

// MARK: Generated accessors for clothes
extension Look {

    @objc(addClothesObject:)
    @NSManaged public func addToClothes(_ value: Cloth)

    @objc(removeClothesObject:)
    @NSManaged public func removeFromClothes(_ value: Cloth)

    @objc(addClothes:)
    @NSManaged public func addToClothes(_ values: NSSet)

    @objc(removeClothes:)
    @NSManaged public func removeFromClothes(_ values: NSSet)

}

extension Look : Identifiable {

}
