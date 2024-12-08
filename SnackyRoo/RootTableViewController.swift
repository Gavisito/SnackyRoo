//
//  RootTableViewController.swift
//  SnackyRoo
//
//  Created by Anthony Gavidia-Vasquez on 12/7/24.
//

import Foundation
import UIKit

class RootTableViewController: UITableViewController{
    var snackArray = [snackModel]()
    
    func GetAPIJSONData(){
        let endpoint = URL(string: "https://raw.githubusercontent.com/Gavisito/SnackyRoo/refs/heads/main/SnackyRoo/snacks.json")
        
        let dataBytes = try? Data(contentsOf: endpoint!)
        print("Recieved:\(dataBytes!)")

        if (dataBytes != nil){
            let dictionary : NSDictionary = (try? JSONSerialization.jsonObject(with: dataBytes!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            
            print("Recieved:\(dictionary)")
            
            let snackDictionary = dictionary["Snacks"]! as! [[String: AnyObject]]
            
            for index in 0...snackDictionary.count - 1 {
                let snack = snackModel()
                let dictionaryHT = snackDictionary[index]
                
                snack.snackName = dictionaryHT["SnackName"] as! String
                snack.snackPrice = dictionaryHT["SnackPrice"] as! String
                snack.snackDescription = dictionaryHT["SnackDescription"] as! String
                
                snack.snackWesbite = dictionaryHT["SnackWebsite"] as! String
                snack.snackIMG = dictionaryHT["SnackImage"] as! String
                
                snackArray.append(snack)
            }
        }
        else{
            print("Error recieving data nil")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return snackArray.count
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let snackObject = snackArray[indexPath.row]
        let snackname = snackObject.snackName
        let snackprice = snackObject.snackPrice
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = snackname
        cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        cell.detailTextLabel!.text = snackprice
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showSnackDetails"{
            let destinationController = segue.destination as! SnackViewController
            let indexPath = tableView.indexPathForSelectedRow
            let selectedSnackObject = snackArray[indexPath!.row]
            destinationController.snackData = selectedSnackObject
        }
    }
    override func viewDidLoad() {
        //populateHTObjects()
        GetAPIJSONData()
        super.viewDidLoad()
    }
}
