//
//  FilterComponentView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 17/05/23.
//

import SwiftUI

struct FilterComponentView: View {
    
    var id: UUID
    var section: String
    var image: String?
    var title: String
    @Binding var isChecked: Bool
    @ObservedObject var filterVm: FilterViewModel
    
    var body: some View {
        
        HStack(spacing: 14) {
            
            if let image = image {
                if let image = UIImage(systemName: image) {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 14, height: 14)
                            .opacity(0.6)
                } else {
                    Image(image)
                        .resizable()
                        .frame(width: 14, height: 14)
                        .opacity(0.6)
                }
            }
            
            Text(title)
                .font(.subheadline)
            
            Spacer()
            
            ImageButton(image: isChecked ? AppConstants.AppImages.fillCircle: AppConstants.AppImages.circle) {
                
                if section == AppConstants.AppHeadings.sortBy {
                    isChecked = true
                    filterVm.selectedFilter = id
                } else {
                    isChecked.toggle()
                }
                
            }
        }
    }
}

struct FilterComponentView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilterComponentView(id: UUID(),
                            section: AppConstants.AppHeadings.sortBy,
                            image: AppConstants.AppImages.walkingFigure,
                            title: AppConstants.AppStrings.lowPrice,
                            isChecked: .constant(false),
                            filterVm: FilterViewModel())
    }
}
