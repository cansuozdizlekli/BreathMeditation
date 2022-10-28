//
//  RemindersVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/4/22.
//

import UIKit
import UserNotifications

class RemindersVC: UIViewController, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()

    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var secondQuestionTitle: UILabel!
    @IBOutlet weak var sundayButton: UIButton!
    @IBOutlet weak var mondayButton: UIButton!
    @IBOutlet weak var tuesdayButton: UIButton!
    @IBOutlet weak var wednesdayButton: UIButton!
    @IBOutlet weak var thursdayButton: UIButton!
    @IBOutlet weak var fridayButton: UIButton!
    @IBOutlet weak var saturdayButton: UIButton!
    
    var days : [String] = ["SU","M","T","W","S"]
    var timeNotification : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpItems()
        
        
    }
    

        
    func setUpItems(){
        let formatter  = DateFormatter()
        formatter.locale = Locale(identifier: "tr_TR")
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = .current
//        formatter.timeZone = TimeZone.init(secondsFromGMT: 3)
//        timePicker.timeZone = TimeZone.init(secondsFromGMT: 3)
//        timePicker.date.addTimeInterval(10800)
        timePicker.backgroundColor = .systemGray6
        timePicker.layer.cornerRadius = 18
        timePicker.layer.masksToBounds = true
        print("zaman", formatter.string(from: timePicker.date))
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        saveButton.backgroundColor = .primaryIndigo
        saveButton.layer.cornerRadius = 32
        sundayButton.layer.cornerRadius = 21
        mondayButton.layer.cornerRadius = 21
        tuesdayButton.layer.cornerRadius = 21
        wednesdayButton.layer.cornerRadius = 21
        thursdayButton.layer.cornerRadius = 21
        fridayButton.layer.cornerRadius = 21
        saturdayButton.layer.cornerRadius = 21
        thursdayButton.layer.borderWidth = 0.2
        fridayButton.layer.borderWidth = 0.2
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        let isFirstTime = true
        UserDefaults.standard.set(isFirstTime, forKey: "isFirstTime")
    }
    
    var isButtonTapped = false
    @IBAction func saveClicked(_ sender: Any) {
        if(!isButtonTapped){
            askPermission()
            UserDefaults.standard.set(timeNotification, forKey: "notificationTime")
            UserDefaults.standard.set(days, forKey: "notificationDays")
                isButtonTapped = true
             }else {
                let hourAndMinuteArr = timeNotification.components(separatedBy: ":")
                print("cansu",hourAndMinuteArr[0])
                print("cansu",hourAndMinuteArr[1])
                 for day in days {
                     if day == "SU"{
                         let notiDay = createDate(weekday: 1, hour: hourAndMinuteArr[0], minute: hourAndMinuteArr[1])
                         print("bildirim gonderilecek gunler:",notiDay)
                         
                     }
                     if day == "M"{
                         let notiDay = createDate(weekday: 2, hour: hourAndMinuteArr[0], minute: hourAndMinuteArr[1])
                         print("bildirim gonderilecek gunler:",notiDay)
                         
                     }
                     if day == "T"{
                         let notiDay = createDate(weekday: 3, hour: hourAndMinuteArr[0], minute: hourAndMinuteArr[1])
                         print("bildirim gonderilecek gunler:",notiDay)
                         
                     }
                     if day == "W"{
                         let notiDay = createDate(weekday: 4, hour: hourAndMinuteArr[0], minute: hourAndMinuteArr[1])
                         print("bildirim gonderilecek gunler:",notiDay)
                         
                     }
                     if day == "TH"{
                         let notiDay = createDate(weekday: 5, hour: hourAndMinuteArr[0], minute: hourAndMinuteArr[1])
                         print("bildirim gonderilecek gunler:",notiDay)
                         
                     }
                     if day == "F"{
                         let notiDay = createDate(weekday: 6, hour: hourAndMinuteArr[0], minute: hourAndMinuteArr[1])
                         print("bildirim gonderilecek gunler:",notiDay)
                         
                     }
                     if day == "S"{
                         let notiDay = createDate(weekday: 7, hour: hourAndMinuteArr[0], minute: hourAndMinuteArr[1])
                         print("bildirim gonderilecek gunler:",notiDay)
                     }}
                self.presentVC(to: TabBarController())
            }
            
        }
    
    private func askPermission(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .sound , .alert]) { granted, error in
            if error == nil {
                print("user permission is granted : \(granted)" )
            }
        }
    }

        
    
    
    
    func createDate(weekday: Int, hour: String, minute: String)->Date{
        timePicker.timeZone = .current
        var dateComp = Calendar.current.dateComponents([.weekday, .hour, .minute], from: timePicker.date)
        dateComp.weekday = weekday
//        dateComp.minute = minute
//        dateComp.hour = hour
        print("ğ",dateComp)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let timeZoneAbb = TimeZone.current.abbreviation()
//        print("some", timeZoneAbb!)
        let a = timeZoneAbb?.components(separatedBy: "+")
        let b = a![1]
        formatter.timeZone = TimeZone(secondsFromGMT: Int(b)!)
        
//        print("some", dateComp.weekday!)
        let dateCansu = "\(hour):\(minute)"
        let someDateTime = formatter.date(from: dateCansu)!
        
        print("some", dateCansu,someDateTime)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: true)
        let content = UNMutableNotificationContent()
        content.title = "Meditation ?"
        content.body = "daily reminder"
