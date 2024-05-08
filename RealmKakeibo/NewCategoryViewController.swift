//
//  NewCategoryViewController.swift
//  RealmKakeibo
//
//  Created by TAIGA ITO on 2024/05/08.
//

import UIKit
import RealmSwift

class NewCategoryViewController: UIViewController {
    
    @IBOutlet var categoryTextField: UITextField!
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func save() {
        let category = Category()
        category.title = categoryTextField.text ?? ""
        createCategory(category: category)
        
        self.dismiss(animated: true)
    }
    
    func createCategory(category: Category) {
        try! realm.write {
            realm.add(category)
        }
    }

}
