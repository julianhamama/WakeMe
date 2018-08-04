//
//  Leaderboard.swift
//  wakeme
//
//  Created by Will Lawless on 4/8/18.
//  Copyright © 2018 theboys. All rights reserved.
//

import UIKit
import FirebaseDatabase
import AVFoundation
class Leaderboard: UIViewController {

    @IBOutlet weak var Leaderboard: UIScrollView!
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        jeffTest()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func jeffTest() {
        
        
        for i in 0...10 {
            let alarmRect = UIView(frame: CGRect(x: 0, y: i * 110, width: Int(Leaderboard.frame.size.width), height: 100))
            alarmRect.layer.cornerRadius = 10
            alarmRect.backgroundColor = UIColor.gray
            
            let alarmTime = UILabel()
            alarmTime.frame.origin.x = 15
            alarmTime.frame.origin.y = 15
            alarmTime.font = alarmTime.font.withSize(24)
            alarmTime.text = "1st"
            alarmTime.sizeToFit()
            alarmRect.addSubview(alarmTime)
            
            let descLabel = UILabel()
            descLabel.frame.origin.x = 15
            descLabel.frame.origin.y = 50
            descLabel.font = descLabel.font.withSize(18)
            alarmRect.addSubview(descLabel)
            
            ref.child("john_alarms").child("alarm_1").child("desc").observe(.value, with: { (snapshot) in
                descLabel.text = snapshot.value as? String
                descLabel.sizeToFit()
            })
            
            
            
            Leaderboard.addSubview(alarmRect)
        }
        
        
        Leaderboard.contentSize = CGSize(width: Int(Leaderboard.frame.size.width), height: 1110)
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
