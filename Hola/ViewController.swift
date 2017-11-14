//
//  ViewController.swift
//  Hola
//
//  Created by xcodewarrior on 12.11.2017.
//  Copyright © 2017 EmrahKorkmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        
        testWithImage(.horizontal)
    
    }

    
    
    // testing function for uiimage
    fileprivate func testWithImage(_ rotation: rotationWay){
        
        let _image1: UIImage = UIImage(named:"image1")!
        let _image2: UIImage = UIImage(named:"image2")!
        let _image3: UIImage = UIImage(named:"image3")!
        
        let imageArray: [UIImage] = [_image1,_image2,_image3]
        
        let sss: Hola = Hola(frame: CGRect(), imageArray: imageArray, rotation)
        sss.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(sss)
    }
    
    // testing function for uiview
    fileprivate func testWithView(_ rotation: rotationWay){
        let view1: UIView = UIView()
        view1.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view1.backgroundColor = UIColor.lightGray
        
        let view2: UIView = UIView()
        view2.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view2.backgroundColor = UIColor.brown
        
        let view3: UIView = UIView()
        view3.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view3.backgroundColor = UIColor.black
        
        let viewArray: [UIView] = [view1,view2,view3]
        
        let ttt: Hola = Hola(frame: CGRect(), viewArray: viewArray, rotation)
        ttt.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(ttt)
    }

}




