//
//  LicensesViewController.swift
//  PetAdoption-iOS
//
//  Created by Amir Fleminger on 7/3/18.
//  Copyright © 2018 Code For Orlando. All rights reserved.
//

import UIKit

struct item {
    let title: String
    let detail: String
    let url: String
}

class LicensesViewController: UITableViewController {
    
    var items = [item]()
    let cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        loadData()
    }
    
    private func loadData(){
        items = [
            item(title: "AlamoFire", detail: "Elegant HTTP Networking in Swift.", url: "https://github.com/Alamofire/Alamofire/blob/master/LICENSE"),
            item(title: "CocoaPods", detail: "A dependency manager for Swift and Objective-C Cocoa projects.", url: "https://cocoapods.org/legal"),
            item(title: "Code For Orlando - PetAdoption iOS", detail: "Our own license.", url: "https://github.com/cforlando/PetAdoption-iOS/blob/develop/LICENSE.md"),
            item(title: "Petfinder API", detail: "The Petfinder API gives developers access to Petfinder's database of over 300,000 adoptable pets and 11,000 animal welfare organizations (AWO)", url: "https://www.petfinder.com/developers/api-docs"),
            item(title: "SwiftyJSON", detail: "The better way to deal with JSON data in Swift.", url: "https://github.com/SwiftyJSON/SwiftyJSON/blob/master/LICENSE")
        ]
    }
    
    
    // MARK: - UITableVIewController
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellIdentifier)
        cell.accessoryType = .disclosureIndicator
        cell.tintColor = .gray
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.detail
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let url = item.url
        openWebpage(address: url, navigationController: self.navigationController, inAppBrowser: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
