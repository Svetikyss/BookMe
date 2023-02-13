//
//  Stylists.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/3/23.
//

import SwiftUI

struct Stylists: View {
    let dataArray:[PlaceModel] = [
        .init(id: 0, name: "Lisa", time: "9-18", rating: "5", image: "stylist"),
        .init(id: 1, name: "Maria", time: "9-18", rating: "5", image: "stylist"),
        .init(id: 2, name: "Cris", time: "9-18", rating: "5", image: "stylist"),
        .init(id: 3, name: "Paula", time: "9-18", rating: "5", image: "stylist")
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            ForEach(dataArray, id:\.id){
                post in
                HStack{
                    RoundedRectangle(cornerRadius: 15).foregroundColor(.gray.opacity(0.2))
                        .frame(width: 100,height: 100)
                        .overlay(Image(post.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        )
                    VStack(alignment: .leading){
                        Text("\(post.name)")
                            .font(.system(.headline))
                        Text("\(post.time)")
                            .font(.system(.subheadline))
                            .foregroundColor(.gray)
                        Text("\(post.rating)")
                            .font(.system(.headline))
                    }
                }
            }
        }
    }
}

struct Stylists_Previews: PreviewProvider {
    static var previews: some View {
        Stylists()
    }
}
