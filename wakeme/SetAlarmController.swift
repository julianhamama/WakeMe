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
    
    @IBAction func back(_ sender: Any) {
        ViewController.player.stop()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
