//
//  Memo.swift
//  FirstMakeApp
//
//  Created by ktds 13 on 2017. 8. 18..
//  Copyright © 2017년 CJ Olivenetworks. All rights reserved.
//

import Foundation
import UIKit


class Memo {
    
    var memoType:String
    var memoImage:UIImage?
    var memoText:String?
    var writeTime:String?
    
    init(memoType:String, memoImage:UIImage?, memoText:String, writeTime:String?) {
        self.memoType = memoType
        self.memoImage = memoImage
        self.memoText = memoText
        self.writeTime = writeTime
        //let time : TimeZone = TimeZone.system
    }
    
    /*    convenience init(memoType:String, memoText:String, writeTime:String) {
        self.init(memoType:memoType, memoImage:nil, memoText:memoText, writeTime: writeTime)
    }*/


}
