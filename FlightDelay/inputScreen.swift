//
//  ViewController.swift
//  FlightDelay
//
//  Created by Damian on 21/11/2018.
//  Copyright © 2018 Damian. All rights reserved.
//

import UIKit
import SearchTextField

class inputScreen: UIViewController {
    
    @IBOutlet weak var stateOneTxtField: SearchTextField!
    
    @IBOutlet weak var stateTwoTxtField: SearchTextField!
    
    @IBOutlet weak var airlineTxtField: SearchTextField!
    
    @IBOutlet weak var originTxtField: SearchTextField!
    
    @IBOutlet weak var destinationTxtField: SearchTextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateTxtField: UITextField!
    
    @IBOutlet weak var depTimePicker: UIDatePicker!
    
    @IBOutlet weak var depTimeTxtField: UITextField!
    
    @IBOutlet weak var arrTimePicker: UIDatePicker!
    
    @IBOutlet weak var arrTimeTxtField: UITextField!
    
    @IBOutlet weak var distanceTxTField: UITextField!
    
    @IBOutlet weak var durationTxtField: UITextField!
    
    
    let statesDick = ["Alabama" : 1, "Alaska" : 2, "Arizona" : 4, "Arkansas" : 5, "California" : 6, "Colorado" : 8, "Connecticut" : 9, "Delaware" : 10, "Florida" : 12, "Georgia" : 13, "Hawaii" : 15, "Idaho" : 16, "Illinois": 17, "Indiana" : 18, "Iowa" : 19, "Kansas" : 20, "Kentucky" : 21, "Louisiana" : 22, "Maine" : 23, "Maryland": 24, "Massachusetts": 25, "Michigan": 26, "Minnesota": 27, "Mississippi": 28, "Missouri": 29, "Montana": 30, "Nebraska": 31, "Nevada": 32, "New Hampshire": 33, "New Jersey": 34, "New Mexico": 35, "New York": 36, "North Carolina" : 37, "North Dakota" : 38, "Ohio" : 39, "Oklahoma" : 40, "Oregon" : 41, "Pennsylvania" : 42, "Rhode Island" : 44, "South Carolina" : 45, "South Dakota" : 46, "Tennessee" : 47, "Texas" : 48, "Utah" : 49, "Vermont" : 50, "Virginia" : 51, "Washington" : 53, "West Virginia" : 54, "Wisconsin" : 55, "Wyoming" : 56, "Puerto Rico" : 72, "Atlantic coast" : 75, "Virgin Islands" : 78]
    
    let airportsDick = ["ABE" : 1, "ABI" : 2, "ABQ" : 3]
    
    let airlinesDick = ["Pinnacle Airlines" : 0, "American Airlines" : 1, "Alaska Airlines" : 2, "JetBlue Airways" : 3, "Continental Airlines" : 4, "Atlantic Coast Airlines" : 5, "Delta Air Lines" : 6, "Atlantic Southeast Airlines" : 7, "Frontier" : 8, "AirTran Airways" : 9, "Allegiant Air" : 10, "Hawaiian Airlines" : 11, "America West Airline" : 12, "Aloha Air Cargo" : 13, "American Eagle" : 14, "Spirit Airlines" : 15, "Northwest Airlines" : 16, "Comair" : 17, "SkyWest Airlines" : 18, "ATA Airlines" : 19, "United Airlines" : 20, "US Airways" : 21, "Virgin America" : 22, "Southwest Airlines" : 23, "ExpressJet Airlines" : 24, "Mesa Airlines" : 25, "Midwest Airlines" : 26]

    var predValue: Int64 = 0    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stateOneTxtField.filterStrings(statesDick.keys.sorted())
        stateTwoTxtField.filterStrings(statesDick.keys.sorted())
        airlineTxtField.filterStrings(airlinesDick.keys.sorted())
        originTxtField.filterStrings(airportsDick.keys.sorted())
        destinationTxtField.filterStrings(airportsDick.keys.sorted())
        NotificationCenter.default.addObserver(self, selector: #selector(inputScreen.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(inputScreen.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
            
        //date filed
        let datePicker : UIDatePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.becomeFirstResponder()
        datePicker.locale = Locale(identifier: "pl")
        dateTxtField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(dateTxtChange), for: .valueChanged)
        // Do any additional setup after loading the view, typically from a nib.
        
