//
//  DemoListViewController.swift
//  swift-demo
//
//  Created by rayootech on 16/4/12.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import UIKit

class DemoListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var listArray :NSArray = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "demo列表"
        
        let tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
        
        listArray = ["实现轮播图","动画效果"]
    }
    
    /**
     UITableViewDelegate
     */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return listArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let ID = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if cell == nil{
            cell = UITableViewCell(style: .Default, reuseIdentifier: ID)
        }
        cell?.accessoryType = .DisclosureIndicator
        cell?.textLabel?.text = "\(listArray[indexPath.row])"
        cell?.selectionStyle = .None
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row{
        case 0:
              self.navigationController?.pushViewController(EasyScrollViewController(), animated: true)
            break
        case 1:
            self.navigationController?.pushViewController(AnimationListViewController(), animated: true)
            break
        default:
            break
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
