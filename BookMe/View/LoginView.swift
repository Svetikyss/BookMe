//
//  LoginView.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/14/23.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct LoginView: View {
    @State private var isLogin = false
    @State var email = ""
    @State var password = ""
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Picker("", selection: $isLogin) {
                    Text("Log In")
                        .tag(true)
                    Text("Create Account")
                        .tag(false)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 280, height: 45, alignment: .center)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 280, height: 45, alignment: .center)
                Spacer()
                Button(action: {
                    if isLogin {
                        
                        loginUser()
                        isLoggedIn = true                      } else {
                            createUser()
                        }
                }, label: {
                    Text(isLogin ? "Log In" : "Create Account")
                        .foregroundColor(.white)
                }).frame(width: 280, height: 45, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(8)
            }.navigationTitle(isLogin ? "Welcome Back" : "Welcome")
        }
    }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed due to error:", err)
                return
            }
            
            print("Successfully logged in with ID: \(result?.user.uid ?? "")")
        }
    }
    
    private func createUser() {
        Auth.auth().createUser(withEmail: email, password: password, completion: { result, err in
            if let err = err {
                print("Failed due to error:", err)
                return
                
                
            }
            createUserInfo()
            print("Successfully created account with ID: \(result?.user.uid ?? "")")
        })
        
    }
    func createUserInfo(){
        let db = Firestore.firestore()
        let Email = Auth.auth().currentUser?.email!
        let userID = Auth.auth().currentUser?.uid
        db.collection("Users").document("\(userID)").setData(["UserEmail":Email,"userID":userID])
        
    }
    
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
