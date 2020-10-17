//
//  ProfileViewController.swift
//  mynovelisk-ios
//
//  Created by Narindra Aditantyo on 16/10/20.
//  Copyright © 2020 Narindra Aditantyo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var logoThumbnail: UIImageView!
    @IBOutlet weak var txtUsername: UILabel!
    @IBOutlet weak var txtDOB: UILabel!
    @IBOutlet weak var txtGender: UILabel!
    @IBOutlet weak var txtEmail: UILabel!
    
    var receivedUsername: String?
    var receivedEmail: String?
    var receivedGender: String?
    var receivedDOB: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtUsername.text = receivedUsername
        txtDOB.text = receivedDOB
        txtGender.text = receivedGender
        txtEmail.text = receivedEmail
    }
}
