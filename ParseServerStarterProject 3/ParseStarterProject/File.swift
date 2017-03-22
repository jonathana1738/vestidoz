//
//  File.swift
//  DresSwapMvp
//
//  Created by Jonathan on 3/19/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import Foundation
import Parse

struct DressSwap {
    var Brand: String
    var Available: Bool
    var Size: Int
    var length: String
    var Color: String
    var fabric: String
    var washPref: String
    var typOFit : String
   
    
    
    
    // This constructor is for: A non-anonymous public healing
    init(Brand: String, Available: Bool,Size: Int, length: String,Color: String, fabric: String, washPref: String, typOFit: String) {
        
        self.Brand = Brand
  
        self.Available = Available
        self.Size = Size
        self.length = length
        self.Color = Color
        self.fabric = fabric
        self.washPref = washPref
        self.typOFit = typOFit
    }}
