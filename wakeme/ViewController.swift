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
        NewAlarmButton.layer.shadowOpacity=0.8
        NewAlarmButton.layer.borderColor=UIColor.clear.cgColor
        NewAlarmButton.layer.shadowColor=UIColor.red.cgColor
        NewAlarmButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        FriendsButton.layer.cornerRadius=15
        FriendsButton.layer.borderWidth=2
        FriendsButton.layer.shadowOpacity=0.8
        FriendsButton.layer.borderColor=UIColor.clear.cgColor
        FriendsButton.layer.shadowColor=UIColor.red.cgColor
        FriendsButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        BadgesButton.layer.cornerRadius=15
        BadgesButton.layer.borderWidth=2
        BadgesButton.layer.shadowOpacity=0.8
        BadgesButton.layer.borderColor=UIColor.clear.cgColor
        BadgesButton.layer.shadowColor=UIColor.red.cgColor
        BadgesButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        NewsfeedButton.layer.cornerRadius=15
        NewsfeedButton.layer.borderWidth=2
        NewsfeedButton.layer.shadowOpacity=0.8
        NewsfeedButton.layer.borderColor=UIColor.clear.cgColor
        NewsfeedButton.layer.shadowColor=UIColor.red.cgColor
        NewsfeedButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        LeaderboardButton.layer.cornerRadius=15
        LeaderboardButton.layer.borderWidth=2
        LeaderboardButton.layer.shadowOpacity=0.8
    LeaderboardButton.layer.borderColor=UIColor.clear.cgColor
        LeaderboardButton.layer.shadowColor=UIColor.red.cgColor
        LeaderboardButton.layer.shadowOffset=CGSize(width: 5, height: 5)
        
        
        
        
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NewAlarmPress(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.2, animations: { sender.transform = CGAffineTransform(scaleX: 0.92, y: 0.90)}, completion: {finish in UIButton.animate(withDuration: 0.2, animations: { sender.transform = CGAffineTransform.identity})})
    }
    
    @IBAction func newAlarmAction(_ sender: Any) {
        ViewController.playSound()
    }
   
     static func pauseSound() {
        if player != nil {
            player.pause();
        }
    }
    
    static func playSound() {
        let path = Bundle.main.path(forResource: "Alarm Sound 2", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        }catch let error as NSError {
            print(error.description)
        }
    }
    
    
}

