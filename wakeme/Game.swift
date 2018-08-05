//
//  Game.swift
//  wakeme
//
//  Created by Will Lawless on 4/8/18.
//  Copyright © 2018 theboys. All rights reserved.
//

import UIKit
import FirebaseDatabase
import AVFoundation

class Game: UIViewController {

    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    var post1: String = "poo"
    var post2: String = "poo"
    
    var ref: DatabaseReference!
    var databaseHandle:DatabaseHandle?
   // public static var player: AVAudioPlayer!
    
    @objc func buttonDownOther(_ sender: UIButton) {
//        Button1.backgroundColor = UIColor.green
        ref.child("buttonStatus").child("Button1").setValue("in")
    }
    
    @objc func buttonUpOther(_ sender: UIButton) {
//        Button1.backgroundColor = UIColor.blue
        ref.child("buttonStatus").child("Button1").setValue("out")
    }
    
    @objc func buttonDown(_ sender: UIButton) {
//        Button2.backgroundColor = UIColor.green
        ref.child("buttonStatus").child("Button2").setValue("in")
    }
    
    @objc func buttonUp(_ sender: UIButton) {
//        Button2.backgroundColor = UIColor.gray
        ref.child("buttonStatus").child("Button2").setValue("out")
    }
 
    
    func jeffsHelper1(timer: Timer){
        
        
        databaseHandle = ref.child("buttonStatus").child("Button1").observe(.value, with: { (snapShot) in
            self.post1 = snapShot.value as! String
            if(self.post1 == "in"){
                self.Button1.backgroundColor = UIColor.green
            } else {
                self.Button1.backgroundColor = UIColor.red
            }
        })
        
        databaseHandle = ref.child("buttonStatus").child("Button2").observe(.value, with: { (snapShot) in
            self.post2 = snapShot.value as! String
            if(self.post2 == "in"){
                self.Button2.backgroundColor = UIColor.green
            } else {
                self.Button2.backgroundColor = UIColor.red
            }
        })
        print(self.post1,self.post2)
        if(self.post1 == "in" && self.post2 == "in"){
            print("youre in")
            ViewController.player.pause()
            self.performSegue(withIdentifier: "TheSegue", sender: self)
            self.post1 = "poo"
            self.post2 = "poo"
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Button1.layer.cornerRadius=25
        Button2.layer.cornerRadius=25
        
        Button2.addTarget(self, action: #selector(buttonDown), for: .touchDown)
        Button2.addTarget(self, action: #selector(buttonUp), for: [.touchUpInside, .touchUpOutside])
        
        Button1.addTarget(self, action: #selector(buttonDownOther), for: .touchDown)
        Button1.addTarget(self, action: #selector(buttonUpOther), for: [.touchUpInside, .touchUpOutside])
        
        ref = Database.database().reference()

        _ = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {
            timer in
            self.jeffsHelper1(timer: timer)
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Button1Press(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.2, animations: { sender.transform = CGAffineTransform(scaleX: 0.92, y: 0.90)}, completion: {finish in UIButton.animate(withDuration: 0.2, animations: { sender.transform = CGAffineTransform.identity})})
    }
    
    
    @IBAction func ButtonPress2(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.2, animations: { sender.transform = CGAffineTransform(scaleX: 0.92, y: 0.90)}, completion: {finish in UIButton.animate(withDuration: 0.2, animations: { sender.transform = CGAffineTransform.identity})})
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
