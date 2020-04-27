//
//  DispatchQueueExtension.swift
//  ManHua
//
//  Created by Soul on 17/12/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import Foundation

extension DispatchQueue {
    static var `default` : DispatchQueue { return DispatchQueue.global(qos: .`default`) }
    static var userInteractie : DispatchQueue { return DispatchQueue.global(qos: .userInteractive) }
    static var userInitiated : DispatchQueue { return DispatchQueue.global(qos: .userInitiated) }
    static var utility : DispatchQueue { return DispatchQueue.global(qos: .utility) }
    static var background : DispatchQueue { return DispatchQueue.global(qos: .background) }
    static var unspecified : DispatchQueue { return DispatchQueue.global(qos: .unspecified) }
    
    func after(_ delay: TimeInterval, execute closure: @escaping () -> Void) {
        asyncAfter(deadline: .now() + delay, execute: closure)
    }
    
    private static var _onceTracker = [String]()
    public class func once(block:() -> Void) {
        let token = UUID().uuidString
        objc_sync_enter(self)
        defer { objc_sync_exit(self)}
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}
