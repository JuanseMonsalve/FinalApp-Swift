//
//  PurchaseScreenViewController.swift
//  MIO2021
//  GROUP: Juan S Monsalve, Esmeralda Iyescas, Norberto Otero
//  Created by Esmeralda Iyescas on 11/23/21.
//

import UIKit
import SwiftyJSON

class PurchaseScreenViewController: UIViewController {
    //connect outlets
    @IBOutlet weak var costTxt: UITextField!
    @IBOutlet weak var lastDateTxt: UITextField!
    @IBOutlet weak var numStopsTxt: UITextField!
    @IBOutlet weak var numSeatsTxt: UITextField!
    @IBOutlet weak var budgetTxt: UITextField!
    //Instantiate needed variables
    var purchase: JSON = []
    var price: String = ""
    var lastDate: String = ""
    var stops: String = ""
    var seats: String = ""
    var budget: String = ""
    var subTotal: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting values from JSON dictionary
        price = purchase["price"]["grandTotal"].stringValue
        lastDate = purchase["lastTicketingDate"].stringValue
        stops = String(purchase["itineraries"][0]["segments"].count - 1)
        seats = String(purchase["numberOfBookableSeats"].intValue)
        
        //Setting TextField values
        costTxt.text = price
        lastDateTxt.text = lastDate
        numStopsTxt.text = stops
        numSeatsTxt.text = seats
        budgetTxt.text = budget
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
