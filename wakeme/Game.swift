//
//  Game.swift
//  wakeme
//
//  Created by Will Lawless on 4/8/18.
//  Copyright © 2018 theboys. All rights reserved.
//

import UIKit

class Game: UIViewController {

    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Button1.layer.cornerRadius=25
        Button2.layer.cornerRadius=25
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
