//
//  ViewController.swift
//  PinMapAnimation
//
//  Created by Squall on 10/1/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit
import GoogleMaps
import Pulsator
class ViewController: UIViewController {
    
    let pulseLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("AIzaSyBXC4A-X-jJRlgGd3M6jM6o8JOUa564OXg")

        let camera = GMSCameraPosition.camera(withLatitude: 21.017442, longitude: 105.783699, zoom: 10)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(21.017442, 105.783699)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "Here you are"
        
        let circleCenter = CLLocationCoordinate2D(latitude: 21.017442, longitude: 105.783699)
        let circ = GMSCircle(position: circleCenter, radius: 100)
        circ.map = mapView
        
        let newImage = UIImageView(frame: CGRect(x: -30, y: -30, width: 38, height: 38))
        newImage.image = UIImage(named: "Pulse")

        CATransaction.begin()
        CATransaction.setAnimationDuration(2.0)

        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = 2.0
        scaleAnimation.fromValue = 0.0
        scaleAnimation.toValue = 2.0
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        scaleAnimation.repeatCount = Float.infinity
        scaleAnimation.isRemovedOnCompletion = false

        newImage.layer.add(scaleAnimation, forKey: "đéo nghĩ ra tên gì nữa")
        CATransaction.setCompletionBlock({() ->Void in
            let anim = CAKeyframeAnimation(keyPath: "opacity")
            anim.duration = 2
            anim.repeatCount = Float.infinity
            anim.values = [Float(2.0), Float(0.0)]
            marker.iconView?.layer.add(anim, forKey: "opacity")
        })

        CATransaction.commit()
        marker.iconView = newImage
        marker.layer.addSublayer(newImage.layer)
        marker.map = mapView
        marker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

