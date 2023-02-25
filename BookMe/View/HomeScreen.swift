//
//  HomeScreen.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/1/23.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image("home")
                    .resizable()
                    .frame(width: 30,height: 30,alignment: .top)
                Spacer()
                Image("badge")
                    .resizable()
                    .frame(width: 30,height: 30,alignment: .top)
                Image(systemName: "badget")
                
            }.padding(.horizontal)
            Spacer()
            .font(.system(.title3))
            Text("Hey")
                .font(.title)
            Text("Find your style")
            
//            RoundedRectangle(cornerRadius: 15)
//                .fill(.gray.opacity(0.3))
//                .overlay(
//                    HStack{
//                        Image("search")
//                            .resizable()
//                            .frame(width: 50,height: 50,alignment: .top)
//                        Text("Search for style")
//                            .foregroundColor(.gray)
//                            .multilineTextAlignment(.leading)
//                        Spacer()
//                        
//                    }.padding()
//                        
//                ).frame(width: 350,height: 50,alignment: .center)
//            
//            
            
            Text("Top Servises")
                .font(.title)
            TopView()
            
            Text("Our team")
                .font(.title)
            Stylists()
            Spacer()
           
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
