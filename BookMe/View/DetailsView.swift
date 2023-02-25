//
//  DetailsView.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/2/23.
//

import SwiftUI

struct RoundcornShape: Shape{
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect)-> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize( width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DetailsView: View {
    
    @State var servis: servisTitle
   
    // @Binding var selected: servisTitle
//    @Binding var servisTitleRawValue:String
    var body: some View {
        let servisTitleRawValue = servis.rawValue
      
        VStack(alignment: .leading,spacing: 25){
            
            Image("")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .clipShape(RoundcornShape.init(corners: [.bottomLeft,.bottomRight], radius: 50))
                .frame(width: .infinity,height: .infinity,alignment: .top)
                .edgesIgnoringSafeArea(.all)
                .shadow(color:.gray,radius: 5,x:5,y:5)
                .overlay(
                    VStack{
                        Image("img4")
                            .resizable()
                            .frame(width: 150,height: 150,alignment: .center)
                            .shadow(color:.gray,radius: 5,x:5,y:5)
                        
//                        Text("\(servis.rawValue) -  Your servis")
                            .padding(.horizontal)
                           
                       
                        Text(servisTitleRawValue)
                        })
            Spacer()
         
            HStack{
//                RoundedRectangle(cornerRadius: 8)
//                    .fill(Color(.gray))
//                    .opacity(0.15)
                Image("img1").resizable()
//                    .overlay(Image("img1"))
                    .font(.system(size:40))
                    .frame(width: 80,height: 80)
                VStack(alignment: .leading, spacing: 5){
                    Text("Servis time:")
                    Text("60 min")
                }
            }.padding(.horizontal)
//            Image("bg2")
//                .resizable()
            

//            NavigationLink(destination: DateSelectView(servis:servisTitle)){
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.systemPink))
                    .opacity(0.40)
                    .frame(width: 350,height: 50,alignment: .center)
                    .cornerRadius(15)
                    .shadow(color:.gray,radius: 5,x:5,y:5)
                    .overlay(
                        Text("Book appointment")
                            .font(.system(.title3))
                            .fontWeight(.medium)).padding(.horizontal)
//            }
        }
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(servis:.BlowOut)
    }
}
