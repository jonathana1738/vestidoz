//
//  DressInfo.swift
//  DresSwapMvp
//
//  Created by Jonathan on 3/19/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import Foundation
import Parse

struct DressSwap {
    var Brand: String
    var Available = true
    var Size: Int
    var length: String
    var Color: String
    var fabric: String
    var washPref: String
    var typOFit : String
    var FrontImage: PFFile
    var BackImage : PFFile
    var createdAt: Date
    
   
    
    
    
    // This constructor is for a swap
    init(Brand: String,Available: Bool,Size: Int, length: String,Color: String, fabric: String, washPref: String, typOFit: String,FrontImage: PFFile, BackImage: PFFile ,createdAt: Date) {
        
        self.Brand = Brand
        self.Available = Available
        self.Size = Size
        self.length = length
        self.Color = Color
        self.fabric = fabric
        self.washPref = washPref
        self.typOFit = typOFit
        self.FrontImage = FrontImage
        self.BackImage = BackImage
        self.createdAt = createdAt as Date
    }}
