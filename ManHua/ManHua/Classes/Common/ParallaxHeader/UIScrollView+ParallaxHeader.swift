//
//  UIScrollView+ParallaxHeader.swift
//  ManHua
//
//  Created by Soul on 27/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit
import ObjectiveC.runtime

extension UIScrollView {
    private struct AssociatedKeys {
        static var descriptiveName = "AssociatedKeys.DescriptiveName.parallaxHeader"
    }
    
    var parallaxHeader : ParallaxHeader {
        get {
            if let header = objc_getAssociatedObject(self, &AssociatedKeys.descriptiveName) as? ParallaxHeader {
                return header
            }
            let header = ParallaxHeader()
            self.parallaxHeader = header
            return header
        }
        set(parallaxHeader) {
            parallaxHeader.scrollView = self
            objc_setAssociatedObject(self, &AssociatedKeys.descriptiveName, parallaxHeader, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}
