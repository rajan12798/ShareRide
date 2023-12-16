//
//  CarRideCardViewModel.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 17/05/23.
//

import Foundation
import SwiftUI

class CarRideCardViewModel: ObservableObject {
    
    var depDist = Int()
    var arrDist = Int()
    
    func colorCodeDist(distance: Int) -> Color {
        if distance <= 2 {
            return Color.green
        } else if distance > 2 && distance <= 10 {
            return Color.yellow
        } else {
            return Color.red
        }
    }
}
