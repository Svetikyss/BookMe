//
//  Done.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/15/23.
//

import SwiftUI

struct Done: View {
    var body: some View {
        
        NavigationView{
            
            //            NavigationLink(destination: TopView()){
            //                Button(action:  {
            //                },labelImage(systemName:"house.fill").foregroundColor(.black)
            //                    .offset(x: 170.0, y: -250.0)                })
            
            //            }
            
            
            VStack{
                VStack{
                    Image("done").resizable().frame(width: 300, height: 400, alignment: .center)
                }
                Spacer()
                //            VStack{
                //                NavigationLink(destination: TopView().navigationBarBackButtonHidden(true)){
                //                    HStack{
                //
                //                        Image(systemName:
                //                                "house").offset(x: -170.0, y: -800.0)                    }.foregroundColor(.black)
                //
                //
                //                }
                //                }
                
                
                NavigationLink(destination: TopView()) {
                    Text("Back")
                    
                }
                
            }
        }}
}

struct Done_Previews: PreviewProvider {
    static var previews: some View {
        Done()
    }
}
