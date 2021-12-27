//
//  ContentView.swift
//  NeoastraTest
//
//  Created by sabaz shereef on 23/12/21.
//

import SwiftUI
import Mantis



struct ContentView: View {

    @State var isShowPicker: Bool = false
    @State var isShowing: Bool = false
    @State var image: Image? = Image("placeholder")
    @State var inputImage: UIImage?
    @State var didEdit : Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    image?
                        .resizable()
                        .scaledToFit()
                        .frame(height: 320)
                    HStack {
                    Button(action: {
                        withAnimation {
                            self.isShowPicker.toggle()
                           
                        }
                    }) {
                        Image(systemName: "photo")
                            .font(.headline)
                        Text("IMPORT").font(.headline)
                    }.foregroundColor(.black)
                
                        if image != Image("placeholder"){
                            
                        
                        Button(action: {
                         
                            isShowing = true
                           
                            didEdit = true
                    
                        }){
                        Text("EDIT")
                        }.foregroundColor(.black)
                        .font(.headline)
                        .fullScreenCover(isPresented: $isShowing){
                            ImageEditor(theImage: $inputImage, isShowing: $isShowing)
                        }
                        Button(action: {
                           
                            if didEdit{
                            savePhoto()
                            }
                        }){
                        Text("SAVE")
                        }.foregroundColor(.black)
                            .font(.headline)
                    }
                        }
                    }
                }
            }
            .sheet(isPresented: $isShowPicker) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $inputImage)
            }
            .navigationBarTitle("Pick Image")
            .onChange(of: inputImage){ _ in changeImage()}
            
        }
    
    func changeImage() {
     
        guard let inputImage = inputImage else {
            return
        }
        image = Image(uiImage: inputImage)
     
    }
    func savePhoto(){
        
        
        let imageSave = ImageSaver()
      
        guard let inputImage = inputImage else {
            return
        }
        
        imageSave.saveImageToLibrary(image: inputImage)
    }
        
     
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}



