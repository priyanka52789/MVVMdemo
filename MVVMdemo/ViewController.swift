//
//  ViewController.swift
//  MVVMdemo
//
//  Created by Priyanka Sen on 12/09/19.
//  Copyright © 2019 Priyanka Sen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userTableView: UITableView!
    
    var userVM: [UserViewModel]?
    let cellIdentifier = "userCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userTableView.delegate = self
        userTableView.dataSource = self
        userTableView.separatorStyle = .none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(animated)
        ApiManager.shared.getUserData { (userArray) in
            self.userVM = userArray?.map({return UserViewModel(user: $0)}) ?? []
            DispatchQueue.main.async {
                self.userTableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            let detailsVC = segue.destination as! DetailsViewController
            if let indexPath = userTableView.indexPathForSelectedRow {
                detailsVC.userVM = userVM?[indexPath.row]
                userTableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userVM?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! UserTableViewCell
        cell.userVM = userVM![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
}
