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
        
        
//        testWithImage(.horizontal)
        testWithView(.vertical)
    
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
        
        let label1: UILabel = UILabel()
        label1.textColor = UIColor.white
        label1.text = "Simple View Label 1"
        label1.textAlignment = .center
        label1.font = UIFont.boldSystemFont(ofSize: 18)
        label1.frame = CGRect(x: 0, y: 0, width: 250, height:50)
        label1.center = view1.center
        view1.addSubview(label1)
        
        let view2: UIView = UIView()
        view2.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view2.backgroundColor = UIColor.brown
        
        let label2: UILabel = UILabel()
        label2.textColor = UIColor.white
        label2.text = "Simple View Label 2"
        label2.textAlignment = .center
        label2.font = UIFont.boldSystemFont(ofSize: 18)
        label2.frame = CGRect(x: 0, y: 0, width: 250, height:50)
        label2.center = view2.center
        view2.addSubview(label2)
        
        let view3: UIView = UIView()
        view3.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view3.backgroundColor = UIColor.black
        
        let label3: UILabel = UILabel()
        label3.textColor = UIColor.white
        label3.text = "Simple View Label 3"
        label3.textAlignment = .center
        label3.font = UIFont.boldSystemFont(ofSize: 18)
        label3.frame = CGRect(x: 0, y: 0, width: 250, height:50)
        label3.center = view3.center
        view3.addSubview(label3)
        
        let viewArray: [UIView] = [view1,view2,view3]
        
        let ttt: Hola = Hola(frame: CGRect(), viewArray: viewArray, rotation)
        ttt.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(ttt)
    }

}




