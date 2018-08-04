//
//  ViewController.swift
//  wakeme
//
//  Created by Jeffrey Quach on 4/08/2018.
//  Copyright © 2018 theboys. All rights reserved.
//

import UIKit
import FirebaseDatabase
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet weak var AlarmScreen: UIScrollView!
    
    @IBOutlet weak var NewAlarmButton: UIButton!
    @IBOutlet weak var FriendsButton: UIButton!
    @IBOutlet weak var BadgesButton: UIButton!
    @IBOutlet weak var NewsfeedButton: UIButton!
    @IBOutlet weak var LeaderboardButton: UIButton!
    var ref: DatabaseReference!
    public static var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewAlarmButton.layer.cornerRadius=25
        NewAlarmButton.layer.borderWidth=2
        NewAlarmButton.layer.shadowOpacity=1
        NewAlarmButton.layer.borderColor=UIColor.clear.cgColor
        NewAlarmButton.layer.shadowColor=UIColor.black.cgColor
        NewAlarmButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        FriendsButton.layer.cornerRadius=15
        FriendsButton.layer.borderWidth=2
        FriendsButton.layer.shadowOpacity=1
        FriendsButton.layer.borderColor=UIColor.clear.cgColor
        FriendsButton.layer.shadowColor=UIColor.black.cgColor
        FriendsButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        BadgesButton.layer.cornerRadius=15
        BadgesButton.layer.borderWidth=2
        BadgesButton.layer.shadowOpacity=1
        BadgesButton.layer.borderColor=UIColor.clear.cgColor
        BadgesButton.layer.shadowColor=UIColor.black.cgColor
        BadgesButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        NewsfeedButton.layer.cornerRadius=15
        NewsfeedButton.layer.borderWidth=2
        NewsfeedButton.layer.shadowOpacity=1
        NewsfeedButton.layer.borderColor=UIColor.clear.cgColor
        NewsfeedButton.layer.shadowColor=UIColor.black.cgColor
        NewsfeedButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        LeaderboardButton.layer.cornerRadius=15
        LeaderboardButton.layer.borderWidth=2
        LeaderboardButton.layer.shadowOpacity=1
    LeaderboardButton.layer.borderColor=UIColor.clear.cgColor
        LeaderboardButton.layer.shadowColor=UIColor.black.cgColor
        LeaderboardButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        
        
        
        ref = Database.database().reference()
        
        jeffTest()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NewAlarmPress(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.2, animations: { sender.transform = CGAffineTransform(scaleX: 0.92, y: 0.90)}, completion: {finish in UIButton.animate(withDuration: 0.2, animations: { sender.transform = CGAffineTransform.identity})})
    }
    
    @IBAction func WakeUpFucker(_ sender: Any) {
        ViewController.playSound()
    }
    @IBAction func newAlarmAction(_ sender: Any) {
        ViewController.pauseSound()
    }
   
     static func pauseSound() {
        if player != nil {
            player.pause();
        }
    }
    
    static func playSound() {
        let path = Bundle.main.path(forResource: "Alarm Sound 1", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        }catch let error as NSError {
            print(error.description)
        }
    }
    
    func alarm(){
        ViewController.playSound()
        self.performSegue(withIdentifier: "GameSegue", sender: self)
    }
    
    
    let alarmDate = Date().addingTimeInterval(30)
    
    //func perform(_: alarm, with: nil, afterDelay delay: 30)
    //func perform(_ aSelector: alarm, with anArgument: nil, afterDelay delay: 30, inModes modes: nil)
    
    //let timer = Timer(fireAt: alarmDate, interval: 0, target: self, selector: #selector(alarm), userInfo: nil, repeats: false)
    // RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
    
    
    
    
    
    func jeffTest() {
        
        
        for i in 0...3 {
            let alarmRect = UIView(frame: CGRect(x: 0, y: i * 70, width: Int(AlarmScreen.frame.size.width), height: 60))
            alarmRect.layer.cornerRadius = 10
            alarmRect.backgroundColor = UIColor.gray
            
            let alarmTime = UILabel()
            alarmTime.frame.origin.x = 15
            alarmTime.frame.origin.y = 5
            alarmTime.font = alarmTime.font.withSize(24)
            alarmTime.text = "6:30AM ~ Monday"
            alarmTime.sizeToFit()
            alarmRect.addSubview(alarmTime)
            
            let descLabel = UILabel()
            descLabel.frame.origin.x = 15
            descLabel.frame.origin.y = 30
            descLabel.font = descLabel.font.withSize(18)
            alarmRect.addSubview(descLabel)
            
            ref.child("john_alarms").child("alarm_1").child("desc").observe(.value, with: { (snapshot) in
                descLabel.text = snapshot.value as? String
                descLabel.sizeToFit()
            })
            
            
            
            AlarmScreen.addSubview(alarmRect)
        }
        
        
        AlarmScreen.contentSize = CGSize(width: Int(AlarmScreen.frame.size.width), height: 440)
    }
    
    
}

