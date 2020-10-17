//
//  NovelsViewController.swift
//  mynovelisk-ios
//
//  Created by Narindra Aditantyo on 16/10/20.
//  Copyright © 2020 Narindra Aditantyo. All rights reserved.
//

import UIKit

class NovelsViewController: UIViewController {
    
    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtPrice: UILabel!
    @IBOutlet weak var txtQty: UILabel!
    
    var imgName: String?
    var name: String?
    var price: Int?
    var qty: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgThumbnail.image = UIImage(named: imgName!)
        txtName.text = "\(name!)"
        txtPrice.text = "Rp. \(price!)"
        txtQty.text = "\(qty!)"
    }

}
