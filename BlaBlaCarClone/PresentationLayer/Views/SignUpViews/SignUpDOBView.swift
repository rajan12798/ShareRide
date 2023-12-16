//
//  SignUpDOBView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 10/05/23.
//

import SwiftUI

struct SignUpDOBView: View {
    
    @ObservedObject var vm: SignUpViewModel
    @Environment (\.dismiss) var dismiss
    
    var date = Calendar.current.date(byAdding: .year, value: -18, to: Date())
    
    var body: some View {
        
        VStack {
            
            ProgressBarView(currentValue: vm.currentValue, totalValue: vm.totalValue)
            
            Headingview(title: AppConstants.AppHeadings.whatsYourDob)
            
         
//                DatePicker(AppConstants.AppHeadings.whatsYourDob,
//                           selection: $vm.dateOfBirth,
//                           in: ...Date.now,
//                           displayedComponents: .date)
//                .datePickerStyle(.graphical)
//                .frame(maxHeight: 400)
            
//            DatePView()
         
            
            Spacer()
            
            // Next Button
            NavigationLink(destination: {
                // Navigate to signUpGenderView to enter gender
                SignUpGenderView(vm: vm)
            }, label: {
                ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.next)
                    .cornerRadius(18)
            })
        }
        .onAppear {
            // Progress bar value
            vm.currentValue = 2
        }
        .padding()
        .navigationTitle(AppConstants.AppHeadings.finishSignUp)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                // Back button
                ImageButton(image: AppConstants.AppImages.chevronleft) {
                    self.dismiss()
                }
                .font(.subheadline)
            }
        }
    }
}

//struct SignUpDOBView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            SignUpDOBView(vm: SignUpViewModel())
//        }
//    }
//}
