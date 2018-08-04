//
//  SetAlarmController.swift
//  wakeme
//
//  Created by Will Lawless on 4/8/18.
//  Copyright © 2018 theboys. All rights reserved.
//

import UIKit

class SetAlarmController: UIViewController {

    var timer = Timer();
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var SetAlarmButton: UIButton!
    @IBAction func back(_ sender: Any) {
        ViewController.player.stop()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        SetAlarmButton.layer.cornerRadius=25
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func setAlarm(_ sender: Any) {
        let date1 = Date().addingTimeInterval(5)
        let date2 = Date().addingTimeInterval(7)
        let timer1 = Timer(fireAt: date1, interval: 0, target: self, selector: #selector(printSomething), userInfo: nil, repeats: false)
        let timer2 = Timer(fireAt: date2, interval: 0, target: self, selector: #selector(printSomething), userInfo: nil, repeats: false)

        RunLoop.main.add(timer1, forMode: RunLoopMode.commonModes)
        RunLoop.main.add(timer2, forMode: RunLoopMode.commonModes)

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
