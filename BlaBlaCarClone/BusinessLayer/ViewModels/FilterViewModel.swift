//
//  FilterViewModel.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 17/05/23.
//

import Foundation

class FilterViewModel: ObservableObject {
    
    @Published var selectedFilter: UUID = UUID()
    
    @Published var sortByArr: [FilterModel] = [
        FilterModel(image: AppConstants.AppImages.clock, title: AppConstants.AppStrings.earlyDep, isChecked: true),
        FilterModel(image: AppConstants.AppImages.coins, title: AppConstants.AppStrings.lowPrice, isChecked: false),
        FilterModel(image: AppConstants.AppImages.walkingFigure,
                    title: AppConstants.AppStrings.closeDep,
                    isChecked: false),
        FilterModel(image: AppConstants.AppImages.walkingFigure,
                    title: AppConstants.AppStrings.closArr,
                    isChecked: false),
        FilterModel(image: AppConstants.AppImages.hourGlass, title: AppConstants.AppStrings.shortRide, isChecked: false)
    ]
    
    @Published var depTimeArr: [FilterModel] = [
        FilterModel(title: AppConstants.AppStrings.before6, isChecked: false),
        FilterModel(title: AppConstants.AppStrings.after6, isChecked: false),
        FilterModel(title: AppConstants.AppStrings.after12, isChecked: false),
        FilterModel(title: AppConstants.AppStrings.after6pm, isChecked: false)
    ]
    
    @Published var amenitiesArr: [FilterModel] = [
        
        FilterModel(image: AppConstants.AppImages.verifyProfile,
                    title: AppConstants.AppStrings.verifyprofile,
                    isChecked: false),
        FilterModel(image: AppConstants.AppImages.max2, title: AppConstants.AppStrings.max2, isChecked: false),
        FilterModel(image: AppConstants.AppImages.bolt, title: AppConstants.AppStrings.insBook, isChecked: false),
        FilterModel(image: AppConstants.AppImages.smoke, title: AppConstants.AppStrings.smokeAllow, isChecked: false),
        FilterModel(image: AppConstants.AppImages.paw, title: AppConstants.AppStrings.petsAllow, isChecked: false)
    ]
    
}
