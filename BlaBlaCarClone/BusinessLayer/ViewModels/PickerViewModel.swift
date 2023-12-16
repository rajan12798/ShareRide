//
//  PickerViewModel.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 24/05/23.
//

import Foundation

class PickerViewModel: ObservableObject {
    
    func formatDob(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dob = dateFormatter.string(from: date)
        return dob
    }
}
