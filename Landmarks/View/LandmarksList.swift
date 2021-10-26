//
//  LandmarksList.swift
//  Landmarks
//
//  Created by Valentin Purrucker on 26.10.21.
//

import SwiftUI

struct LandmarksList: View {
	
	@State private var showFavoritesOnly: Bool = false // state is always for this view and its children only, so make it private.
	
	
	
	var filteredLandmarks: [Landmark] {
		landmarks.filter {
			landmark in
			(!showFavoritesOnly || landmark.isFavorite)
		}
	}
	
	
    var body: some View {
		NavigationView {
			
			// Mix static and dynamic content
			List {
				
				Toggle("Show favorites only", isOn: $showFavoritesOnly)
				
				ForEach(filteredLandmarks) {
					landmark in
						NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
							LandmarkRow(landmark: landmark)
						}
				}
			}
			.navigationTitle("Landmarks")
		}
		
		
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarksList()
    }
}
