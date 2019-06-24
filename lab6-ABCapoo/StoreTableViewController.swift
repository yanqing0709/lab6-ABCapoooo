//
//  StoreTableViewController.swift
//  lab6-ABCapoo
//
//  Created by 陳嬿晴 on 2019/6/19.
//  Copyright © 2019 陳嬿晴. All rights reserved.
//

import UIKit

class StoreTableViewController: UITableViewController {

    var store_vocabularies = [Vocabulary]()
    
    @IBAction func unwindtoDetailTableView(segue: UIStoryboardSegue) {
        if let controller = segue.source as? DetailTableViewController, let v = controller.v {
            store_vocabularies.insert(v, at: 0)
            Vocabulary.saveToFile(vocabularies: store_vocabularies)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        if let v = Vocabulary.readVocabulariesFromFile() {
            self.store_vocabularies = v
        }
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
        return store_vocabularies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vocabularyCell", for: indexPath)
        // Configure the cell...
        let v = store_vocabularies[indexPath.row]
        cell.textLabel?.text = v.alphabet
        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        /*
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        */
        store_vocabularies.remove(at: indexPath.row)
        Vocabulary.saveToFile(vocabularies: store_vocabularies)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let controller = segue.destination as? ContentViewController, let row = tableView.indexPathForSelectedRow?.row {
            controller.content_vocabularies = [store_vocabularies[row]]
            print([store_vocabularies[row]])
            print(row)
        }
    }

}
