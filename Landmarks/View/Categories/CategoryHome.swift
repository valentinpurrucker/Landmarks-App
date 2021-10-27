//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Valentin Purrucker on 27.10.21.
//

import SwiftUI

struct CategoryHome: View {
	
	@EnvironmentObject var modelData: ModelData
	
    var body: some View {
		NavigationView {
			List {
				
				modelData.features[0].image
					.resizable()
					.scaledToFill()
					.frame(height: 200)
					.clipped()
					.listRowInsets(EdgeInsets())
				
				
				
				ForEach(modelData.categories.keys.sorted(), id: \.self) {key in
					CategoryRow(name: key, items: modelData.categories[key]!)
				}
				.listRowInsets(EdgeInsets())
			}
			.navigationTitle("Featured")
		}
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
			.environmentObject(ModelData())
    }
}
