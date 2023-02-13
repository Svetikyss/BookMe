//
//  TopView.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/2/23.
//

import SwiftUI

struct TopView: View {
    
    let images: [ServisModel]=[
        .init(id:1, title: .Nails, price: "70$", image: "img2"),
        .init(id:2, title: .Makeup, price: "80$", image: "img3"),
        .init(id:3, title: .Spa, price: "100$", image: "img4"),
        .init(id:4, title: .Shave, price: "40$", image: "img5"),
        .init(id:5, title: .Color, price: "120$", image: "img6"),
        .init(id:6, title: .Cut, price: "60$", image: "img7"),
        .init(id:7, title: .BlowOut, price: "50$", image: "img8")]
              
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center,spacing: 20){
                ForEach(images, id: \.id){post in
                    NavigationLink(destination: DetailsView(servis: post.title)) {
                        ServisCardView(servises: post)
                            .shadow(color: .gray, radius: 5,x:5,y:5) 
                    }}
                
            }
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
