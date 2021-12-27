//
//  ImageSaver.swift
//  NeoastraTest
//
//  Created by sabaz shereef on 27/12/21.
//

import Foundation
import UIKit

class ImageSaver: NSObject {
    
    func saveImageToLibrary(image: UIImage){
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    @objc func saveError(_ image: UIImage, didFinshingSavingWithError error: Error, contextInfo: UnsafeRawPointer){
        print("Saved")
    }
}
