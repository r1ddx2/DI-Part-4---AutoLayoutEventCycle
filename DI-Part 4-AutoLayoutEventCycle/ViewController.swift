//
//  ViewController.swift
//  DI-Part 4-AutoLayoutEventCycle
//
//  Created by Red Wang on 2023/10/25.
//

import UIKit

class ViewController: UIViewController {
    
    let yellowCircle = UIView()
    let purpleCircle = UIView()
    let redCircle = UIView()
    
    let bigCircleRadius = UIScreen.main.bounds.width / 2.0
    let smallCircleRadius = UIScreen.main.bounds.width / 4.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpCircles()
        setUpBigCircleLayouts()
        setUpLayouts()
    }
    
    private func setUpCircles(){
        yellowCircle.layer.cornerRadius = bigCircleRadius * 0.5
        yellowCircle.backgroundColor = UIColor.yellowCircleColor
        purpleCircle.layer.cornerRadius = smallCircleRadius * 0.5
        purpleCircle.backgroundColor = UIColor.purpleCircleColor
        
        redCircle.layer.cornerRadius = smallCircleRadius * 0.5
        redCircle.backgroundColor = UIColor.redCircleColor
    }
    private func setUpBigCircleLayouts(){
        yellowCircle.addSubview(purpleCircle)
        yellowCircle.addSubview(redCircle)
        
        yellowCircle.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            purpleCircle.centerYAnchor.constraint(equalTo: yellowCircle.centerYAnchor),
            purpleCircle.widthAnchor.constraint(equalToConstant: smallCircleRadius),
            purpleCircle.heightAnchor.constraint(equalToConstant: smallCircleRadius),
            purpleCircle.leadingAnchor.constraint(equalTo: yellowCircle.leadingAnchor),
            
            redCircle.leadingAnchor.constraint(equalTo: purpleCircle.trailingAnchor),
            redCircle.trailingAnchor.constraint(equalTo: yellowCircle.trailingAnchor),
            redCircle.centerYAnchor.constraint(equalTo: yellowCircle.centerYAnchor),
            redCircle.widthAnchor.constraint(equalToConstant: smallCircleRadius),
            redCircle.heightAnchor.constraint(equalToConstant: smallCircleRadius)
        ])
        
    }
    private func setUpLayouts() {
        view.addSubview(yellowCircle)
        
        yellowCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            yellowCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellowCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            yellowCircle.widthAnchor.constraint(equalToConstant: bigCircleRadius),
            yellowCircle.heightAnchor.constraint(equalToConstant: bigCircleRadius)
        ])
    }
}

