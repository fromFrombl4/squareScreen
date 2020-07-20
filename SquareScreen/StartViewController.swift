//
//  StartViewController.swift
//  SquareScreen
//
//  Created by Roman Dod on 7/20/20.
//  Copyright © 2020 Roman Dod. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func pressedStartButton(_ sender: UIButton) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func pressedExitButton(_ sender: UIButton) {
        
        UIControl().sendAction(#selector(NSXPCConnection.suspend),
        to: UIApplication.shared, for: nil)
    }
    
    
}
