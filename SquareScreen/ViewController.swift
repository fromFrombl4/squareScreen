//
//  ViewController.swift
//  SquareScreen
//
//  Created by Roman Dod on 7/11/20.
//  Copyright © 2020 Roman Dod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - enum
    enum ColorText {
        case redColor
        case greenColor
        case blueColor
    }
    
    @IBOutlet weak var placeView: UIView!
    @IBOutlet weak var counterStepper: UIStepper!
    @IBOutlet weak var numberLabel: UILabel!
    
    var labelPadding = 5
    weak var labelViewGlobal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterStepper.wraps = false
        counterStepper.autorepeat = true
        counterStepper.stepValue = 10.0
        counterStepper.maximumValue = 100.0
        
        
    }
    @IBAction func stepper(_ sender: UIStepper) {
        
        numberLabel.text = Int(sender.value).description
    }
    
    //    func createSquareView(side: Double) -> UIView{
    //
    ////        var valueString = numberLabel.text
    //
    //        let squareView = UIView()
    //        squareView.frame = CGRect(x: 0, y: 0, width: counterStepper.value, height: counterStepper.value)
    //        squareView.backgroundColor = UIColor.init(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    //
    //        let labelView = UILabel()
    //        labelView.frame = CGRect(x: labelPadding, y: labelPadding, width: Int(counterStepper.value) - labelPadding, height: Int(counterStepper.value) - labelPadding)
    //        labelView.backgroundColor = .white
    //        squareView.addSubview(labelView)
    //
    //        return squareView
    //
    //    }
    
    func getColor(_ color: ColorText){
        
        switch color {
        case .redColor:
            labelViewGlobal.text = "red"
        case .greenColor:
            labelViewGlobal.text = "green"
        case .blueColor:
            labelViewGlobal.text = "blue"
        }
    }
    
    @IBAction func pressedGoButton(_ sender: UIButton) {
        
        
        placeView.subviews.forEach {
            $0.removeFromSuperview()
        }
        
        let widthCount = Int(placeView.frame.width) / Int(counterStepper.value)
        let heightCount = Int(placeView.frame.height) / Int(counterStepper.value)
        
        let coordinateXSequence = stride(from: 0, to: Int(counterStepper.value) * widthCount, by: Int(counterStepper.value))
        
        let coordinateYSequence = stride(from: 0, to: Int(counterStepper.value) * heightCount, by: Int(counterStepper.value))
        
        var y = 0
        
        for i in coordinateYSequence{
            y += Int(counterStepper.value)
            
            for x in coordinateXSequence {
                
                let createView = UIView()
                createView.frame = CGRect(x: x, y: y, width: Int(counterStepper.value), height: Int(counterStepper.value))
                
                let red = CGFloat.random(in: 0...1)
                let green = CGFloat.random(in: 0...1)
                let blue = CGFloat.random(in: 0...1)
                
                
                createView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
                
                
                placeView.addSubview(createView)
                
                       
                
                let labelView = UILabel()
                labelView.frame = CGRect(x: labelPadding, y: labelPadding, width: Int(counterStepper.value) - labelPadding, height: Int(counterStepper.value) - labelPadding)
                labelView.backgroundColor = .white
                labelView.text = "\(Int(red * 255)), \(Int(green * 255)), \(Int(blue * 255))"
                labelView.font = UIFont.systemFont(ofSize: 10)
                createView.addSubview(labelView)
                
                
            
            
            }
            
            
            
        }
        
        
        
        
    }
    
    
    
}
