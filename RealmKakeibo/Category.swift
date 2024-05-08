//
//  Category.swift
//  RealmKakeibo
//
//  Created by TAIGA ITO on 2024/05/08.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted var title: String = ""
}
