//
//  Book+CoreDataProperties.swift
//  Core Data-1
//
//  Created by Zero DotOne on 2021/02/22.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var subject: String?

}

extension Book : Identifiable {

}
