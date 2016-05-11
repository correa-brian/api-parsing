//
//  APHomeViewController.swift
//  API-practice
//
//  Created by Brian Correa on 5/1/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APHomeViewController: APViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    
    var feedTable: UITableView!

    //MARK: Lifecycle Methods
    
    override func loadView() {
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.blueColor()
        
        self.feedTable = UITableView(frame: frame, style: .Plain)
        self.feedTable.delegate = self
        self.feedTable.dataSource = self
        
        view.addSubview(self.feedTable)
        
        self.view = view
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://www.instagram.com/kateupton/media/"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, AnyObject>{
                print("\(JSON)")
                
                if let items = JSON["items"] as? Array<Dictionary<String, AnyObject>>{
//                    print("\(items)")
                }
            }
        }

    }
    
    //MARK: Table Delegate Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            return self.configureCell(cell, indexPath: indexPath)
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        return self.configureCell(cell, indexPath: indexPath)
    }
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
        
        cell.detailTextLabel?.text = "\(indexPath.row)"
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
