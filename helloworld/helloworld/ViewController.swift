//
//  ViewController.swift
//  HelloWorld
//
//  Created by CY-LQ on 2014-12-14.
//  Copyright (c) 2014 CYLQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
        
        
        @IBOutlet var appstableview: UITableView!

        override func viewDidLoad() {
                super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
        }

        override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
        }
        
        func tableview(tableView: UITableView, numberOfRowsInSection section: int)-> int{
                return 10
        }
        
        func tableview(tableView: UITableView, cellForRowAtIndePath indexPath: NSIndexPath) - >UITableViewCell{
        
                let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:"MyTestCell")
        
                cell.textLable?.text = "Row #\(indexPath.row)"
        
                cell.detailTextLablel?.text = "Subtitle #\(indexPath.row)"
        
                return cell
        }


}

