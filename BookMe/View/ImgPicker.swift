//
//  ImgPicker.swift
//  BookMe
//
//  Created by Светлана Светикова on 2/15/23.
//

import Foundation
import UIKit
import SwiftUI

struct ImgPicker: UIViewControllerRepresentable {
   @Binding var selectedImage: UIImage?
    @Binding var showPicker: Bool
  
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        
        return imagePicker
        
        
    }
    
    
    func makeCoordinator() -> Coordinator{
        return Coordinator(self)
    }
    
    
    
    
    
}


class Coordinator: NSObject, UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    var parent: ImgPicker
    
    init(_ picker: ImgPicker) {
        
        self.parent = picker
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        print("image selected")
        
        if let image =  info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
        }
        parent.showPicker = false
    }
    
    func imagePickerControllerCancel(_ picker: UIImagePickerController){
        print("Cancelled")
        
        parent.showPicker = false
    }
    
    
    
}
