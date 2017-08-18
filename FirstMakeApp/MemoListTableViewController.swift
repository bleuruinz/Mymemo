//
//  MemoListTableViewController.swift
//  FirstMakeApp
//
//  Created by ktds 13 on 2017. 8. 18..
//  Copyright © 2017년 CJ Olivenetworks. All rights reserved.
//

import UIKit

class MemoListTableViewController: UITableViewController, WriteMemoDelegate {

    // Memo 의 빈 Array 생성
    var memos:[Memo] = Array()
    /*
    var memoType:String
    var memoImage:UIImage?
    var memoText:String?
    var writeTime:String
*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let memo1 = Memo(memoType: "이미지&텍스트",
                         memoImage: UIImage(named:"book1")!,
                         memoText: "첫 번째 메모 리스트.. 이미지와 텍스트",
                         //writeTime: "2017.08.17.13:00")
                         writeTime: nil)
        
        let memo2 = Memo(memoType: "텍스트",
                         memoImage: nil,
                         memoText: "두 번째 메모 리스트.. 텍스트",
                         writeTime: "2017.08.17.16:00")
        
        //let time : TimeZone = TimeZone.system
        self.memos.append(memo1)
        self.memos.append(memo2)
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.memos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        if let memoCell = cell as? MemoTableViewCell {
            let memo = self.memos[indexPath.row]
            
            
            if memo.writeTime == nil {
                
                let wTime = NSDate() //현재 시각 구하기
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let writetime = dateFormatter.string(from: wTime as Date)
                print(writetime) //"2016년 2월 21일"
                
                
                
                //let wTime = numFormatter.string(from: NSNumber(integerLiteral: price))
                memoCell.memoTimeLabel.text = writetime //String(book.price)
            } else {
                
            }

            memoCell.memoTitleLabel.text = memo.memoType
            memoCell.memoTimeLabel.text = memo.writeTime
            memoCell.memoDescriptionLabel.text = memo.memoText
            memoCell.memoImageView.image = memo.memoImage
            
            
            return memoCell
        }
        
        /*
         var memoType:String
         var memoImage:UIImage?
         var memoText:String?
         var writeTime:String
         */

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier  == "addvc" {
            
            if let addVC = segue.destination as? memoWriteViewController {
                addVC.delegate = self
            }
            print("addvc")
            
        } else if segue.identifier == "detailvc" {
            print("detailvc")
            /*let cell = sender as? UITableViewCell
            let vc = segue.destination as? BookDetailViewController
            
            guard let selectedCell = cell, let detailVC = vc else {
                return
            }
            
            if let idx = self.tableView.indexPath(for: selectedCell) {
                detailVC.book = self.books[idx.row]
            }*/
            /*        if let selCell = cell {
             let cellIdx = self.tableView.indexPath(for: selCell)
             print(cellIdx?.row)
             }*/
        }
    }
    
    
    func sendNewMemo (memo:Memo) {
        self.memos.append(memo)
        self.tableView.reloadData()
    }

}









class MemoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var memoTitleLabel: UILabel!
    @IBOutlet weak var memoDescriptionLabel: UILabel!
    @IBOutlet weak var memoTimeLabel: UILabel!
    @IBOutlet weak var memoImageView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundView?.backgroundColor = UIColor.blue
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


