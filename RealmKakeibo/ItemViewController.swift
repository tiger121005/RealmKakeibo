//
//  ViewController.swift
//  RealmKakeibo
//
//  Created by TAIGA ITO on 2024/05/08.
//

import UIKit
import RealmSwift

class ItemViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    var items: [ShoppingItem] = []
    var selectedCategory: Category!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        items = readItem()
        navigationItem.title = selectedCategory.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        items = readItem()
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewItemView" {
            let newItemViewController = segue.destination as! NewItemViewController
            newItemViewController.category = self.selectedCategory
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item = items[indexPath.row]
        cell.setCell(title: item.title, price: item.price, isMarked: item.isMarked)
        
        return cell
    }
    
    func readItem() -> [ShoppingItem] {
        return Array(realm.objects(ShoppingItem.self).filter("category == %@", selectedCategory!))
    }

}

