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
    var timer = Timer()
    public static var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewAlarmButton.layer.cornerRadius=5
        NewAlarmButton.layer.borderWidth=2
        NewAlarmButton.layer.shadowOpacity=0
        NewAlarmButton.layer.borderColor=UIColor.clear.cgColor
        NewAlarmButton.layer.shadowColor=UIColor.black.cgColor
        NewAlarmButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        FriendsButton.layer.cornerRadius=5
        FriendsButton.layer.borderWidth=2
        FriendsButton.layer.shadowOpacity=0
        FriendsButton.layer.borderColor=UIColor.clear.cgColor
        FriendsButton.layer.shadowColor=UIColor.black.cgColor
        FriendsButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        BadgesButton.layer.cornerRadius=5
        BadgesButton.layer.borderWidth=2
        BadgesButton.layer.shadowOpacity=0
        BadgesButton.layer.borderColor=UIColor.clear.cgColor
        BadgesButton.layer.shadowColor=UIColor.black.cgColor
        BadgesButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        NewsfeedButton.layer.cornerRadius=5
        NewsfeedButton.layer.borderWidth=2
        NewsfeedButton.layer.shadowOpacity=0
        NewsfeedButton.layer.borderColor=UIColor.clear.cgColor
        NewsfeedButton.layer.shadowColor=UIColor.black.cgColor
        NewsfeedButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        LeaderboardButton.layer.cornerRadius=5
        LeaderboardButton.layer.borderWidth=2
        LeaderboardButton.layer.shadowOpacity=0
    LeaderboardButton.layer.borderColor=UIColor.clear.cgColor
        LeaderboardButton.layer.shadowColor=UIColor.black.cgColor
        LeaderboardButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        
        
        
        ref = Database.database().reference()
        
        jeffTest()
        jeffsFinalStand()
        
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
        ref.child("bob_alarm").removeValue()
    }
    
    
    
    
    func jeffTest() {
        
        /*
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
        */
        
        let alarmRect = UIView(frame: CGRect(x: 0, y: 0, width: Int(AlarmScreen.frame.size.width), height: 100))
        alarmRect.layer.cornerRadius = 10
        alarmRect.backgroundColor = UIColor.gray
        
        let alarmTime = UILabel()
        alarmTime.frame.origin.x = 15
        alarmTime.frame.origin.y = 5
        alarmTime.font = alarmTime.font.withSize(24)
        alarmRect.addSubview(alarmTime)
        
        
        
        self.ref.child("bob_alarm").child("date").observe(.value, with: { (snapshot) in
            let dateString = snapshot.value as? String
            if(dateString != nil){
                let date = Date(timeIntervalSince1970: Double(dateString!)!)
                let formatter = DateFormatter()
                formatter.dateFormat = "MM-dd HH:mm"
                let myString = formatter.string(from: date)
                alarmTime.text = myString
                alarmTime.sizeToFit()
                let date2 = Date().addingTimeInterval(10)
                
                let timer1 = Timer(fireAt: date, interval: 0, target: self, selector: #selector(self.alarm), userInfo: nil, repeats: false)
                RunLoop.main.add(timer1, forMode: RunLoopMode.commonModes)
            }
            
            
        })
        
        let descLabel = UILabel()
        descLabel.frame.origin.x = 15
        descLabel.frame.origin.y = 30
        descLabel.font = descLabel.font.withSize(18)
        alarmRect.addSubview(descLabel)
        
        self.ref.child("bob_alarm").child("desc").observe(.value, with: { (snapshot) in
            
            descLabel.text = snapshot.value as? String
            descLabel.sizeToFit()
        })
        
        
        
        AlarmScreen.addSubview(alarmRect)

    }
    
    func accept(_ sender: UIButton) {
        AlarmScreen.subviews.forEach({ $0.removeFromSuperview() })
        
        jeffTest()
        
    }
    
    func decline(_ sender: UIButton) {
        print("booooooop")
    }
    
    func jeffsHelper(timer: Timer) {
        ref.child("bob_alarm").child("confirmed").observe(.value, with: { (snapshot) in
            let temp = snapshot.value as? String
            
            print(temp ?? "nil")
            
            if (temp == "0") {
                self.ref.child("bob_alarm").child("confirmed").setValue("1")
                
                let alarmRect = UIView(frame: CGRect(x: 0, y: 0, width: Int(self.AlarmScreen.frame.size.width), height: 100))
                alarmRect.layer.cornerRadius = 10
                alarmRect.backgroundColor = UIColor.gray
                
                let alarmTime = UILabel()
                alarmTime.frame.origin.x = 15
                alarmTime.frame.origin.y = 5
                alarmTime.font = alarmTime.font.withSize(24)
                alarmRect.addSubview(alarmTime)
                
                self.ref.child("bob_alarm").child("date").observe(.value, with: { (snapshot) in
                    let date = Date(timeIntervalSince1970: Double(snapshot.value as! String)!)
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MM-dd HH:mm"
                    let myString = formatter.string(from: date)
                    alarmTime.text = myString
                    alarmTime.sizeToFit()
                })
                
                
                let descLabel = UILabel()
                descLabel.frame.origin.x = 15
                descLabel.frame.origin.y = 30
                descLabel.font = descLabel.font.withSize(18)
                alarmRect.addSubview(descLabel)
                
                self.ref.child("bob_alarm").child("desc").observe(.value, with: { (snapshot) in
                    descLabel.text = snapshot.value as? String
                    descLabel.sizeToFit()
                })
                
                let acceptButton = UIButton(frame: CGRect(x: 0, y: 0, width: Int(self.AlarmScreen.frame.size.width / 2), height: 30))
                acceptButton.setTitle("Accept", for: UIControlState.normal)
                acceptButton.frame.origin.x = 0
                acceptButton.frame.origin.y = 70
                acceptButton.addTarget(self, action: #selector(self.accept), for: UIControlEvents.touchUpInside)
                acceptButton.backgroundColor = UIColor.green
                alarmRect.addSubview(acceptButton)
                
                
                let declineButton = UIButton(frame: CGRect(x: 0, y: 0, width: Int(self.AlarmScreen.frame.size.width / 2), height: 30))
                declineButton.setTitle("Decline", for: UIControlState.normal)
                declineButton.frame.origin.x = self.AlarmScreen.frame.size.width / 2
                declineButton.frame.origin.y = 70
                declineButton.addTarget(self, action: #selector(self.decline), for: UIControlEvents.touchUpInside)
                declineButton.backgroundColor = UIColor.red
                alarmRect.addSubview(declineButton)
                
                
                self.AlarmScreen.addSubview(alarmRect)

            } else {
                //self.jeffTest()
            }
            
        })
    }
    
    func jeffsFinalStand() {
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in
            
            self.jeffsHelper(timer: timer)
        }
    }
    
    
    
}

