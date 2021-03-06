//
//  NewsFeedViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/25/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

//MARK: - DATA Array
    
    let test = ["Testing","Testing","Testing","Testing","Testing"]

//MARK: - Outlets
    
    @IBOutlet weak var newsFeedTableView: UITableView!
    
//MARK: - View Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
        
        revealRearView()
        customNavBarCreation()
    }
    
//MARK: - Delegate and Datasource functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteListItem", for: indexPath) as! NewsTableViewCell
        cell.newsLabel.text = test[indexPath.row]
        return cell
    }
    
//MARK: - Custom Button Method
    
    //For toggling the navigation bar on/off
    @IBAction func navbarButton(_ sender: AnyObject) {
        self.revealViewController().revealToggle(animated: true)
    }
    
//MARK: - View Customization Methods
    
    //For making navigation bar transparent
    func customNavBarCreation(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName:UIFont(name:"Exo-Medium",size:18)!]
    }
    
    //For revealing rearview with gesture
    func revealRearView(){
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = self.view.bounds.size.width
        self.revealViewController().rearViewRevealOverdraw = CGFloat(0.0)
    }

}
