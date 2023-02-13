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
    
    
    //    func getData() {
    //        let docRef = db.collection("Appointments").document("")
    //        docRef.getDocument { (document, error) in
    //            if let document = document, document.exists {
    //                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
    //                print("Document data: \(dataDescription)")
    //            } else {
    //                print("Document does not exist")
    //            }    }
    //
    //
    //    }}
    
    //    docRef.getDocument { (document, error) in
    //        if let document = document, document.exists {
    //            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
    //            print("Document data: \(dataDescription)")
    //        } else {
    //            print("Document does not exist")
    //        }
    //    }
    
    
//    private var databaseReference = Firestore.firestore().collection("Appointments")
//    func fetchData() {
//        databaseReference.addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//
//            self.list = documents.map { (queryDocumentSnapshot) -> Appointment in
//                let data = queryDocumentSnapshot.data()
//                let servis = data["servis"] as? String??; ""
//                let date = data["date"] as? String??; ""
//                let time = data["time"] as? String??; ""
//                return Appointment(id: <#String#>, servis: servis ?? <#default value#>, date: date!, time: time ?? <#default value#>)
//            }
//        }
//
//    }
//
//}
//        func getDat()  {
//            let db = Firestore.firestore()
//    
//            db.collection("Appointments").getDocuments { (snapshot, error) in
//                if error == nil {
//    
//                    if let snapshot = snapshot {
//    
//                        DispatchQueue.main.async {
//    
//                            self.list = snapshot.documents.map { d in
//    
//                                return Appointment(id: d.documentID,
//                                                   servis: d["servic"],
//                                                   date: d["date"],
//                                                   time: d["time"])
//                            }
//                        }
//    
//    
//                    }
//                }
//                            else {
//                // handle errors
//                            }
//    
//            }
//        }
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
    
    

