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
    let db = Firestore.firestore()
    @ObservedObject var viewModel = ReadData()


    var body: some View {

      
       
            List(viewModel.list) { appointment in
                VStack(alignment: .leading) {
                    Text(appointment.date).font(.title)
                }
            }.onAppear() {
                self.viewModel.fetchData()
            }
       

    }
}

struct ReadView_Previews: PreviewProvider {
    static var previews: some View {
        ReadView()
    }
}

