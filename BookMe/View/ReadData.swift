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
        db.collection("Appointments").addDocument(data: ["time":time,"servis":servis,
                                                         "date": date]) { (error) in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added")
            }
        }
    }
    
    
    
    func fetchData() {
            db.collection("Appointments").addSnapshotListener { (querySnapshot, error) in
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
    
    
    
    
    
    
    }
    
    
    
    //
    // function to update data
    //    func updateData(title: String, id: String) {
    //        databaseReference.document(id).updateData(["title" : title]) { error in
    //            if let error = error {
    //                print(error.localizedDescription)
    //            } else {
    //                print("Note updated succesfully")
    //            }
    //        }
    //    }
    
    // function to delete data
    //    func deleteData(at indexSet: IndexSet) {
    //        indexSet.forEach { index in
    //            let note = notes[index]
    //            databaseReference.document(note.id ?? "").delete { error in
    //                if let error = error {
    //                    print("\(error.localizedDescription)")
    //                } else {
    //                    print("Note with ID \(note.id ?? "") deleted")
    //                }
    //            }
    //        }
    
    

