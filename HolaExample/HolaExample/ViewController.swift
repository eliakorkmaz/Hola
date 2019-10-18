//
//  ViewController.swift
//  HolaExample
//
//  Created by Emrah Korkmaz on 10/18/19.
//  Copyright © 2019 Emrah Korkmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var holaView: Hola!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var image1 = UIImage(named:"image1")!
        var image2 = UIImage(named:"image2")!
        var image3 = UIImage(named:"image3")!
        
        var imageArray = [image1, image2, image3]
        
        holaView.prepareImagesForStoryboard(uiimageArray: imageArray, rotation: rotationWay.horizontal)
        
        
    }


}

