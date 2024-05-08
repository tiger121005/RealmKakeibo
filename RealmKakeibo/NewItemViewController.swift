//
//  NewItemViewController.swift
//  RealmKakeibo
//
//  Created by TAIGA ITO on 2024/05/08.
//

import UIKit
import RealmSwift

class NewItemViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var markSwitch: UISwitch!
    
    let realm = try! Realm()
    var category: Category!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        let item = ShoppingItem()
        item.title = titleTextField.text!
        item.price = Int(priceTextField.text!) ?? 0
        item.isMarked = markSwitch.isOn
        item.category = category
        createItem(item: item)
        
//        let previousNC = self.presentingViewController as! UINavigationController
//        let previousVC = previousNC.viewControllers[previousNC.viewControllers.count - 1] as! ItemViewController
//        previousVC.reloadTableView()
        
        self.dismiss(animated: true)
    }

    func createItem(item: ShoppingItem) {
        try! realm.write {
            realm.add(item)
        }
    }

}
