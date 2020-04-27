//
//  StringExtension.swift
//  ManHua
//
//  Created by Soul on 10/12/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import Foundation

extension String {
    public func substring(from index: Int) -> String {
        if self.count > index {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let subString = self[startIndex..<self.endIndex]
            return String(subString)
        } else {
            return self
        }
    }
}
