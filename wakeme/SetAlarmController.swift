//
//  SetAlarmController.swift
//  wakeme
//
//  Created by Will Lawless on 4/8/18.
//  Copyright © 2018 theboys. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SetAlarmController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    let myPickerData = [String](arrayLiteral: "John", "Bob", "Jimbo")

    @IBOutlet weak var Friend: UITextField!
    @IBOutlet weak var Description: UITextField!
    let thePicker = UIPickerView()
    var ref: DatabaseReference!
    var timer = Timer();
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var SetAlarmButton: UIButton!
    @IBAction func back(_ sender: Any) {
       //ViewController.player.stop()
        ViewController.pauseSound()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Friend.text = myPickerData[row]
        self.view.endEditing(true)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        SetAlarmButton.layer.cornerRadius=25
        SetAlarmButton.layer.borderWidth=2
        SetAlarmButton.layer.shadowOpacity=0.8
        SetAlarmButton.layer.borderColor=UIColor.clear.cgColor
        SetAlarmButton.layer.shadowColor=UIColor.red.cgColor
        SetAlarmButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
        Friend.inputView = thePicker
        thePicker.delegate = self
        
       
        
  
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setAlarm(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.2, animations: { sender.transform = CGAffineTransform(scaleX: 0.92, y: 0.90)}, completion: {finish in UIButton.animate(withDuration: 0.2, animations: { sender.transform = CGAffineTransform.identity})})
        
        var date = datePicker.date
        let timeInterval = floor(date .timeIntervalSinceReferenceDate / 60.0) * 60.0
        date = NSDate(timeIntervalSinceReferenceDate: timeInterval) as Date
        let dateEpoch = date.timeIntervalSince1970
        
        ref.child("bob_alarm").child("date").setValue(dateEpoch.description)
        ref.child("bob_alarm").child("friend").setValue(Friend.text)
        ref.child("bob_alarm").child("desc").setValue(Description.text)
        ref.child("bob_alarm").child("confirmed").setValue("0")
        
        
//        ref.child(
        
//        Use this to convert back to normal date from epoch
//        let date = NSDate(timeIntervalSince1970: 1415637900)
        
        
        //        let timer1 = Timer(fireAt: date1, interval: 0, target: self, selector: #selector(printSomething), userInfo: nil, repeats: false)
//        let timer2 = Timer(fireAt: date2, interval: 0, target: self, selector: #selector(printSomething), userInfo: nil, repeats: false)

//        RunLoop.main.add(timer1, forMode: RunLoopMode.commonModes)
//        RunLoop.main.add(timer2, forMode: RunLoopMode.commonModes)

    
    }
    func printSomething() {
        print("something")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