//        print("dk cnm",dateComp.minute)
        
                    
        print("trigger weekly", dateComp)

        let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)

        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request) {(error) in
        if let error = error {
        print("Uh oh! We had an error: \(error)")
            }
        }

        return someDateTime
    }
 
    
    @IBAction func noThanksClicked(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "notificationTime")
        UserDefaults.standard.synchronize()
        self.presentVC(to: TabBarController())
    }
    
    @objc func timePickerValueChanged(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "tr_TR")
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = .current
        let str = formatter.string(from: timePicker.date)
        timeNotification = str
        print("func ici 1",formatter.string(from: timePicker.date), str)

    }
    
    @IBAction func sundayButtonClicked(_ sender: UIButton) {
        changeButtonColor(sender: sundayButton)
    }
    
    @IBAction func mondayButtonClicked(_ sender: Any) {
        changeButtonColor(sender: mondayButton)
    }
    
    @IBAction func tuesdayButtonClicked(_ sender: Any) {
        changeButtonColor(sender: tuesdayButton)
    }
    
    @IBAction func wednesdayButtonClicked(_ sender: Any) {
        changeButtonColor(sender: wednesdayButton)
    }
    
    @IBAction func thursdayButtonClicked(_ sender: Any) {
        changeButtonColor(sender: thursdayButton)
    }
    
    @IBAction func fridayButtonClicked(_ sender: Any) {
        changeButtonColor(sender: fridayButton)
    }
    
    @IBAction func saturdayButtonClicked(_ sender: Any) {
        changeButtonColor(sender: saturdayButton)
    }
    func changeButtonColor(sender: UIButton){
        sender.isSelected.toggle()
        if sender.isSelected {
            days.append(sender.titleLabel!.text!)
            print("eklendi", days)
            sender.backgroundColor = .primaryTitleColor
            sender.setTitleColor(.white, for: .selected)
            
        } else {
            print("silmeden once", days)
            if days.contains(sender.titleLabel!.text!) {
                days.removeEqualItems(sender.titleLabel!.text!)
            }
            print("sildikten sonra", days)
            sender.backgroundColor = .white
            sender.setTitleColor(.primaryTitleColor, for: .normal)
            sender.layer.borderWidth = 0.2
            
        }
    }
    
}

extension Array where Element: Equatable {
    
    mutating func removeEqualItems(_ item: Element) {
        self = self.filter { (currentItem: Element) -> Bool in
            return currentItem != item
        }
    }
}
