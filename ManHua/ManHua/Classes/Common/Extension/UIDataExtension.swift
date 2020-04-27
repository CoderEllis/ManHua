//
//  UIDataExtension.swift
//  ManHua
//
//  Created by Soul on 29/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

extension Data {
    ///默认写入plist格式查看网络回调的JSON
    func printData(_ writePlist: Bool = true) { 
        do {
            let array = try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.mutableContainers) 
            
            if writePlist {
                (array as? NSArray)?.write(toFile: "/Users/soulai/Desktop/ArrayJsonString.plist", atomically: true)
                (array as? NSDictionary)?.write(toFile: "/Users/soulai/Desktop/DictionaryJsonString.plist", atomically: true)
            } else {
                //写入排版好的json文件到桌面
                let data = try JSONSerialization.data(withJSONObject: array, options: .prettyPrinted) 
                try data.write(to: URL(fileURLWithPath: "/Users/soulai/Desktop/jsonString.json", isDirectory: true))
            }
            
        } catch {
            print("写入错误,数据或路径不对")
        }
        
//        try? self.write(to: URL(fileURLWithPath: "/Users/soulai/Desktop/jsonString.json", isDirectory: true), options: [])
    }
    
}
