//
//  ViewController.swift
//  FrameBounds
//
//  Created by Владимир Малышев on 09.08.2023.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sliders = [frameXSlider,frameYSlider,frameWidthSlider,frameHeightSlider,boundsXSlider,boundsYSlider,boundsWidthSlider,boundsHeightSlider,centerXSlider,centerYSlider,rotationSlider]
        
        let labels = [frameX,frameY,frameWidth,frameHeight,boundsX,boundsY,boundsWidth,boundsHeight,centerX,centerY,rotation]
        makeConstraintForSliders(sliders: sliders)
        makeConstraintForLabels(labels: labels,sliders: sliders)
        
        updateLabels()
        settingSliders()
        
    }

    @IBOutlet weak var myView: UIView!
    
       // Labels
       @IBOutlet weak var frameX: UILabel!
       @IBOutlet weak var frameY: UILabel!
       @IBOutlet weak var frameWidth: UILabel!
       @IBOutlet weak var frameHeight: UILabel!
       @IBOutlet weak var boundsX: UILabel!
       @IBOutlet weak var boundsY: UILabel!
       @IBOutlet weak var boundsWidth: UILabel!
       @IBOutlet weak var boundsHeight: UILabel!
       @IBOutlet weak var centerX: UILabel!
       @IBOutlet weak var centerY: UILabel!
       @IBOutlet weak var rotation: UILabel!
    
       // Sliders
       @IBOutlet weak var frameXSlider: UISlider!
       @IBOutlet weak var frameYSlider: UISlider!
       @IBOutlet weak var frameWidthSlider: UISlider!
       @IBOutlet weak var frameHeightSlider: UISlider!
       @IBOutlet weak var boundsXSlider: UISlider!
       @IBOutlet weak var boundsYSlider: UISlider!
       @IBOutlet weak var boundsWidthSlider: UISlider!
       @IBOutlet weak var boundsHeightSlider: UISlider!
       @IBOutlet weak var centerXSlider: UISlider!
       @IBOutlet weak var centerYSlider: UISlider!
       @IBOutlet weak var rotationSlider: UISlider!
    
       // Slider actions
       @IBAction func frameXSliderChanged(sender: AnyObject) {
           myView.frame.origin.x = CGFloat((frameXSlider.value))
           updateLabels()
       }
       @IBAction func frameYSliderChanged(sender: AnyObject) {
           myView.frame.origin.y = CGFloat(frameYSlider.value)
           updateLabels()
       }
       @IBAction func frameWidthSliderChanged(sender: AnyObject) {
           myView.frame.size.width = CGFloat(frameWidthSlider.value)
           updateLabels()
       }
       @IBAction func frameHeightSliderChanged(sender: AnyObject) {
           myView.frame.size.height = CGFloat(frameHeightSlider.value)
           updateLabels()
       }
       @IBAction func boundsXSliderChanged(sender: AnyObject) {
           myView.bounds.origin.x = CGFloat(boundsXSlider.value)
          updateLabels()
       }
       @IBAction func boundsYSliderChanged(sender: AnyObject) {
           myView.bounds.origin.y = CGFloat(boundsYSlider.value)
           updateLabels()
       }
       @IBAction func boundsWidthSliderChanged(sender: AnyObject) {
           myView.bounds.size.width = CGFloat(boundsWidthSlider.value)
           updateLabels()
       }
       @IBAction func boundsHeightSliderChanged(sender: AnyObject) {
           myView.bounds.size.height = CGFloat(boundsHeightSlider.value)
           updateLabels()
       }
       @IBAction func centerXSliderChanged(sender: AnyObject) {
           myView.center.x = CGFloat(centerXSlider.value)
           updateLabels()
       }
       @IBAction func centerYSliderChanged(sender: AnyObject) {
           myView.center.y = CGFloat(centerYSlider.value)
           updateLabels()
       }
       @IBAction func rotationSliderChanged(sender: AnyObject) {
           let rotation = CGAffineTransform(rotationAngle: CGFloat(rotationSlider.value))
           myView.transform = rotation
           updateLabels()
       }
    
       private func updateLabels() {
           frameX.text = "frame x = \(Int(myView.frame.origin.x))"
           frameY.text = "frame y = \(Int(myView.frame.origin.y))"
           frameWidth.text = "frame width = \(Int(myView.frame.width))"
           frameHeight.text = "frame height = \(Int(myView.frame.height))"
           boundsX.text = "bounds x = \(Int(myView.bounds.origin.x))"
           boundsY.text = "bounds y = \(Int(myView.bounds.origin.y))"
           boundsWidth.text = "bounds width = \(Int(myView.bounds.width))"
           boundsHeight.text = "bounds height = \(Int(myView.bounds.height))"
           centerX.text = "center x = \(Int(myView.center.x))"
           centerY.text = "center y = \(Int(myView.center.y))"
           rotation.text = "rotation = \((rotationSlider.value))"
       }
    
    private func settingSliders() {
        frameXSlider.maximumValue = Float(view.frame.width)
        frameXSlider.value = frameXSlider.maximumValue / 2
        
        frameYSlider.maximumValue = Float(view.frame.height - (view.frame.height - frameX.frame.minY) - myView.frame.height )
        frameYSlider.value = frameYSlider.maximumValue / 2
        
        frameWidthSlider.maximumValue = Float(myView.frame.width)
        frameWidthSlider.value = frameWidthSlider.maximumValue / 2
        
        frameHeightSlider.maximumValue = Float(myView.frame.height)
        frameHeightSlider.value = frameHeightSlider.maximumValue / 2
        
        boundsXSlider.maximumValue =  Float(boundsXSlider.bounds.maxX)
        boundsXSlider.value = boundsXSlider.maximumValue / 2
        
        boundsYSlider.maximumValue =  Float(boundsYSlider.bounds.maxY)
        boundsYSlider.value = boundsYSlider.maximumValue / 2
        
        boundsWidthSlider.maximumValue =  Float(boundsWidthSlider.bounds.width)
        boundsWidthSlider.value = boundsWidthSlider.maximumValue / 2
        
        boundsHeightSlider.maximumValue =  Float(boundsHeightSlider.bounds.height)
        boundsHeightSlider.value = boundsHeightSlider.maximumValue / 2
        
        centerXSlider.maximumValue =  Float(view.frame.width )
        centerXSlider.value = centerXSlider.maximumValue / 2
        
        centerYSlider.maximumValue =  Float(view.frame.height - (view.frame.height - frameX.frame.minY) )
        centerYSlider.value = centerYSlider.maximumValue / 2
        
        rotationSlider.maximumValue = Float(6.29)
    }
    

    
    private func makeConstraintForLabels(labels:[UILabel?], sliders:[UISlider?]) {
        for i in 0..<labels.count {
            if let label = labels[i], let slider = sliders[i] {
                label.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    label.leadingAnchor.constraint(equalTo: slider.trailingAnchor, constant: 20),
                    label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    label.topAnchor.constraint(equalTo: slider.topAnchor,constant: 5)
                ])
            }
        }
        
    }
    
    /// Make constraints for labels
    /// - Parameter sliders: array of labels
    private func makeConstraintForSliders(sliders:[UISlider?]) {
        if let firstSlider = sliders[0] {
            firstSlider.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                firstSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
                firstSlider.topAnchor.constraint(equalTo: view.topAnchor, constant: 260),
                firstSlider.widthAnchor.constraint(equalToConstant: 118)
            ])
        }
        for i in 1..<sliders.count {
            if let slider = sliders[i] {
                slider.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    slider.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
                    slider.topAnchor.constraint(equalTo: sliders[i-1]!.bottomAnchor, constant: 20),
                    slider.widthAnchor.constraint(equalToConstant: 118)
                ])
            }
        }
    }

}

