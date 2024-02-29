//
//  ViewController.swift
//  Timer
//
//  Created by MD. SHAYANUL HAQ SADI on 3/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    let startDateString = "2023-04-04 09:00:00"
    let endDateString = "2023-04-05 17:00:00"


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a date formatter to convert the strings to Date objects
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        // Convert the strings to Date objects
        let startDate = dateFormatter.date(from: startDateString)!
        let endDate = dateFormatter.date(from: endDateString)!
        
        
        let when = DispatchTime.now() + 0.1 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countDownDate), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func countDownDate() {

            let dateFormatter = DateFormatter()
                   dateFormatter.dateFormat = "dd-mm-yyyy" //Your date format
                   dateFormatter.timeZone = TimeZone(abbreviation: "GMT+6:00") //Current time zone
                   let futuredate = dateFormatter.date(from: "03-04-2023") //according to date format your date string
            var calendar = Calendar.current
            let diffDateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: futuredate!, to: Date())
            let countdown = "Days \(String(describing:diffDateComponents.day!)),  Hours: \(String(describing: diffDateComponents.hour!)), Minutes: \(String(describing: diffDateComponents.minute!)), Seconds: \(String(describing: diffDateComponents.second!))"
            print("countdown",countdown)
            var dayText = String(describing: diffDateComponents.day!) + "d "
            var hourText = String(describing: diffDateComponents.hour!) + "h "
           // btnTimeLabel.setTitle(dayText + hourText + String(describing: diffDateComponents.minute!) + "m " + String(describing: diffDateComponents.second!) + "s", for: .normal)
            print(dayText + hourText + String(describing: diffDateComponents.minute!) + "m " + String(describing: diffDateComponents.second!) + "s")
        }



}

