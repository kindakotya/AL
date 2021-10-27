//
//  ViewController.swift
//  AutolayoutNKS
//
//  Created by Godrick Mayweather on 25.10.2021.
//
var i = 1
import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet var redTrailing: NSLayoutConstraint!
    
    @IBOutlet var blueLeading: NSLayoutConstraint!
    @IBOutlet var redBotBlueTop: NSLayoutConstraint!
    @IBOutlet var redTop: NSLayoutConstraint!

    override func viewDidLoad() {

        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
            //print(redView.trailingAnchor)
//            redView.heightAnchor.constraint(equalToConstant:super.view.heightAnchor.accessibilityFrame.height - 32).isActive = true
        }
    func checkHorSizeClass(){

//        let heigthCompact = redView.heightAnchor.constraint(equalTo: super.view.heightAnchor, constant: -32)
//        let trailCompact = redView.trailingAnchor.constraint(equalTo: super.view.trailingAnchor, constant: 16)
//        let bottomCompact = redView.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -16)
        let rTrailBLead = redView.trailingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: -16)
//        let widthCompact = redView.widthAnchor.constraint(equalTo: super.view.widthAnchor, multiplier: 1/2, constant: -24)
        let topRBCompact = redView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor)
        rTrailBLead.priority = UILayoutPriority(999)
        topRBCompact.priority = UILayoutPriority(999)

        if super.traitCollection.horizontalSizeClass.rawValue == UIUserInterfaceSizeClass.compact.rawValue{
//            redView.translatesAutoresizingMaskIntoConstraints = false
//            blueView.translatesAutoresizingMaskIntoConstraints = false
            redTrailing.isActive = false
            blueLeading.isActive = false
            redBotBlueTop.isActive = false
            rTrailBLead.isActive = true
            //heigthCompact.isActive = true
            //trailCompact.isActive = true
//            bottomCompact.isActive = true
//            widthCompact.isActive = true
            topRBCompact.isActive = true

        }
        else{
            rTrailBLead.isActive = false
            topRBCompact.isActive = false
//            bottomCompact.isActive = false
//            widthCompact.isActive = false
            redBotBlueTop.isActive = true
            blueLeading.isActive = true
            redTrailing.isActive = true
           // heigthCompact.isActive = false
            //trailCompact.isActive = false
            
            //topRBCompact.isActive = false
        }
    }
    override func viewDidLayoutSubviews() {
        checkHorSizeClass();
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        checkHorSizeClass();
        print(super.traitCollection.horizontalSizeClass.rawValue)
    }
//    @IBAction func changeConstrains(){
//
//        }
    

}

