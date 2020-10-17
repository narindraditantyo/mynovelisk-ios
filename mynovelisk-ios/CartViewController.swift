import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var txtName1: UILabel!
    @IBOutlet weak var txtName2: UILabel!
    @IBOutlet weak var txtName3: UILabel!
    @IBOutlet weak var txtQty1: UILabel!
    @IBOutlet weak var txtQty2: UILabel!
    @IBOutlet weak var txtQty3: UILabel!
    @IBOutlet weak var txtTotalQty: UILabel!
    @IBOutlet weak var txtTotalPrice: UILabel!
    
    var receivedName1: String?
    var receivedName2: String?
    var receivedName3: String?
    var receivedQty1: Int?
    var receivedQty2: Int?
    var receivedQty3: Int?
    var receivedPrice1: Int?
    var receivedPrice2: Int?
    var receivedPrice3: Int?
    
    @IBAction func btnCheckout(_ sender: Any) {
        
        let totalPrice1 = receivedQty1! * receivedPrice1!
        let totalPrice2 = receivedQty2! * receivedPrice2!
        let totalPrice3 = receivedQty3! * receivedPrice3!
        let totalPrice = totalPrice1 + totalPrice2 + totalPrice3
        
        let alertMessage = "Thankyou for your purchase! Your total price is Rp. \(String(totalPrice))"
        
        let alert = UIAlertController(title: "Purchase Success", message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.performSegue(withIdentifier: "goHomeView", sender: self)
        })
        alert.addAction(okAction)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtName1.text = receivedName1
        txtName2.text = receivedName2
        txtName3.text = receivedName3
        txtQty1.text = String(receivedQty1!)
        txtQty2.text = String(receivedQty2!)
        txtQty3.text = String(receivedQty3!)
        
        let totalPrice1 = receivedQty1! * receivedPrice1!
        let totalPrice2 = receivedQty2! * receivedPrice2!
        let totalPrice3 = receivedQty3! * receivedPrice3!
        let totalPrice = totalPrice1 + totalPrice2 + totalPrice3
        
        txtTotalQty.text = "Total \(String(receivedQty1! + receivedQty2! + receivedQty3!)) items"
        txtTotalPrice.text = "Rp. \(String(totalPrice))"
    }

}
