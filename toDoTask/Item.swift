//
//  Item.swift
//  toDoTask
//
//  Created by nebil on 8/20/20.
//  Copyright © 2020 nebilgokdemir. All rights reserved.
//

import Foundation

class Item : Encodable,Decodable{
    var title : String?
    var done = false
}