        //dep time picker
        let depTimePicker : UIDatePicker = UIDatePicker()
        depTimePicker.datePickerMode = .time
        depTimePicker.becomeFirstResponder()
        depTimePicker.locale = Locale(identifier: "pl")
        depTimeTxtField.inputView = depTimePicker
        depTimePicker.addTarget(self, action: #selector(depTimeTxtFieldChange), for: .valueChanged)
        
        //arr time picker
        let arrTimePicker : UIDatePicker = UIDatePicker()
        arrTimePicker.datePickerMode = .time
        arrTimePicker.becomeFirstResponder()
        arrTimePicker.locale = Locale(identifier: "pl")
        arrTimeTxtField.inputView = arrTimePicker
        arrTimePicker.addTarget(self, action: #selector(arrTimeTxtFieldChange), for: .valueChanged)
    }
    
    @IBAction func dateEdit(_ sender: UITextField) {

    }
    
    @objc func arrTimeTxtFieldChange(_ sender: UIDatePicker) {
        let dF = DateFormatter()
        dF.dateStyle = .none
        dF.timeStyle = .short
        dF.locale = Locale(identifier: "pl")
        arrTimeTxtField.text = dF.string(from: sender.date)
    }
    
    
    @objc func dateTxtChange(_ sender: UIDatePicker) {
        let dF = DateFormatter()
        dF.dateStyle = .medium
        dF.timeStyle = .none
        dF.locale = Locale(identifier: "pl")
        dateTxtField.text = dF.string(from: sender.date)
    }
    
    @objc func depTimeTxtFieldChange(_ sender: UIDatePicker) {
        let dF = DateFormatter()
        dF.dateStyle = .none
        dF.timeStyle = .short
        dF.locale = Locale(identifier: "pl")
        depTimeTxtField.text = dF.string(from: sender.date)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
                self.view.frame.origin.y += 30
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
                self.view.frame.origin.y -= 30
                
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func getQuarter(month : Int) -> Int{
        var quarter: Int
        quarter = 0
        if month < 4 {
            quarter = 1
        }
        else if month < 7 && month > 3 {
            quarter = 2
        }
        else if month < 10 && month > 7 {
            quarter = 3
        }
        else if month > 9{
            quarter = 4
        }
        return quarter
    }
    
    func choose_txt(predictionClass: Int) -> String{
        var predictionText: String
        var image: String
        image = "happy"
        predictionText = "test"
        if predictionClass == 0 {
            predictionText = "Your flight will arrive early!"
            image = "happy"
        }
         else if predictionClass == 1 {
            predictionText = "Your flight will be on time!"
            image = "happy"
        }
         else if predictionClass == 2 {
            predictionText = "Your flight will delayed up to 20 minutes!"
            image = "neutral"
        }
        else if predictionClass == 3 {
            predictionText = "Your flight will delayed up to 40 minutes!"
            image = "neutral"
        }
        else if predictionClass == 4 {
            predictionText = "Your flight will delayed up to 60 minutes!"
            image = "sad"
        }
        else if predictionClass == 5 {
            predictionText = "Your flight will delayed more than 60 minutes!"
            image = "sad"
            }
        
        return predictionText
    }
    
    @IBAction func predictButtonClick(_ sender: UIButton){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        guard let date = dateFormatter.date(from: dateTxtField.text!) else {
            print("error")
            return
        }
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.month, Calendar.Component.day, Calendar.Component.weekday], from: date)
        let quarter = getQuarter(month: components.month!)
        let dayOfMonth = components.day
        let dayOfWeek =  components.weekday
        let month = components.month
        
        let originState = statesDick[stateOneTxtField.text!]
        let destinationState = statesDick[stateTwoTxtField.text!]
        
        let origin = airportsDick[originTxtField.text!]
        let destination = airportsDick[destinationTxtField.text!]
        
        let depTime = Int(depTimeTxtField.text!.replacingOccurrences(of: ":", with: ""))
        let arrTime = Int(arrTimeTxtField.text!.replacingOccurrences(of: ":", with: ""))
        
        let distance = Int(distanceTxTField.text!)
        let duration = Int(durationTxtField.text!)
        
        let airline = airlinesDick[airlineTxtField.text!]
        
        let input_data = [quarter, month, dayOfMonth, dayOfWeek, originState, destinationState, depTime, arrTime, duration, distance, destination, airline, origin]
        
        
        
        
        //here prediction is made:
        let model = model20172()
        do{
        let predicted_class = try model.prediction(QUARTER: Double(quarter), MONTH: Double(month!), DAY_OF_MONTH: Double(dayOfMonth!), DAY_OF_WEEK: Double(dayOfWeek!), ORIGIN_STATE_FIPS: Double(originState!), DEST_STATE_FIPS: Double(destinationState!), CRS_DEP_TIME: Double(depTime!), CRS_ARR_TIME: Double(arrTime!), CRS_ELAPSED_TIME: Double(duration!), DISTANCE: Double(distance!), Destination: Double(destination!), Carrier_index: Double(airline!), Origin: Double(origin!))
           // print(predicted_class.ARR_DELAY)
            predValue = predicted_class.ARR_DELAY
            performSegue(withIdentifier: "inputToOutputVC", sender: self)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "inputToOutputVC" {
            if let seg = segue.destination as? outputVC {
                print(predValue)
                seg.text = "\(predValue)"
            }
        }
    }

}

