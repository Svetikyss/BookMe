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
    @State var goWhenTrue: Bool = false
    @ObservedObject var viewModel = ReadData()
    @State private var confirmationShown = false
    var body: some View {

        NavigationView{
            
            List(viewModel.list) { appointment in
                VStack(alignment: .leading) {
                    Text(appointment.date).font(.title)
                    Text(appointment.time).font(.title)
                    Text(String(appointment.servis!)).font(.title)
                    //                    print(appointment.servis)
                }
               
                
                NavigationLink(destination: Done().navigationBarBackButtonHidden(true),
                               isActive: $goWhenTrue){                HStack{
                    Button(action: {viewModel.deleteData(appointment
                    )}){ Text("Cancel").font(.title)
                        
                    }
                }}
                
                NavigationLink(destination: Imgiew().navigationBarBackButtonHidden(true),
                               isActive: $goWhenTrue){                HStack{
                    Button(action: {viewModel.deleteData(appointment
                    )}){ Text("Book").font(.title)
                        
                    }
                }}
               
//                ForEach(viewModel.list){post in                NavigationLink(destination:DateSelectView(servis:post.servis){
//                    RoundedRectangle(cornerRadius: 12).fill(Color(hue: 0.859, saturation: 0.415, brightness: 0.826)).frame(width: 300,height: 70,alignment: .trailing).overlay(
//                        HStack(spacing:10){Text("Book appointment").font(.title).fontWeight(.bold)
//                            Image(systemName:
//                            "chevron.right")
//                        }.foregroundColor(.yellow))
//
//
//
//
//                }}
            }.onAppear() {
                self.viewModel.fetchData()
            }
            }
        }
}

struct ReadView_Previews: PreviewProvider {
    static var previews: some View {
        ReadView()
    }
}

