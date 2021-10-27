//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Valentin Purrucker on 27.10.21.
//

import SwiftUI

struct CategoryRow: View {
	
	var name: String
	
	var items: [Landmark]
	
    var body: some View {
		VStack(alignment: .leading) {
			Text(name)
				.font(.headline)
				.padding(.leading, 15)
				.padding(.top, 5)
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(alignment: .top, spacing: 0) {
					ForEach(items) {item in
						NavigationLink(destination: LandmarkDetail(landmark: item)) {
							CategoryItem(landmark: item)
						}
					}
				}
			}
			.frame(height: 185)
		}
    }
}

struct CategoryRow_Previews: PreviewProvider {
	
	static var landmarks = ModelData().landmarks
	
    static var previews: some View {
		CategoryRow(name: landmarks[0].category.rawValue, items: Array(landmarks.prefix(5)))
    }
}
