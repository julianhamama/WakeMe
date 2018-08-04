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

    var ref: DatabaseReference!
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func newAlarmAction(_ sender: Any) {
        playSound()
    }
   
    
    func playSound() {
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
    
    
}

