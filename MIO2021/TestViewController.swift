//
//  TestViewController.swift
//  MIO2021
//  GROUP: Juan S Monsalve, Esmeralda Iyescas, Norberto Otero
//  Created by Juan S Monsalve on 11/15/21.
//

import UIKit
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

import Amadeus
import SwiftyJSON

class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var myTable: UITableView!
    
    var amadeus: Amadeus!
    var results : JSON = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        let result = results[indexPath.row]
        let textTest = result["href"]
    
        cell.textLabel!.text = "Destinations available: \(textTest)"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.dataSource = self
        myTable.delegate = self
        
        // Calling Amadeus ------->
        amadeus = Amadeus(
            client_id: "API",
            client_secret: "API"
        )
        
        amadeus.shopping.flightDestinations.get(
            params: ["origin": "MIA",
                    "maxPrice": "10000"],
            onCompletion: { result in
                switch result {
                    case .success(let response):

                    var test = response.data
                    print(test[0])
                    print(test[0]["links"]["flightOffers"])

                        //print(self.results[0]["href"])
                        //print(self.results.count) //<<<<<<<< testing
//
//                    self.results = response.data
//                    self.myTable.reloadData()

                    case .failure(let error):
                        print(error.localizedDescription)
            }
        })

        
        amadeus.referenceData.urls.checkinLinks.get(
                params: ["airlineCode": "BA"],
                onCompletion: { result in
                    switch result {
                      case .success(let response):
                        //print(response.data)
                        //print(self.results[0]["href"])
                        //print(self.results.count) //<<<<<<<< testing

                        self.results = response.data
                        self.myTable.reloadData()

                      case .failure(let error):
                         print(error.localizedDescription)
                   }
        })
        // End of Call -------------------<
        
    }
    
//    func loadData() {
//        // code to load data from network, and refresh the interface
//        self.myTable.reloadData()
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
