//
//  FlightScreenViewController.swift
//  MIO2021
//  GROUP: Juan S Monsalve, Esmeralda Iyescas, Norberto Otero
//  Created by Esmeralda Iyescas on 11/23/21.
//

import UIKit
import Amadeus
import SwiftyJSON

class FlightScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var testVar : String!
    
    @IBOutlet weak var tableView: UITableView!
    
    var fromDate: String = ""
    var toDate: String = ""
    var origin: String = ""
    var destination: String = ""
    var adults: String = "1"
    var budget: String = ""
    
    var amadeus: Amadeus!
    var results : JSON = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(origin)
        print(destination)
        print(fromDate)
        print(toDate)
        print(budget)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //print("this is flight \(testVar)")
        
        // Calling Amadeus ------->
        amadeus = Amadeus(
            client_id: "API",
            client_secret: "API"
        )
        
        amadeus.shopping.flightOffersSearch.get(
            params: ["originLocationCode": "\(origin)",
                     "destinationLocationCode": "\(destination)",
                     "departureDate": "\(fromDate)",
                     "returnDate": "\(toDate)",
                     "adults": "\(adults)",
                     "currencyCode" : "USD"],
            onCompletion: { result in
                switch result {
                case .success(let response):
                    
                    self.results = response.data
                    
                    print("Response has \(self.results.count) items")
                    self.loadData()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        // End of Call -------------------<
    }
    
    func loadData() {
        // code to load data from network, and refresh the interface
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightCell") as! FlightCell
        
        let result = results[indexPath.row]
        
        cell.priceLabel.text = "$ \(result["price"]["grandTotal"].string!)"
        cell.lastSoldLabel.text = formatDate(result["lastTicketingDate"].string)
        cell.stopsLabel.text = String(result["itineraries"][0]["segments"].count - 1)
        cell.seatsLabel.text = String(result["numberOfBookableSeats"].intValue)
        
        return cell
    }
    
    func formatDate(_ stringDate:String?) -> String{

        let dateFormatter = DateFormatter()
        
        // input format
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //convert to date
        let myDate = dateFormatter.date(from: stringDate ?? "1111-11-11")!

        // set new format
        dateFormatter.dateFormat = "MMM dd, YYYY"
        //conver back to string
        let backToString = dateFormatter.string(from: myDate)
        
        return backToString
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //selecting the cell
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let info = results[indexPath.row]
        
        //pasing info as JSON item
        let purchaseVC = segue.destination as! PurchaseScreenViewController
        purchaseVC.purchase = info
        purchaseVC.budget = budget
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
