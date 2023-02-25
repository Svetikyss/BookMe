//
//  OnBoardingScreenView.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/1/23.
//

import SwiftUI

struct OnBoardingScreenView: View {
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Color(hue: 0.958, saturation: 0.415, brightness: 0.826).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack(spacing:30){
                    Spacer()
                    Image("main").resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 500.0, height: 500.0)
                    Spacer()
                    NavigationLink(destination: TopView().navigationBarBackButtonHidden(true)){
                        RoundedRectangle(cornerRadius: 12).fill(Color(hue: 0.859, saturation: 0.415, brightness: 0.826)).frame(width: 300,height: 70,alignment: .trailing).overlay(
                            HStack(spacing:10){Text("Book appointment").font(.title).fontWeight(.bold)
                                Image(systemName:
                                "chevron.right")
                            }.foregroundColor(.yellow)).navigationBarBackButtonHidden(true)
                                    
                                                                

                    }
                    Spacer()
                }
                
                
            }
        }
        
    }
        
    }

struct OnBoardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreenView()
    }
}


//        ZStack {
//
//            Color(hue: 0.958, saturation: 0.415, brightness: 0.826).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            VStack {
//                Text("Book Me").font(.largeTitle).bold().foregroundColor(Color(hue: 1.0, saturation: 0.674, brightness: 0.477))
//                Image("pngwing.com (9)").resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 200.0, height: 200.0)
//
//            }
//
//
//        }
//
//
////        .padding()
//    }
//
