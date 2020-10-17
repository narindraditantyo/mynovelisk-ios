//
//  HomeViewController.swift
//  mynovelisk-ios
//
//  Created by Narindra Aditantyo on 16/10/20.
//  Copyright © 2020 Narindra Aditantyo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var receivedUsername: String?
    var receivedEmail: String?
    var receivedGender: String?
    var receivedDOB: String?
    
    @IBOutlet weak var labelWelcome: UILabel!
    
    var arrNovels = [Novels]()

    @IBAction func btnProfile(_ sender: Any) {
        performSegue(withIdentifier: "goProfileView", sender: self)
    }
    
    @IBAction func btnBuy(_ sender: Any) {
        
        let alert = UIAlertController(title: "Alert", message: "You haven't add anything to your cart", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        if arrNovels[0].novelQty == 0 && arrNovels[0].novelQty == 0 && arrNovels[0].novelQty == 0 {
            present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "goCartView", sender: self)
        }
        
    }
    
    @IBAction func stepItem1(_ sender: UIStepper) {
        sender.minimumValue = 0
        arrNovels[0].novelQty = Int(sender.value)
        
        arrNovels[0].novelQty.
    }
    
    @IBAction func stepItem2(_ sender: UIStepper) {
        sender.minimumValue = 0
        arrNovels[1].novelQty = Int(sender.value)
    }
    
    @IBAction func stepItem3(_ sender: UIStepper) {
        sender.minimumValue = 0
        arrNovels[2].novelQty = Int(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelWelcome.text! += " \(receivedUsername!)"
    }
    
    func initNovels() {
        arrNovels.append(Novels(novelImg: "cover1", novelName: "Yosagu", novelPrice: 20000, novelQty: 0))
        arrNovels.append(Novels(novelImg: "cover2", novelName: "Dilan 1990", novelPrice: 10000, novelQty: 0))
        arrNovels.append(Novels(novelImg: "cover3", novelName: "Soramu", novelPrice: 20000, novelQty: 0))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? NovelsViewController {
            initNovels()
            
            if segue.identifier == "segueNovel1" {
                destination.imgName = arrNovels[0].novelImg
                destination.name = arrNovels[0].novelName
                destination.price = arrNovels[0].novelPrice
                destination.qty = arrNovels[0].novelQty
            } else if segue.identifier == "segueNovel2" {
                destination.imgName = arrNovels[1].novelImg
                destination.name = arrNovels[1].novelName
                destination.price = arrNovels[1].novelPrice
                destination.qty = arrNovels[1].novelQty
            } else if segue.identifier == "segueNovel3" {
                destination.imgName = arrNovels[2].novelImg
                destination.name = arrNovels[2].novelName
                destination.price = arrNovels[2].novelPrice
                destination.qty = arrNovels[2].novelQty
            }
        } else if let destination = segue.destination as? ProfileViewController {
            destination.receivedUsername = receivedUsername
            destination.receivedDOB = receivedDOB
            destination.receivedGender = receivedGender
            destination.receivedEmail = receivedEmail
        } else if let destination = segue.destination as? CartViewController {
            destination.receivedName1 = arrNovels[0].novelName
            destination.receivedPrice1 = arrNovels[0].novelPrice
            destination.receivedQty1 = arrNovels[0].novelQty
            destination.receivedName2 = arrNovels[1].novelName
            destination.receivedPrice2 = arrNovels[1].novelPrice
            destination.receivedQty2 = arrNovels[1].novelQty
            destination.receivedName3 = arrNovels[2].novelName
            destination.receivedPrice3 = arrNovels[2].novelPrice
            destination.receivedQty3 = arrNovels[2].novelQty
        }
        
    }
    
    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source as? ProfileViewController
    }

}
