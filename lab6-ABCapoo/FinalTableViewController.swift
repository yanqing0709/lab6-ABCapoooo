//
//  FinalTableViewController.swift
//  lab6-ABCapoo
//
//  Created by 陳嬿晴 on 2019/6/19.
//  Copyright © 2019 陳嬿晴. All rights reserved.
//

import UIKit

class FinalTableViewController: UITableViewController {

    var data: Int = 1
    var gradeData: Int = 0
    var circleList: [Int] = []
    var questionList_q: [String] = []
    var questionList_a: [String] = []
    var letters: [Letter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradeData = self.data
        for i in 0 ..< 10 {
            if(circleList[i] != 0) {
                letters.append(Letter(q: questionList_q[i], a: questionList_a[i], isCircle: 1))
            }
            else {
                letters.append(Letter(q: questionList_q[i], a: questionList_a[i], isCircle: 0))
            }
        }
        print(letters)
        print(circleList)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return letters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "letterCell", for: indexPath) as! FinalTableViewCell
        let l = letters[indexPath.row]
        cell.qLabel.text! = l.q
        cell.aLabel.text! = l.a
        if(l.isCircle == 0) {
            cell.isCorrectLabel.text = "X"
            let color = #colorLiteral(red: 0.896689713, green: 0.2738503218, blue: 0.2761492431, alpha: 1)
            cell.isCorrectLabel.textColor = color
        }
        else {
            cell.isCorrectLabel.text = "O"
            let color = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            cell.isCorrectLabel.textColor = color
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
