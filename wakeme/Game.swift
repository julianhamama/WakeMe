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
    
    var ref: DatabaseReference!
    var databaseHandle:DatabaseHandle?
   // public static var player: AVAudioPlayer!
    
    @objc func buttonDown(_ sender: UIButton) {
        Button2.backgroundColor = UIColor.green
        ref.child("buttonStatus").child("Button2").setValue("in")
    }
    
    @objc func buttonUp(_ sender: UIButton) {
        Button2.backgroundColor = UIColor.gray
        ref.child("buttonStatus").child("Button2").setValue("out")
    }
    
    @objc func buttonDownOther(_ sender: UIButton) {
        Button1.backgroundColor = UIColor.green
        //print("bang")
        ref.child("buttonStatus").child("Button1").setValue("in")
    }
    
    @objc func buttonUpOther(_ sender: UIButton) {
        Button1.backgroundColor = UIColor.blue
        ref.child("buttonStatus").child("Button1").setValue("out")
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
        
        // Do any additional setup after loading the view, typically from a nib.
        
        databaseHandle = ref.child("buttonStatus").child("Button1").observe(.value, with: { (snapShot) in
            
            //code to execte when the data base under yeet is updated.
            let post = snapShot.value as? String
            //if post == "in"{
                //print("bang")
                self.databaseHandle = self.ref.child("buttonStatus").child("Button2").observe(.value, with: { (snapShot) in
                    let post2 = snapShot.value as? String
                    if post2 == "in" && post == "in"{
                        self.ref.child("buttonStatus").child("Button1").setValue("out")
                        self.ref.child("buttonStatus").child("Button2").setValue("out")
                        ViewController.player.pause()
                        self.performSegue(withIdentifier: "TheSegue", sender: self)
                    }
                })
           // }
            
           
            
        })
        
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
