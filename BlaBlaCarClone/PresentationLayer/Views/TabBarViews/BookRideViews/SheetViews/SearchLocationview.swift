//
//  SearchLocationview.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 16/05/23.
//

import SwiftUI

struct SearchLocationview: View {
    
    @StateObject var locVm = SearchLocationViewModel()
    @Binding var address: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            ImageButton(image: AppConstants.AppImages.multiply) {
                self.dismiss()
            }
            .font(.title2)
            
            TextField(AppConstants.AppStrings.searchLoc, text: $locVm.searchText)
                .padding(12)
                .background(Color.gray.opacity(0.2))
            
            if !locVm.searchText.isEmpty {
                
                List(locVm.searchResults, id: \.self) { res in
                    SearchListRowView(searchResult: res)
                        .onTapGesture {
                            address = res.title + "," + res.subtitle
                            dismiss()
                        }
                }
                .listStyle(.plain)
                
            } else {
                // Add recent searches
            }
            
            Spacer()
            
        }
        .padding()
    }
}

struct SearchLocationview_Previews: PreviewProvider {
    static var previews: some View {
        SearchLocationview(address: Binding.constant(""))
    }
}
