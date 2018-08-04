//
//  SetAlarmController.swift
//  wakeme
//
//  Created by Will Lawless on 4/8/18.
//  Copyright © 2018 theboys. All rights reserved.
//

import UIKit

class SetAlarmController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var SetAlarmButton: UIButton!
    @IBAction func back(_ sender: Any) {
        ViewController.player.stop()
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SetAlarmPress(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.2, animations: { sender.transform = CGAffineTransform(scaleX: 0.92, y: 0.90)}, completion: {finish in UIButton.animate(withDuration: 0.2, animations: { sender.transform = CGAffineTransform.identity})})
    }
    
    @IBAction func setAlarm(_ sender: Any) {
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
