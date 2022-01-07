//
//  SearchViewController.swift
//  MIO2021
//  GROUP: Juan S Monsalve, Esmeralda Iyescas, Norberto Otero
//  Created by Juan S Monsalve on 11/23/21.
//

import UIKit

class SearchViewController: UIViewController {
    // submit
    @IBOutlet weak var searchButton: UIButton!
    
    //Input fields
    @IBOutlet weak var originTxt: UITextField!
    @IBOutlet weak var destinationTxt: UITextField!
    @IBOutlet weak var fromDate: UITextField!
    var rawFromDate : String!
    @IBOutlet weak var toDate: UITextField!
    @IBOutlet weak var budgetTxt: UITextField!
    var rawToDate : String!
    var temporalTxtField : UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchButton.layer.cornerRadius = 10 // Makes button corners round
    }
    
    @IBAction func fromDateAction(_ sender: Any) {
        pickaDate(fromDate)
    }
    @IBAction func toDateAction(_ sender: Any) {
        pickaDate(toDate)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func pickaDate(_ dateField: UITextField){
        // Fixes issue with the picker not showing correctly
        if #available(iOS 13.4, *) {
           datePicker.preferredDatePickerStyle = .wheels
        }
        
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        temporalTxtField = dateField
        // bar button
        let doneButtom = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: nil,
            action: #selector(performDoneButton)
        )
        doneButtom.tintColor = UIColor(
            red: 224/255,
            green: 122/255,
            blue: 95/255,
            alpha: 1
        )
        toolbar.setItems([doneButtom], animated: true)
        
        // assign toolbar
        dateField.inputAccessoryView = toolbar
        
        // assign date picker to the textfield
        dateField.inputView = datePicker
        
        // date picker mode visually
        datePicker.datePickerMode = .date
        //datePicker.preferredDatePickerStyle = .compact
        //datePicker.frame.size = CGSize(width: 0, height: 250)
        
    }
    
    @objc func donePressed(_ dateField : UITextField){
        
        // Center date
        //sender.textAlignment = .center
        
        // formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateField.text = formatter.string(from: datePicker.date)
        
        formatter.dateFormat = "yyyy-MM-dd"
        let searchFormat = formatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
        
        print("Raw date: \(searchFormat)" )
    }
    
    @objc func performDoneButton()
    {
        donePressed(temporalTxtField)
    }
    
    func formatDate(_ stringDate:String?) -> String{

        let dateFormatter = DateFormatter()
        
        // input format
        dateFormatter.dateFormat = "MM-dd-yyyy"
        //convert to date
        let myDate = dateFormatter.date(from: stringDate ?? "11-11-1111")!

        // set new format
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //conver back to string
        let backToString = dateFormatter.string(from: myDate)
        
        return backToString
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let barVCs = segue.destination as! UITabBarController
        let navVCs = barVCs.viewControllers?[0] as! UINavigationController
        let destinationVC = navVCs.viewControllers[0] as! FlightScreenViewController
        destinationVC.origin = originTxt.text!
        destinationVC.destination = destinationTxt.text!
        destinationVC.fromDate = formatDate(fromDate.text!)
        destinationVC.toDate = formatDate(toDate.text!)
        destinationVC.budget = budgetTxt.text!
        
//        let bardVCs = segue.destination as! UITabBarController
//        let naviVCs = bardVCs.viewControllers?[1] as! UINavigationController
//        let destinationsVC = naviVCs.viewControllers[0] as! HotelScreenViewController
//        destinationsVC.origin = originTxt.text!
        
    }
}
