//
//  FilterView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 17/05/23.
//

import SwiftUI

struct FilterView: View {
    
    @StateObject var filerVm = FilterViewModel()
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // Navigation View
            HStack {
                
                ImageButton(image: AppConstants.AppImages.multiply) {
                    self.dismiss()
                }
                .font(.title2)
                
                Spacer()
                
                // Clear All Button
                Button {
                    // clear all filters except earliest departure
//                    for i in 0..<filerVm.array.count{
//                        if filerVm.array[i].title != AppConstants.AppStrings.earlyDep{
//                            filerVm.array[i].isChecked = false
//                        }
//                    }
                    
                }label: {
                    Text(AppConstants.ButtonLabels.clearAll)
                        .font(.subheadline)
                }
            }
            
            ScrollView(showsIndicators: false) {
                
                LazyVStack(alignment: .leading) {
                    
                    Text(AppConstants.AppHeadings.filter)
                        .font(.largeTitle)
                        .bold()
                    
                    LazyVStack(alignment: .leading, spacing: 25) {
                        
                        // Sort By
                        Text(AppConstants.AppHeadings.sortBy)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        ForEach($filerVm.sortByArr) {$filter in
                            
                            FilterComponentView(
                                id: filter.id,
                                section: AppConstants.AppHeadings.sortBy,
                                image: filter.image,
                                title: filter.title,
                                isChecked: $filter.isChecked,
                                filterVm: filerVm)
                            
                            // TODO: correct checkboxes
                            .onChange(of: filerVm.selectedFilter, perform: { _ in
                                
                                for ind in 0..<$filerVm.sortByArr.count {
                                    if filerVm.selectedFilter == filter.id {
                                        continue
                                    } else {
                                        filerVm.sortByArr[ind].isChecked = false
                                    }
                                }
                            })
                        }
                        
                        Divider()
                        
                        // Departure Time
                        Text(AppConstants.AppHeadings.depTime)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        ForEach($filerVm.depTimeArr) { $filter in
                            
                            FilterComponentView(
                                id: filter.id,
                                section: AppConstants.AppHeadings.depTime,
                                title: filter.title,
                                isChecked: $filter.isChecked,
                                filterVm: filerVm)
                        }
                        
                        Divider()
                        
                        // Amenities
                        Text(AppConstants.AppHeadings.amenities)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        ForEach($filerVm.amenitiesArr) {$filter in
                            FilterComponentView(
                                id: filter.id,
                                section: AppConstants.AppHeadings.amenities,
                                image: filter.image,
                                title: filter.title,
                                isChecked: $filter.isChecked,
                                filterVm: filerVm)
                        }
                        
                    }
                    .padding(.top, 30)
                    
                }
                .padding()
            }
            
            // Filter Button
            Button {
                // Dismiss And filter
            } label: {
                ButtonLabelView(buttonLabel: AppConstants.ButtonLabels.filter)
                    .cornerRadius(20)
            }
        }
        .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
