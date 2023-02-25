//
//  ImageData.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/1/23.
//

import Foundation

struct ServisModel{
    var id:Int
    var title:servisTitle
    var price:String
    var image:String
}


enum servisTitle: String{
    case Nails = "Nails",Makeup = "Make Up",Spa = "Spa",Shave = "Shave",Color = "Hair Color",Cut = "Cur",BlowOut = "Hair Styling"
    var description: String {
            return self.rawValue
        }
}

var time = ["10:00","11:00","12:00","13:00","14:00"]
var time2 = ["15:00","16:00","17:00","18:00","19:00"]
