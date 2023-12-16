//
//  date.swift
//  BlaBlaCarClone
//
//  Created by rajan kumar on 26/05/23.
//

import SwiftUI

struct DatePView: View {
    
   var date1 = Calendar.current.date(byAdding: .year, value: -18, to: Date())
    @State var dob = Date.now
    @Binding var isActive:Bool
    var body: some View {
        VStack{
            if let date1 = date1{
                DatePicker(AppConstants.AppHeadings.whatsYourDob,
                           selection: $dob,
                           in: ...date1,
                           displayedComponents: .date)
                .datePickerStyle(.graphical)
                .frame(maxHeight: 400)
            }
        
            
            Text("testinfg")
        }.onAppear(){
            isActive = false
        }
        
    }
}

//struct Date_Previews: PreviewProvider {
//    static var DatePView: some View {
//        date()
//    }
//}
