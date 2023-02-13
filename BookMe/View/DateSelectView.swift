//
//  DateSelectView.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/8/23.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct DateSelectView: View {
    

    
    let db = Firestore.firestore()
 
    @State var servis: servisTitle
    
    @State var date: Date = Date()
    @State var selectedTime = "10:00"
    
   var appointments = [Appointment]()
    @ObservedObject private var viewModel = ReadData()
//    
//    
//    List(viewModel.appoitntments) { one; in
//                                VStack(alignment: .leading) {
//                                    Text("")
//                                }
//                            }.onAppear() {
//                                self.viewModel.fetchData()
//                            }.navigationTitle("All Tasks")
    
    //    mutating func fetchData() {
//        Firestore.firestore()
//        db.collection("Appointments").addSnapshotListener { (querySnapshot, error) in
//                guard let documents = querySnapshot?.documents else {
//                    print("No documents")
//                    return
//                }
//                
//                self.appointments = documents.compactMap { queryDocumentSnapshot -> Appointment? in
//                    return try? queryDocumentSnapshot.data(as: Appointment.self)
//                }
//            }
//        }
//    
    
//    var appointment: [Appointment]  = [Appointment(servis: <#String#>, date: <#String#>, time: <#String#>, servisTime: <#String#>)]

    
    var body: some View {
        
        
        
        VStack{
            Text("Select date and time ")
                .padding(.bottom)
                .padding()
            HStack{
                Text("Date:").fontWeight(.bold);
                
               DatePicker("",selection: $date, displayedComponents: .date)
                
                
                
            }.padding()
            
            ScrollView(.horizontal,showsIndicators: false,content: {
                HStack(spacing:15){
                    ForEach(time,id:\ .self){
                        timing in
                        
                        Text(timing).fontWeight(.bold)
                            .foregroundColor(.pink)
                            .padding(.vertical)
                            .padding(.horizontal)
                            .background(Color(.gray).opacity(selectedTime == timing ? 1:0.2))
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedTime = timing
                                

                            }
                                            }
                }
            }).padding()
           
        
            HStack(spacing:15){
                VStack(alignment: .leading,spacing: 10, content: {
                    Text("\(servis.rawValue) -  Your service")
                    Text("\(selectedTime)")
                 
//                    Text("\(date,formatter: dateFormatter)")
                  let newDate =   date.formatted(.dateTime.day().month().year())
                    Text(newDate)
                    
                    
                    
                    
                    
                    Button(action: {
                        viewModel.addData(servis: servis.rawValue, date: newDate ,time: selectedTime)
                    }, label: {
                        Text("Add")
                    })
                    
                    
                    
//                    Button(action: {
//                        let db = Firestore.firestore()
//                        db.collection("Appointments").addDocument(data: ["time":selectedTime, "servis":"\(servis.rawValue)",
//                            "date": newDate                     ]) { (error) in
//                            if let error = error {
//                                print("Error adding document: \(error)")
//                            } else {
//                                print("Document added")
//                            }
//                        }
//                    }) {
//                        Text("Save")
//                    }
//                   

                    Spacer()
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.systemPink))
                        .opacity(0.60)
        .frame(width: 350,height: 50,alignment: .center)
        .cornerRadius(15)
        .shadow(color:.gray,radius: 5,x:5,y:5)
        .overlay(
        Text("Continue")
            .font(.system(.title3))
            .fontWeight(.medium)).padding(.horizontal)
                })
                
                
                        
                
              
                }
        
     
        }
        
        
          }
    
    
  
   
    
}




struct DateSelectView_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectView(servis:.Color)
    }
}
