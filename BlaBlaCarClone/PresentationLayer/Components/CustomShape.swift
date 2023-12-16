//
//  BezierCurveView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 17/05/23.
//

import SwiftUI

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            
            let width: CGFloat = rect.width/2
            let height: CGFloat = rect.height
            
            path.addArc(center: CGPoint(x: width, y: width),
                        radius: width,
                        startAngle: Angle(degrees: 450),
                        endAngle: Angle(degrees: 90),
                        clockwise: true)
            
            path.addLine(to: CGPoint(x: width, y: height - width*2))
            
            path.addArc(center: CGPoint(x: width, y: height - width),
                        radius: width,
                        startAngle: Angle(degrees: -90),
                        endAngle: Angle(degrees: 270),
                        clockwise: true)
            
        }
    }
    
}
