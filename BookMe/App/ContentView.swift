//
//  ContentView.swift
//  BookMe
//
//  Created by Светлана Светикова on 1/26/23.
//


import SwiftUI

struct ContentView: View {
    
    @State var isLoggedIn: Bool = false

        var body: some View {
            if !isLoggedIn {
                LoginView(isLoggedIn: $isLoggedIn)
            } else {
                OnBoardingScreenView()
            }
        }
            

        }
        


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//     LoginView()isLoggedIn: $isLoggedIn    }
//}
