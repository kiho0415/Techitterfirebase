//
//  ViewController.swift
//  Techitterfirebase
//
//  Created by 森田貴帆 on 2020/09/21.
//

import UIKit
import Firebase

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var namelabel: UILabel!
    @IBOutlet var datalabel: UILabel!
    @IBOutlet var postlabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = "テスト"
        return cell!
    }


}

