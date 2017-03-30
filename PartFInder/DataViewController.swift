//
//  DataViewController.swift
//  PartFInder
//
//  Created by Brian Fleury on 9/26/16.
//  Copyright © 2016 Fleury. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    var imageObject: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        1020,420]1280,420"
        let originalWidth = imageView.image?.size.width
        let originalHeight = imageView.image?.size.height
        let originalx1: CGFloat = 560//15
        let originaly1: CGFloat = 460//150
        
        let widthPercent = originalx1 / originalWidth!
        let heightPercent = originaly1 / originalHeight!

        let newx1 = imageView.frame.size.width * widthPercent
        let newy1 = imageView.frame.size.height * heightPercent

        print(imageView.frame.size.width)
        print(imageView.frame.size.height)
        print(view.frame.size.width)
        print(view.frame.size.height)
        print(newx1)
        print(newy1)
        
        
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: newx1,y: newy1), radius: CGFloat(7), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
//        
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = circlePath.CGPath
//        
//        shapeLayer.backgroundColor = UIColor.whiteColor().CGColor
//        shapeLayer.fillColor = UIColor.redColor().CGColor
//        shapeLayer.strokeColor = UIColor.redColor().CGColor
//        shapeLayer.lineWidth = 3.0
//        
//        view.layer.addSublayer(shapeLayer)
        
        let circleLayer = CAShapeLayer()
        let radius: CGFloat = 10.0
        circleLayer.path = UIBezierPath(roundedRect: CGRect(x: newx1, y: newy1, width: 2.0 * radius, height: 2.0 * radius)  , cornerRadius: radius).CGPath
//        circleLayer.position = CGPoint(x: newx1, y: newy1)
        circleLayer.fillColor = UIColor.redColor().CGColor
        imageView.image?.drawLayer(circleLayer, inContext: self)
        imageView.layer.addSublayer(circleLayer)
        
        // Set the Center of the Circle
//        let circleCenter = CGPoint(x: newx1, y: newy1)
//        
//        // Set a Circle Radius
//        let circleWidth = CGFloat(10 + (20 % 50))
//        let circleHeight = circleWidth
//        
//        let circleView = DrawView(frame: CGRectMake(circleCenter.x, circleCenter.y, circleWidth, circleHeight))
//
//        view.addSubview(circleView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
        self.imageView.image = UIImage(named: imageObject)
    }
    
    class DrawView: UIView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor.clearColor()
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        var circleLayer: CAShapeLayer!
        
        override func drawRect(rect: CGRect) {
            
            super.drawRect(rect)
            if circleLayer == nil {
                circleLayer = CAShapeLayer()
                let radius: CGFloat = 10.0
                circleLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0 * radius, height: 2.0 * radius)  , cornerRadius: radius).CGPath
                circleLayer.position = CGPoint(x: 100, y: 100)
                circleLayer.fillColor = UIColor.redColor().CGColor
                self.layer.addSublayer(circleLayer)
                
            }
        }
//        override func drawRect(rect: CGRect) {
//            // Get the Graphics Context
//            var context = UIGraphicsGetCurrentContext();
//            
//            // Set the circle outerline-width
//            CGContextSetLineWidth(context, 5.0);
//            
//            // Set the circle outerline-colour
//            UIColor.blueColor().set()
//            
//            // Create Circle
//            CGContextAddArc(context, (frame.size.width)/2, frame.size.height/2, (frame.size.width - 10)/2, 0.0, CGFloat(M_PI * 2.0), 1)
//            
//            // Draw
//            CGContextStrokePath(context);
//        }
        
    }
}
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        if let touch = touches as? Set<UITouch> {
//            // Set the Center of the Circle
//            // 1
////            var circleCenter = touch.first!.locationInView(view)
//            var circleCenter = CGPoint(x: 140.0, y: 133.0)
//            print(circleCenter)
//            // Set a Circle Radius
//            // 2
//            var circleWidth = CGFloat(25 + (20 % 50))
//            var circleHeight = circleWidth
//            
//            // Create a new CircleView
//            // 3
//            var circleView = CircleView(frame: CGRectMake(circleCenter.x, circleCenter.y, circleWidth, circleHeight))
//            view.addSubview(circleView)
//        }
//        super.touchesBegan(touches, withEvent:event)
//    }





//        let image = UIImage(named: "shelf1")!

//        imageView.backgroundColor = UIColor.clearColor()
//        imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height)
//
//        let label = UILabel(frame: CGRectMake(0, 0, image.size.width, image.size.height))
//        label.backgroundColor = UIColor.clearColor()
//        label.textAlignment = .Center
//        label.textColor = UIColor.redColor()
//        label.text = "textutohusonhtusohusonuthonuthonuhosutosunothusnohunseoh"
//
//        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0);
//        imageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
//        label.layer.renderInContext(UIGraphicsGetCurrentContext()!)
//        let imageWithText = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext();
//
//        imageView.image = imageWithText
