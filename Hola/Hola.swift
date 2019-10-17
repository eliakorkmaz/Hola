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
    private var _count: Int!
    /*
        this count variable is added for binding between scrollViewDidScroll functions and limit of page.
     If there have 3 page, Hola has provide to scroll just between 0 and 3 section.
     */
    
    
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    
    // init function that represent Hola with view
    public init(frame: CGRect, viewArray uiviewArray:[UIView], _ rotation: rotationWay) {
        
        // set the count before the init cause that otherwise return nil when detect scrolling
        
        self._count = uiviewArray.count
        
        super.init(frame: frame)
        
        builder(uiviewArray.count, rotation)
                
        insertViewElements(uiviewArray, rotation)
        
    }
    
    
    // init function that represent Hola with images
    public init(frame: CGRect, imageArray uiimageArray:[UIImage],_ rotation: rotationWay ){
        
        self._count  = uiimageArray.count;
        
        super.init(frame: frame)
        
        builder(uiimageArray.count, rotation)
                
        insertImageElements(uiimageArray, rotation)
        
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
        
    func prepareImagesForStoryboard(uiimageArray: [UIImage], rotation: rotationWay){
        builder(uiimageArray.count, rotation)
        
        insertImageElements(uiimageArray, rotation)
    }
    
    func prepareViewsForStoryboard(viewArray: [UIView], rotation: rotationWay){
        builder(viewArray.count, rotation)
        
        insertViewElements(viewArray, rotation)
    }
    
    private func insertImageElements(_ elements: [UIImage], _ rotation: rotationWay){
        
        var imageViewArray: [UIImageView?] = [UIImageView?].init(repeating: nil, count: elements.count)
        
        // initialize and setting up frame the uiviews with every view of viewArray
        for i in 0...elements.count-1 {

            imageViewArray[i] = UIImageView()

            switch rotation{

            case .horizontal:

                imageViewArray[i]?.frame = CGRect(x: pageToFloatHorizontal(i), y: 0, width: getWidth(), height: getHeight())

            case .vertical:

                imageViewArray[i]?.frame = CGRect(x: 0, y: pageToFloatVertical(i), width: getWidth(), height: getHeight())
            }

            imageViewArray[i]?.image = (elements[i])

            scrollView.addSubview(imageViewArray[i]!)
        }
    }
    
    private func insertViewElements(_ elements: [UIView], _ rotation: rotationWay){
        var viewArray: [UIView?] = [UIView?].init(repeating: nil, count: elements.count)
            
            // initialize and setting up frame the uiviews with every view of viewArray
            for i in 0...elements.count-1 {
                
                viewArray[i] = UIView()
        
                switch rotation{
        
                case .horizontal:
                
                    viewArray[i]?.frame = CGRect(x: pageToFloatHorizontal(i), y: 0, width: getWidth(), height: getHeight())
                    
                    elements[i].frame.origin = CGPoint(x: pageToFloatHorizontal(i), y: 0)
                
                case .vertical:
                
                    viewArray[i]?.frame = CGRect(x: 0, y: pageToFloatVertical(i), width: getWidth(), height: getHeight())
                    
                    elements[i].frame.origin = CGPoint(x: 0, y: pageToFloatVertical(i))
                }
                
                viewArray[i]! = elements[i]
                
                scrollView.addSubview(viewArray[i]!)
            }

    }
    
    private func builder(_ count: Int, _ rotation: rotationWay){
        self._count = count
            
        self._rotation = rotation
    
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
        pageControl = UIPageControl()
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        switch rotation {

        case .vertical:
            
            pageControl.transform = CGAffineTransform(rotationAngle: .pi / 2)
                                    
        default:
            
            break
        }
        
        
        self.addSubview(pageControl)
        
        self.attributesForPageControl(pageControl,count)
        
        self.addSubview(scrollView)
        
        switch rotation {
        
        case .vertical:
            
            scrollView.setContentOffset(CGPoint.init(x: 0, y: 20), animated: false)
            
            scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
            
            pageControl.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            pageControl.widthAnchor.constraint(equalToConstant: 25).isActive = true
            
            pageControl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3).isActive = true
             
            pageControl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
                
        case .horizontal:

            pageControl.heightAnchor.constraint(equalToConstant: 25).isActive = true
            
            pageControl.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
             
            pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension Hola: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // its forbidden to scroll to negative offset or upper offset of biggest offset limit.
        
        let rotation: rotationWay = _rotation!
        let count: Int = _count!
        
    
        switch rotation {
        
        case .horizontal:
            if scrollView.contentOffset.x <= 0{
                
                scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
           
            }else if scrollView.contentOffset.x >= UIScreen.main.bounds.width*CGFloat(count-1){
                
                scrollView.setContentOffset(CGPoint.init(x: Int(UIScreen.main.bounds.width)*(count-1), y: 0), animated: false)
                
            }
        case .vertical:
            if scrollView.contentOffset.y <= 0{
            
                scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
            
            }else if scrollView.contentOffset.y >= UIScreen.main.bounds.height*CGFloat(count-1){
            
                scrollView.setContentOffset(CGPoint.init(x: 0, y: Int(UIScreen.main.bounds.height)*(count-1)), animated: false)
            
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
