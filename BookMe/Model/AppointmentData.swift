//
//  AppointmentData.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/8/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Appointment: Identifiable, Codable{
//    var id: String
    
    var id: String = UUID().uuidString
//    @DocumentID var id: String?
    var servis : String? // cut,blowout..
    var date : String // day,mount,year
    var time: String // time spot
//    var servisTime: String // servis time
//    var notes: String
    
//    enum CodKey: String, CodingKey {
//        case id
//        case servis
//        case time
////        case notes
//    }
}

