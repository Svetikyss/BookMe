//
//  DateSelectView.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/8/23.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct DateSelectView: View {
    

    
    let db = Firestore.firestore()
 
//    @State
   
    var servis: servisTitle
    @State var goWhenTrue: Bool = false
    @State var date: Date = Date()
    @State var selectedTime = ""
    
   var appointments = [Appointment]()
    @ObservedObject private var viewModel = ReadData()

//    var appointment: [Appointment]  = [Appointment(servis: <#String#>, date: <#String#>, time: <#String#>, servisTime: <#String#>)]

    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading,spacing: 25){
                Image("yyy")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .clipShape(RoundcornShape.init(corners: [.bottomLeft,.bottomRight], radius: 50)).frame(height: 200)
//                    .frame(width: .infinity,height: .infinity,alignment: .top)
                    .edgesIgnoringSafeArea(.all)
                    .shadow(color:.gray,radius: 5,x:5,y:5).padding(.top, -100)
                //                Spacer()
                Text("Select date and time ✔️").font(.largeTitle).fontWeight(.bold)
                    .edgesIgnoringSafeArea(.top)                .padding(.bottom)
                    .padding()
            }
            HStack{
                Text("Date:").fontWeight(.bold).font(.title)
                Spacer()
                   
                DatePicker("",selection: $date,in: Date()..., displayedComponents: .date).frame(width: 150, height: 70, alignment: .center).background(Color(.systemPink))
                    .clipShape(RoundedRectangle(cornerRadius: 12)).opacity(0.60).foregroundColor(.white).font(.title).fontWeight(.bold)
                
                
                
            }.padding()
            
            ScrollView(.horizontal,showsIndicators: false,content: {
                HStack(spacing:15){
                    ForEach(time,id:\ .self){
                        timing in
                        
                        Text(timing).fontWeight(.bold)
                            .foregroundColor(.pink)
                            .padding(.vertical)
                            .padding(.horizontal)
                            .background(Color(.gray).opacity(selectedTime == timing ? 1:0.2))
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedTime = timing
                                

                            }
                                            }
                }
            }).padding()
            
            ScrollView(.horizontal,showsIndicators: false,content: {
                HStack(spacing:15){

                    ForEach(time2,id:\ .self){
                        timing in
                        
                        Text(timing).fontWeight(.bold)
                            .foregroundColor(.pink)
                            .padding(.vertical)
                            .padding(.horizontal)
                            .background(Color(.gray).opacity(selectedTime == timing ? 1:0.2))
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedTime = timing
                                

                            }
                                            }
                }
            }).padding()
           
        
            HStack(spacing:15){
                VStack(alignment: .leading,spacing: 10, content: {
                    let newDate =   date.formatted(.dateTime.day().month().year())
                    HStack{
                        List{
                            Text("Your appointment:").font(.title3)
                            Text("\(servis.rawValue) -  Your service").font(.title)
                            Text("\(selectedTime)").font(.title)
                            Text(newDate).font(.title)
                        }.listStyle(.inset)
                    }
                    HStack{
                        NavigationLink(destination: ReadView().navigationBarBackButtonHidden(true), isActive: $goWhenTrue){
                            
                            Button(action: {
                                viewModel.addData(servis: "\(servis.rawValue)", date: newDate ,time: selectedTime)
                                goWhenTrue = true                          }
                                   //                               , label: {
                                   ////                                Text("Add")
                                   //                            }
                            ){Text("Confirm                        ")}.padding()
                                .font(.title).fontWeight(.bold)
                                .foregroundColor(.white)
                                .background(Color(.systemPink))
                                .clipShape(RoundedRectangle(cornerRadius: 12)).opacity(0.60).frame(width: 200,height: 80,alignment: .trailing)
                        }
                        .padding(.horizontal)
                        NavigationLink(destination: TopView().navigationBarBackButtonHidden(true)){
                            RoundedRectangle(cornerRadius: 12).fill(Color(.systemPink)).opacity(0.60).frame(width: 200,height: 70,alignment: .trailing).overlay(
                                HStack(spacing:10){Text("Update").font(.title).fontWeight(.bold)
                                    Image(systemName:
                                            "chevron.right")
                                }.foregroundColor(.white).navigationBarBackButtonHidden(true))
                            
                        }.padding()
                        
                    }
                    })
                
                
                
                        
                
              
                }
        
     
                       }
        
        
          }
    
    
  
   
    
}




struct DateSelectView_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectView(servis:.Color)
    }
}




//                    RoundedRectangle(cornerRadius: 8)
//                        .fill(Color(.systemPink))
//                        .opacity(0.60)
//                        .frame(width: 350,height: 50,alignment: .center)
//                        .cornerRadius(15)
//                        .shadow(color:.gray,radius: 5,x:5,y:5)
//                        .overlay(
//                            Text("Continue")
//                                .font(.system(.title3))
//                                .fontWeight(.medium)).padding(.horizontal)
