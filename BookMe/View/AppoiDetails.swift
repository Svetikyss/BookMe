//
//  AppoiDetails.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/12/23.
//

//import SwiftUI
//
//struct AppoiDetails: View {
//    
//    @State private var presentAlert = false
//    @State private var titleText: String = ""
//    @ObservedObject private var viewModel = ReadData()
//    var appointment: Appointment
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack {
//                    Text(appointment.date)
//                        .font(.system(size: 22, weight: .regular))
//                        .padding()
//                    
//                    Spacer()
//                }
//            }
//            .toolbar {
//                ToolbarItem(placement: .confirmationAction) {
//                    Button {
//                        presentAlert = true
//                    } label: {
//                        Text("Edit")
//                            .bold()
//                            .accentColor(.yellow)
//                    }.alert("Update your note", isPresented: $presentAlert, actions: {
//                        TextField("Enter your new text", text: $titleText)
//                        
//                        
//                        Button("Cancel", role: .cancel, action: {
//                            presentAlert = false
//                            titleText = ""
//                        })
//                    }, message: {
//                        Text("Please, enter your new note")
//                    })
//                }
//            }
//        }.navigationTitle("Details")
//    }
//}
//
//struct AppoiDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        AppoiDetails(appointment: Appointment(id: "lZ213VftyIL37gvHmuN6", servis:"Feb 9, 2023",date:"Color",time:"10:00", notes: <#String#>))
//    }
//}
