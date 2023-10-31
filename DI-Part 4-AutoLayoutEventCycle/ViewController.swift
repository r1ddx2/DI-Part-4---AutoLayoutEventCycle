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
   
    override func viewDidLayoutSubviews() {
        setUpCircles()
        setUpLayouts()
        view.layoutIfNeeded()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }
    
    private func setUpCircles(){
        let yellowRadius = view.frame.width / 4.0
        yellowCircle.layer.cornerRadius = yellowRadius
        yellowCircle.backgroundColor = UIColor.yellowCircleColor
    
        purpleCircle.layer.cornerRadius = yellowRadius / 2.0
        purpleCircle.backgroundColor = UIColor.purpleCircleColor
        
        redCircle.layer.cornerRadius = yellowRadius / 2.0
        redCircle.backgroundColor = UIColor.redCircleColor
    }
    
    private func setUpLayouts() {
        view.addSubview(yellowCircle)
        yellowCircle.translatesAutoresizingMaskIntoConstraints = false
   
        NSLayoutConstraint.activate([
            yellowCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellowCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            yellowCircle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            yellowCircle.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
  
        // MARK: - Yellow Circle View
        yellowCircle.addSubview(purpleCircle)
        yellowCircle.addSubview(redCircle)
        yellowCircle.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            purpleCircle.centerYAnchor.constraint(equalTo: yellowCircle.centerYAnchor),
            purpleCircle.leadingAnchor.constraint(equalTo: yellowCircle.leadingAnchor),
            purpleCircle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            purpleCircle.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            
            redCircle.leadingAnchor.constraint(equalTo: purpleCircle.trailingAnchor),
            redCircle.centerYAnchor.constraint(equalTo: yellowCircle.centerYAnchor),
            redCircle.trailingAnchor.constraint(equalTo: yellowCircle.trailingAnchor),
            redCircle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            redCircle.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
        ])
    }
   
}
