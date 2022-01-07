//
//  TabBarController.swift
//  MIO2021
//  GROUP: Juan S Monsalve, Esmeralda Iyescas, Norberto Otero
//  Created by Juan S Monsalve on 11/28/21.
//

import UIKit

class TabBarController: UITabBarController {

    var origin : String!
    var destination : String!
    var fromDate : String!
    var toDate : String!
    var budget : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navVc = viewControllers?[0] as! UINavigationController
        let flightVc = navVc.viewControllers[0] as! FlightScreenViewController
        flightVc.origin = origin
        flightVc.destination = destination
        flightVc.fromDate = fromDate
        flightVc.toDate = toDate
        flightVc.budget = budget
    }
    

}
