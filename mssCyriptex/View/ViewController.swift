//
//  ViewController.swift
//  mssCyriptex
//
//  Created by ahmet azak on 3.04.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = UITableViewCell()
         var content = cell.defaultContentConfiguration()
        content.text = "Cyrpto Currency"
        content.secondaryText = "Cyripto Price"
        cell.contentConfiguration = content
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource=self
        tableview.delegate=self
        // Do any additional setup after loading the view.
    }


}

