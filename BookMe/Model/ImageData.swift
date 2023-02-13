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
    case Nails ,Makeup,Spa,Shave,Color,Cut,BlowOut
}

var time = ["10:00","11:00","12:00","13:00","14:00"]
