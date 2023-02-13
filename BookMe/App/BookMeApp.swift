//
//  BookMeApp.swift
//  BookMe
//
//  Created by Светлана Светикова on 1/26/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
//        let db = Firestore.firestore()
       
        return true
    }
}

@main
struct BookMeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct Previews_BookMeApp_Previews: PreviewProvider {
    static var previews: some View {
        Text("BookMe")
            
        Label("BookMe", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
    }
}
