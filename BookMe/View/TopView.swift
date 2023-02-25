//
//  TopView.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/2/23.
//

import SwiftUI

struct TopView: View {
    
    @State var serchText = ""
    @State var iseSerching = false
   
    let images: [ServisModel]=[
        .init(id:1, title: .Nails, price: "70$", image: "img2"),
        .init(id:2, title: .Makeup, price: "80$", image: "img3"),
        .init(id:3, title: .Spa, price: "100$", image: "img4"),
        .init(id:4, title: .Shave, price: "40$", image: "img5"),
        .init(id:5, title: .Color, price: "120$", image: "img6"),
        .init(id:6, title: .Cut, price: "60$", image: "img7"),
        .init(id:7, title: .BlowOut, price: "50$", image: "img8")]
              
    var body: some View {
        
        NavigationView{
            //            ScrollView(.horizontal, showsIndicators: false){
            VStack{
                HStack{
                    TextField("Search terms here", text: $serchText)
                        .padding(.leading,24)
                }
                .padding(.horizontal)
                .padding(.horizontal)
                .padding()
                .background(Color(.systemGray4))
                .cornerRadius(10)
                .onTapGesture(perform: {
                    iseSerching = true
                })
//                .padding(.horizontal)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
//                        Spacer(minLength: 20);
                        Spacer()
                        if iseSerching {
                            Button(action:{ serchText = ""}, label:{
                                Image(systemName:"xmark.circle.fill")
                                
                            })
                                
                            }
                        
                        
                    }.padding(.horizontal,32)
                )
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .center,spacing: 20){
                        ForEach((images).filter({"\($0)".contains(serchText) || serchText.isEmpty}), id: \.id){post in
                            NavigationLink(destination: DateSelectView(servis: post.title).navigationBarBackButtonHidden(true)) {
                                ServisCardView(servises: post)
                                    .shadow(color: .gray, radius: 5,x:5,y:5).navigationBarBackButtonHidden(true)                            }}
                    }.navigationTitle("Find your service")
                }.padding(.horizontal)
                Stylists()
            }.padding(.horizontal)
          
        }
//    }
        
        
        
        
        
        
        
        
        
        
        
        
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
