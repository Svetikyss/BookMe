//
//  ReadData.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/12/23.
//

import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

class ReadData: ObservableObject {
    
    let db = Firestore.firestore()
    @Published var list = [Appointment]()
    
    
    func addData(servis: String,date: String, time: String ){
        let userID = Auth.auth().currentUser!.uid;        db.collection("Users").document("\(userID)").collection("Appointments").addDocument(data:
        
//        db.collection("Appointments").addDocument(data:
                                                    
        ["time":time,"servis":servis,"date": date]) { (error) in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added")
            }
        }
    }
    
    
    
    func fetchData() {
        let userID = Auth.auth().currentUser!.uid;        db.collection("Users").document("\(userID)").collection("Appointments").order(by: "date", descending: true).limit(to: 1).addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                self.list = documents.map { (queryDocumentSnapshot) -> Appointment in
                    let data = queryDocumentSnapshot.data()
                    let time = data["time"] as? String ?? ""
                    let servis = data["servis"] as? String ?? ""
                    let date = data["date"] as? String ?? ""
                    return Appointment(servis: servis, date: date, time: time)
                }
            }
        }
    
    
    
    func deleteData(_ orderDelete: Appointment) {
      
//            let appointment = list[index]
            let userID = Auth.auth().currentUser!.uid;                db.collection("Users").document("\(userID)").collection("Appointments").document(orderDelete.id).delete { error in
                if error == nil{
                    DispatchQueue.main.async{
                        self.list.removeAll { appot in
                            return appot.id == orderDelete.id
                            
                        
                        
                    }
                }
            }
        }
        
    }


    
    }
    
    
    
//    //
//     function to update data
//        func updateData(title: String, id: String) {
//            databaseReference.document(id).updateData(["title" : title]) { error in
//                if let error = error {
//                    print(error.localizedDescription)
//                } else {
//                    print("Note updated succesfully")
//                }
//            }
//        }
    

