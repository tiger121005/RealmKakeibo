//
//  ShoppingItem.swift
//  RealmKakeibo
//
//  Created by TAIGA ITO on 2024/05/08.
//

import Foundation
import RealmSwift

class ShoppingItem: Object {
    @Persisted var title: String = ""
    @Persisted var price: Int = 0
    @Persisted var isMarked: Bool = false
    @Persisted var category: Category?
}
