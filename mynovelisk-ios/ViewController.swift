//
//  ViewController.swift
//  mynovelisk-ios
//
//  Created by Narindra Aditantyo on 16/10/20.
//  Copyright © 2020 Narindra Aditantyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputUsername: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var inputGender: UISegmentedControl!
    @IBOutlet weak var inputDay: UITextField!
    @IBOutlet weak var inputMonth: UITextField!
    @IBOutlet weak var inputYear: UITextField!
        
    @IBAction func btnRegister(_ sender: Any) {
        
        let saveUsername = inputUsername.text!
        let saveEmail = inputEmail.text!
        let savePassword = inputPassword.text!
        let saveDay = inputDay.text!
        let saveMonth = inputMonth.text!
        let saveYear = inputYear.text!

        let alertMessage: String

        if saveUsername.isEmpty || saveEmail.isEmpty || savePassword.isEmpty || saveDay.isEmpty || saveMonth.isEmpty || saveYear.isEmpty {
            alertMessage = "All field can not be empty"
        } else if saveUsername.count < 4 || saveUsername.count > 12 {
            alertMessage = "Username length must be more than 3 and less than 13"
        } else if !saveEmail.contains("@") && !saveEmail.hasSuffix(".com") {
            alertMessage = "Email must contain @ and ended with .com"
        } else if savePassword.count < 4 || savePassword.count > 12 {
            alertMessage = "Password length must be more than 3 and less than 13"
        } else {
            alertMessage = "Registration success!"
        }

        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)

        if alertMessage == "Registration success!" {
            performSegue(withIdentifier: "goHomeView", sender: self)
        } else {
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let saveUsername = inputUsername.text!
        let saveEmail = inputEmail.text!
        let saveGender = inputGender.selectedSegmentIndex
        let saveDay = inputDay.text!
        let saveMonth = inputMonth.text!
        let saveYear = inputYear.text!
        
        let destination = segue.destination as! HomeViewController
        
        destination.receivedUsername = saveUsername
        destination.receivedEmail = saveEmail
        destination.receivedGender = saveGender == 0 ? "Male" : "Female"
        destination.receivedDOB = "\(saveYear) - \(saveMonth) - \(saveDay)"
        
    }
    
    @IBAction func unwindToRegistration(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source as? HomeViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

