//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Valentin Purrucker on 27.10.21.
//

import SwiftUI

struct CategoryItem: View {
	
	let landmark: Landmark
	
    var body: some View {
		VStack(alignment: .leading) {
			landmark.image
				.renderingMode(.original)
				.resizable()
				.frame(width: 155, height: 155)
				.cornerRadius(20)
			Text(landmark.name)
				.font(.caption)
				.foregroundColor(.primary)
		}
		.padding(.leading, 15)
        
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
		CategoryItem(landmark: ModelData().landmarks[0])
    }
}
