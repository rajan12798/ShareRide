//
//  DatePickerView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 16/05/23.
//

import SwiftUI

struct SelectDateView: View {
    
    @Environment (\.dismiss) var dismiss
    
    @Binding var date: Date
    var interval = DateInterval(start: Date(), duration: 365 * 24 * 60 * 60)
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ImageButton(image: AppConstants.AppImages.multiply) {
                self.dismiss()
            }
            .font(.title2)
            
            Headingview(title: AppConstants.AppHeadings.selectDate)
            
            DatePicker(AppConstants.AppHeadings.selectDate,
                       selection: $date,
                       in: interval.start...interval.end,
                       displayedComponents: .date)
                .datePickerStyle(.graphical)
                .padding(.top, 40)
            
            Spacer()
        }
        .padding()
        .onChange(of: date, perform: {_ in
            self.dismiss()
        })
    }
}

struct SelectDateView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDateView(date: Binding.constant(Date.now))
    }
}
