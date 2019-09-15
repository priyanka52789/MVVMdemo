//
//  DetailsViewController.swift
//  MVVMdemo
//
//  Created by Priyanka Sen on 12/09/19.
//  Copyright © 2019 Priyanka Sen. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var userVM: UserViewModel?
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var websiteLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    //@IBOutlet weak var addressMap: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        userNameLbl.text = "User Name: \(userVM?.userName ?? "test username")"
        nameLbl.text = "Name: \(userVM?.name ?? "test name")"
        emailLbl.text = "Email: \(userVM?.email ?? "test email")"
        phoneLbl.text = "Phone: \(userVM?.phone ?? "test phone")"
        companyLbl.text = "Company: \(userVM?.company ?? "test company")"
        websiteLbl.text = "Website: \(userVM?.website ?? "test website")"
        addressLbl.text = "Address: \(userVM?.address ?? "test address")"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
