//
//  ViewController.swift
//  SquareScreen
//
//  Created by Roman Dod on 7/11/20.
//  Copyright © 2020 Roman Dod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var placeView: UIView!
    @IBOutlet private weak var counterStepper: UIStepper!
    @IBOutlet private weak var numberLabel: UILabel!
    
    private var labelPadding = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterStepper.wraps = false
        counterStepper.autorepeat = true
        counterStepper.stepValue = 10.0

        updateLabel()
    }

    @IBAction func stepper(_ sender: UIStepper) {
        updateLabel()
    }

    func updateLabel() {
        numberLabel.text = Int(counterStepper.value).description
    }

    func makeRandomColorView(frame: CGRect) -> UIView {
        let createView = UIView()
        createView.frame = frame

        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        createView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)

        let labelView = UILabel()
        labelView.frame = CGRect(x: labelPadding, y: labelPadding, width: Int(counterStepper.value) - labelPadding*2, height: Int(counterStepper.value) - labelPadding*2)
        labelView.backgroundColor = .white
        labelView.text = "\(Int(red * 255)), \(Int(green * 255)), \(Int(blue * 255))"
        labelView.font = UIFont.systemFont(ofSize: 10)
        createView.addSubview(labelView)
        return createView
    }
    
    @IBAction func pressedGoButton(_ sender: UIButton) {

        placeView.subviews.forEach {
            $0.removeFromSuperview()
        }

        var lastOrigin = CGPoint(x: 0, y: 0)
        var finished = false

        while !finished {
            let view = makeRandomColorView(frame: CGRect(x: lastOrigin.x,
                                                         y: lastOrigin.y,
                                                         width: counterStepper.floatValue,
                                                         height: counterStepper.floatValue))
            placeView.addSubview(view)

            lastOrigin.x += counterStepper.floatValue

            if lastOrigin.x > placeView.bounds.width - counterStepper.floatValue {
                lastOrigin.x = 0
                lastOrigin.y += counterStepper.floatValue
            }

            if lastOrigin.y > placeView.bounds.height - counterStepper.floatValue {
                finished = true
            }
        }
    }
}

private extension UIStepper {
    var floatValue: CGFloat {
        CGFloat(self.value)
    }
}
