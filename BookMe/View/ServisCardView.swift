//
//  ServisCardView.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/2/23.
//

import SwiftUI

let images: ServisModel = ServisModel(id: 1, title: .Cut, price: "50$", image: "img3")


struct ServisCardView: View {
    let servises: ServisModel
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing:5){
                Text(servises.title.rawValue).fontWeight(.bold).font(.system(.title3)).foregroundColor(.black)
                Text(servises.price).font(.system(.title3)).foregroundColor(.black.opacity(0.7))
                Spacer()
            }
            .padding()
            .frame(width: 175,height: 150,alignment: .center)
            .background(Color(.systemPink)).cornerRadius(30).padding()
            ZStack{
                Image(servises.image).resizable().aspectRatio(contentMode: .fit).frame(width: 140,height: 100)}.offset(y:60)
        }
        .frame(width: 175,height: 250,alignment: .center)
    }
}

struct ServisCardView_Previews: PreviewProvider {
    static var previews: some View {
        ServisCardView(servises: images)
    }
}
