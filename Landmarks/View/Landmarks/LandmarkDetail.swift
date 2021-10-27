//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Valentin Purrucker on 26.10.21.
//

import SwiftUI

struct LandmarkDetail: View {
	
	@EnvironmentObject var modelData: ModelData
	
	let landmark: Landmark
	
	var landmarkIndex: Int {
		modelData.landmarks.firstIndex(where: {currentLandmark in currentLandmark.id == self.landmark.id})!
	}
	
    var body: some View {
		ScrollView {
			MapView(coordinate: landmark.locationCoordinate)
				.ignoresSafeArea(edges: .top)
				.frame(height: 300) // only height means the view will automatically be as wide as needed (mapview always takes full width)
			CircleImage(image: landmark.image)
				.offset(y: -130)
				.padding(.bottom, -130)
			
			VStack(alignment: .leading) {
				HStack {
				Text(landmark.name)
					.font(.title)
				FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
				}
				HStack {
					Text(landmark.park)
					
						// spacer makes containing view to use all available space of parent view.
					Spacer()
					
					Text(landmark.state)
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
				
				Divider()
				Text("About \(landmark.name)")
					.font(.title2)
				Text(landmark.description)
			}
			.padding()
		}
		.navigationTitle(landmark.name)
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
		LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
