//
//  TestViewController.swift
//  MIO2021
//  GROUP: Juan S Monsalve, Esmeralda Iyescas, Norberto Otero
//  Created by Juan S Monsalve on 11/15/21.
//

import UIKit
import Amadeus
import SwiftyJSON

class FlightInspirationTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var amadeus: Amadeus!
    var results : JSON = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightInspirationCell") as! FlightInspirationCell

        let result = results[indexPath.row]
        
        

        cell.destinationLabel.text = result["destination"].string
        cell.departureLabel.text = formatDate(result["departureDate"].string)
        cell.returnLabel.text = formatDate(result["returnDate"].string)
        cell.priceLabel.text = "$ \(result["price"]["total"].string!)" 
        
        cell.daysLabel.text = "\(dateDifference(result["departureDate"].string, result["returnDate"].string)) Days" 

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Calling Amadeus ------->
        amadeus = Amadeus(
            client_id: "API",
            client_secret: "API"
        )
        
        amadeus.shopping.flightDestinations.get(
            params: ["origin": "MIA",
                     "maxPrice": "100000"],
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
    
    func dateDifference(_ fromString:String?, _ toString: String?) -> Int{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        // convert string to dates
        let fromDate = formatter.date(from: fromString ?? "1111-11-11")!
        let toDate = formatter.date(from: toString ?? "1111-11-11")!
        
        // get day difference integer
        let dayDifference = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day!
        
        return dayDifference
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
