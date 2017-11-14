//
//  Hola.swift
//  Hola
//
//  Created by xcodewarrior on 12.11.2017.
//  Copyright © 2017 EmrahKorkmaz. All rights reserved.
//

import UIKit

public enum rotationWay {
    case horizontal
    case vertical
}


class Hola: UIView{
    
    private var _rotation: rotationWay!
    
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    
    
    // init function that represent Hola with view
    public init(frame: CGRect, viewArray uiviewArray:[UIView], _ rotation: rotationWay) {
        
        super.init(frame: frame)
        
        // set the rotation
        self._rotation = rotation
        
        let count:Int = uiviewArray.count
        
        scrollView = UIScrollView()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: Int(UIScreen.main.bounds.height))
        
        scrollView.backgroundColor = UIColor.clear
        
        scrollView.isPagingEnabled = true
        
        // setting scroll view contentsize for given direction
        switch rotation {
        
        case .horizontal:
        
            scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width)*count, height: 0)
            
            scrollView.showsHorizontalScrollIndicator = false
        
        case .vertical:
            
            scrollView.contentSize = CGSize(width: 0, height: Int(UIScreen.main.bounds.height)*count)
            
            scrollView.showsVerticalScrollIndicator = false
        }
        
        scrollView.delegate = self
        
        // settings up pagecontrol
        switch rotation {
        
        case .vertical:
            
            pageControl = UIPageControl(frame: CGRect(x: UIScreen.main.bounds.width-50-UIScreen.main.bounds.width/2 , y: 0, width: 50, height: 20))
            
            pageControl.transform = pageControl.transform.rotated(by: .pi/2)
            
            pageControl.center.y = scrollView.center.y
       
        case .horizontal:
           
            pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.height-50, width: 100, height: 20))
            
            pageControl.center.x = self.center.x
        }
        
        self.attributesForPageControl(pageControl,count)
        
        self.addSubview(pageControl)
        
        var viewArray: [UIView?] = [UIView?].init(repeating: nil, count: count)
        
        // initialize and setting up frame the uiviews with every view of viewArray
        for i in 0...count-1 {
            
            viewArray[i] = UIView()
    
            switch rotation{
    
            case .horizontal:
            
                viewArray[i]?.frame = CGRect(x: pageToFloatHorizontal(i), y: 0, width: getWidth(), height: getHeight())
                
                uiviewArray[i].frame.origin = CGPoint(x: pageToFloatHorizontal(i), y: 0)
            
            case .vertical:
            
                viewArray[i]?.frame = CGRect(x: 0, y: pageToFloatVertical(i), width: getWidth(), height: getHeight())
                
                uiviewArray[i].frame.origin = CGPoint(x: 0, y: pageToFloatVertical(i))
            }
            
            viewArray[i]! = uiviewArray[i]
            
            scrollView.addSubview(viewArray[i]!)
        }
        
        
        self.addSubview(scrollView)
       
        switch rotation {
        
        case .vertical:
        
            scrollView.setContentOffset(CGPoint.init(x: 0, y: 20), animated: false)
            
            scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
        
        default:
            break
        }
        
    }
    
    
    // init function that represent Hola with images
    public init(frame: CGRect, imageArray uiimageArray:[UIImage],_ rotation: rotationWay ){
        
        super.init(frame: frame)
        
        self._rotation = rotation
        
        let count:Int = uiimageArray.count
        
        scrollView = UIScrollView()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: Int(UIScreen.main.bounds.height))
        
        scrollView.backgroundColor = UIColor.clear
        
        scrollView.isPagingEnabled = true
        
        // setting scroll view contentsize for given direction
        switch rotation {
        
        case .horizontal:
        
            scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width)*count, height: 0)
            
            scrollView.showsHorizontalScrollIndicator = false
        
        case .vertical:
        
            scrollView.contentSize = CGSize(width: 0, height: Int(UIScreen.main.bounds.height)*count)
            
            scrollView.showsVerticalScrollIndicator = false
        }
        
        
        scrollView.delegate = self
        
        // settings up pagecontrol
        switch rotation {
        
        case .vertical:
        
            pageControl = UIPageControl(frame: CGRect(x: UIScreen.main.bounds.width-50-UIScreen.main.bounds.width/2 , y: 0, width: 50, height: 20))
            
            // transform the pageControl for vertical position
            pageControl.transform = pageControl.transform.rotated(by: .pi/2)
            
            pageControl.center.y = scrollView.center.y
        case .horizontal:
        
            pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.height-50, width: 100, height: 20))
            
            pageControl.center.x = self.center.x
        }
        
        
        self.attributesForPageControl(pageControl,count)

        self.addSubview(pageControl)
        
        var imageViewArray: [UIImageView?] = [UIImageView?].init(repeating: nil, count: count)
        
        // initialize and setting up frame the uiviews with every view of viewArray
        for i in 0...count-1 {
            
            imageViewArray[i] = UIImageView()
    
            switch rotation{
            
            case .horizontal:
            
                imageViewArray[i]?.frame = CGRect(x: pageToFloatHorizontal(i), y: 0, width: getWidth(), height: getHeight())
           
            case .vertical:
            
                imageViewArray[i]?.frame = CGRect(x: 0, y: pageToFloatVertical(i), width: getWidth(), height: getHeight())
            }
            
            imageViewArray[i]?.image = (uiimageArray[i])
            
            scrollView.addSubview(imageViewArray[i]!)
        }
        
        self.addSubview(scrollView)
        
        switch rotation {
        
        case .vertical:
        
            scrollView.setContentOffset(CGPoint.init(x: 0, y: 20), animated: false)
            
            scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
        
        default:
            break
        }
        
        
    }
    
    // helper methods
    private func attributesForPageControl(_ pageControl: UIPageControl, _ count:Int){
        pageControl.numberOfPages = count
        
        pageControl.currentPage = 0
        
        pageControl.layer.zPosition = 1
        
        pageControl.backgroundColor = UIColor.clear
    }
    
    fileprivate func pageToFloatVertical(_ simpleInteger: Int) -> CGFloat{
        return CGFloat(simpleInteger) * UIScreen.main.bounds.height
    }
    
    fileprivate func pageToFloatHorizontal(_ simpleInteger: Int) -> CGFloat{
        return CGFloat(simpleInteger) * UIScreen.main.bounds.width
    }
    
    fileprivate func offsetToPage(_ scrollViewOffset: CGFloat) -> Int{
        return Int(scrollViewOffset / UIScreen.main.bounds.width)
    }
    
    fileprivate func offsetToPageVertical(withHeightOffset scrollViewOffset: CGFloat) -> Int{
        return Int(scrollViewOffset / UIScreen.main.bounds.height)
    }
    
    fileprivate func getWidth() -> CGFloat{
        return UIScreen.main.bounds.width
    }
    
    fileprivate func getHeight() -> CGFloat{
        return UIScreen.main.bounds.height
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension Hola: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // its forbidden to scroll to negative offset or upper offset of biggest offset limit.
        
        let rotation: rotationWay = _rotation!
        
        switch rotation {
        
        case .horizontal:
        
            if scrollView.contentOffset.x <= 0{
            
                scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
           
            }else if scrollView.contentOffset.x >= UIScreen.main.bounds.width*CGFloat(2){
            
                scrollView.setContentOffset(CGPoint.init(x: Int(UIScreen.main.bounds.width)*2, y: 0), animated: false)
            }
        case .vertical:
            
            if scrollView.contentOffset.y <= 0{
            
                scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
            
            }else if scrollView.contentOffset.y >= UIScreen.main.bounds.height*CGFloat(2){
            
                scrollView.setContentOffset(CGPoint.init(x: 0, y: Int(UIScreen.main.bounds.height)*2), animated: false)
            
            }
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        // setting pageControl currentPage with every changing on scrollView page.
        
        let rotation: rotationWay = _rotation!
        
        switch rotation {
        
        case .horizontal:
        
            pageControl.currentPage = offsetToPage(scrollView.contentOffset.x)
        
        case .vertical:
        
            pageControl.currentPage = offsetToPageVertical(withHeightOffset: scrollView.contentOffset.y)
        
        }
    }

}
