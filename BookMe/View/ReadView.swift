//
//  ReadView.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/13/23.
//
import SwiftUI
import FirebaseFirestoreSwift
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

struct ReadView: View {
    
    @ObservedObject private var viewModel = ReadData()
    
    var body: some View {
        
        List(viewModel.list) { appointment in
            Text(appointment.date)
        }
//        init() {
//            viewModel.getDat()
//        }

    }
}

struct ReadView_Previews: PreviewProvider {
    static var previews: some View {
        ReadView()
    }
}

