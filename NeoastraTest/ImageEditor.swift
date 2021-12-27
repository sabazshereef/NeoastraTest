//
//  ImageEditor.swift
//  NeoastraTest
//
//  Created by sabaz shereef on 27/12/21.
//

import Foundation
import SwiftUI
import UIKit
import Mantis



struct ImageEditor: UIViewControllerRepresentable{
    typealias Coordinator = ImageEditorCoordiantor
    @Binding var theImage : UIImage?
    @Binding var isShowing: Bool

    func makeCoordinator() -> Coordinator {
        return ImageEditorCoordiantor(image: $theImage, isShowing: $isShowing)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImageEditor>) ->  Mantis.CropViewController {
        guard let theImage = theImage else {
            return Mantis.cropViewController(image: UIImage(imageLiteralResourceName: "placeholder"))
           
        }

        let Editor = Mantis.cropViewController(image: theImage)
        Editor.delegate = context.coordinator
        return Editor
    }
    
}

class ImageEditorCoordiantor: NSObject, CropViewControllerDelegate{

    @Binding var theImage : UIImage?
    @Binding var isShowing: Bool

    init(image: Binding<UIImage?>, isShowing: Binding<Bool> ){
        _theImage = image
        _isShowing = isShowing
    }

    func cropViewControllerDidCrop(_ cropViewController: CropViewController, cropped: UIImage, transformation: Transformation) {
        theImage = cropped
        isShowing = false
    }

    func cropViewControllerDidFailToCrop(_ cropViewController: CropViewController, original: UIImage) {
       
    }

    func cropViewControllerDidCancel(_ cropViewController: CropViewController, original: UIImage) {
        isShowing = false
    }

    func cropViewControllerDidBeginResize(_ cropViewController: CropViewController) {

    }

    func cropViewControllerDidEndResize(_ cropViewController: CropViewController, original: UIImage, cropInfo: CropInfo) {

    }

    func cropViewControllerWillDismiss(_ cropViewController: CropViewController) {

    }

}
