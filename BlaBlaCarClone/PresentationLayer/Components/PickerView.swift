//
//  DatePickerView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 24/05/23.
//

import SwiftUI

struct PickerView: View {
    
    @StateObject var pickerVm = PickerViewModel()
    
    @Binding var showPicker: Bool
    @Binding var shownDate: Date
    @Binding var myDate: String
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                
                HStack {
                    Spacer()
                    
                    Button {
                        myDate = pickerVm.formatDob(date: shownDate)
                        showPicker.toggle()
                    } label: {
                        Text(AppConstants.ButtonLabels.done)
                            .font(.headline)
                    }
                    
                }
                .padding(.trailing)
                .frame(height: 40)
                
                DatePicker(AppConstants.AppStrings.dateOfBirth,
                           selection: $shownDate,
                           in: ...Date.now,
                           displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .frame(width: geometry.size.width, height: 200, alignment: .center)
                    
            }.background(.gray.opacity(0.1))
            
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(showPicker: Binding.constant(true),
                   shownDate: Binding.constant(Date()), myDate: Binding.constant(""))
    }
}
