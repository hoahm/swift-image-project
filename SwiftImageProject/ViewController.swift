//
//  ViewController.swift
//  SwiftImageProject
//
//  Created by Hoa Hoang on 5/12/15.
//  Copyright (c) 2015 Hoa Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swiftMan: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func applyEffect(sender: AnyObject) {

        let inputImage:CIImage = CIImage(image: swiftMan.image)
        
        let drawingContext:CIContext = CIContext(options: nil)
        
        let filterParameters:Dictionary = [kCIInputImageKey: inputImage]
        
        let filter:CIFilter = CIFilter(name: "CIPhotoEffectMono", withInputParameters: filterParameters)
        
        let outputImage:CIImage = filter.outputImage
        
        let imageRef:CGImageRef = drawingContext.createCGImage(outputImage, fromRect: outputImage.extent())
        
        swiftMan.image = UIImage(CGImage: imageRef)
    }
}

