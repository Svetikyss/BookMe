//
//  Imgiew.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/15/23.
//

import SwiftUI
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

struct Imgiew: View {
    
//    let userID = Auth.auth().currentUser!.uid;
    let db = Firestore.firestore()
    let storageRef = Storage.storage().reference()
    @State var showPicker2 = false
    @State var showPicker = false
    @State var selectedImage: UIImage?
    @State private var name: String = ""
    @State var selectedImage2: UIImage?
    
    var body: some View {
        ZStack{
            
            Image("imgfn")
            
                .resizable()
            
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                
                
                HStack{
                    
                    
                    Text("Your stylist would like to know \n about you:")    .fixedSize(horizontal: false, vertical: true).font(.title)
                }
                .padding(.top, -100)
                
                Text("Upload an example photo:").font(.title)
                
                    .padding()
                    .padding(.horizontal)
                
                
                VStack{
                    
                    
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .frame(width:200, height: 200)
                    }
                    
                    Button{
                        showPicker =  true
                    } label: {
                        Text("Selectet a Photo").font(Font.custom("IndieFlower", size: 20))
                    }
                    
                    //upload button
                    if selectedImage != nil{
                        Button {
                            uploadPhoto(img:"img")

                        } label:{
                            Text("Upload")

                        }
                    }
                }
                .sheet(isPresented: $showPicker, onDismiss: nil){
                    ImgPicker(selectedImage: $selectedImage,showPicker: $showPicker)
                    
                }
                Text("Upload what do you have now:").font(.title)
                    .padding()
                    .padding(.horizontal)
                VStack{
                    if selectedImage2 != nil {
                        Image(uiImage: selectedImage2!)
                            .resizable()
                            .frame(width:200, height: 200)
                    }
                    
                    Button{
                        showPicker2 =  true
                    } label: {
                        Text("Selectet a Photo").font(Font.custom("IndieFlower", size: 20))
                    }
                    if selectedImage != nil{
                        Button {
                            uploadPhoto(img:"img2")

                        } label:{
                            Text("Upload")

                        }
                    }
                }
                .sheet(isPresented: $showPicker2, onDismiss: nil){
                    ImgPicker( selectedImage: $selectedImage2,showPicker: $showPicker2)
                    
                }
                .padding()
                .padding(.horizontal)
                //                VStack(alignment: .center) {
                //                    Text("Leave your notes for us:").font(.title)
                //                    TextField("Enter your name", text: $name)
                //                    Text("\(name)")
                //                         }
                .padding()
                NavigationLink(destination: Done().navigationBarBackButtonHidden(true)){
                    RoundedRectangle(cornerRadius: 12).fill(Color(hue: 0.859, saturation: 0.415, brightness: 0.826)).frame(width: 300,height: 50,alignment: .trailing).overlay(
                        HStack(spacing:10){Text("Done").font(.title).fontWeight(.bold)
                            Image(systemName:
                                    "chevron.right")
                        }.foregroundColor(.yellow)).navigationBarBackButtonHidden(true)
                        .padding()
                }
                
            }
            
            
            
        }
        
        
        
    }
    
    func uploadPhoto(img: String) {
        
        guard selectedImage != nil else{
            return
        }
        
        let storageRef = Storage.storage().reference()
        
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        guard imageData != nil else{
            return
        }
        
        let path = "img/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        
        let uploadTask = fileRef.putData(imageData!, metadata: nil){ metadata,
            error in
            if error == nil && metadata != nil{
                
                let userID = Auth.auth().currentUser!.uid;        db.collection("Users").document("\(userID)").collection(img).addDocument(data: ["url":path])
            }
            
        }}
    
}

struct Imgiew_Previews: PreviewProvider {
    static var previews: some View {
        Imgiew()
    }
}
