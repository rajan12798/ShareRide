//
//  PhotoPickerView+.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 23/05/23.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    
    // MARK: - Properties
    @StateObject var imagePicker = PhotosPickerViewModel()
    @Binding var profilePic: Data?
    
    var body: some View {
        
        // MARK: - Photo Picker
        PhotosPicker(
            selection: $imagePicker.imageSelection,
            matching: .images
        ) {
            Image(systemName: "person.circle")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(Color.accentColor)
                .clipShape(Circle())
        }
        .onChange(of: imagePicker.image, perform: { _ in
            if let data = imagePicker.data {
                profilePic = data
            }
        })
    }
    
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView(profilePic: Binding.constant(Data()))
    }
}
