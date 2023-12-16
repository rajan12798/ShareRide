//
//  SearchListRowView.swift
//  BlaBlaCarClone
//
//  Created by Rajan Kumar on 16/05/23.
//

import SwiftUI
import MapKit

struct SearchListRowView: View {
    
    var searchResult: MKLocalSearchCompletion
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(searchResult.title)
            
            Text(searchResult.subtitle)
                .opacity(0.6)
        }
    }
}

struct SearchListRowView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListRowView(searchResult: MKLocalSearchCompletion())
    }
}
