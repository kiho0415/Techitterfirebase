//
//  ViewController.swift
//  Techitterfirebase
//
//  Created by 森田貴帆 on 2020/09/21.
//

import UIKit
import Firebase
import FirebaseDatabase


class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    var contentarray = [String]() //データを入れておく配列。これをtableviewで表示する
    
    //var snap: DataSnapshot!
    let ref = Database.database().reference() //Firebaseのルートを宣言しておく
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.read()//データを読み込むためのメソッド
        table.dataSource = self
        //ここで画面遷移してログイン画面へ
        let nextView = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(nextView, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Cellの高さを調節
        table.estimatedRowHeight = 56
        table.rowHeight = UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell") as! SampleCell
        //cell.namelabel.text = ""
       // cell.datalabel.text = ""
        cell.postlabel.text = String(contentarray[indexPath.row])
        return cell
    }
    
    func read()  {
        ref.child("post") .observeSingleEvent(of: .value, with: { [self] (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            guard let snapshotValue = value else { return }
            for post in snapshotValue.keyEnumerator(){
                guard let parsedPosts = snapshotValue[post] as? [String:Any] else { return }
          
                print(parsedPosts["contents"]!)
                print(parsedPosts["username"]!)
                print(parsedPosts["date"]!)
                //とりあえずcontentだけ入れる
                contentarray.append(parsedPosts["contents"] as! String)
            }
            self.table.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
}
            
