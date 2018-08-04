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
        FriendsButton.layer.cornerRadius=25
        BadgesButton.layer.cornerRadius=25
        NewsfeedButton.layer.cornerRadius=25
        LeaderboardButton.layer.cornerRadius=25
        
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

