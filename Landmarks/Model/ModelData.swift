//
//  ModelData.swift
//  Landmarks
//
//  Created by Valentin Purrucker on 26.10.21.
//

import Foundation

final class ModelData : ObservableObject {
	@Published var landmarks: [Landmark] = load("landmarkData.json")
	
	var hikes: [Hike] = load("hikeData.json")
	
	var categories: [String: [Landmark]] {
		Dictionary(grouping: landmarks, by: {landmark in landmark.category.rawValue})
	}
	
	var features: [Landmark] {
		landmarks.filter {landmark in
			(landmark.isFeatured)
		}
	}
}



func load<T: Decodable>(_ filename: String) -> T {
	
	guard let dataUrl = Bundle.main.url(forResource: filename, withExtension: nil) else {
		fatalError("File with filename \(filename) not found")
	}
	
	
	let data: Data
	
	do {
		data = try Data(contentsOf: dataUrl)
	} catch{
		fatalError("Couldn't read data from file")
	}
	
	do {
		let decoder = JSONDecoder()
		return try decoder.decode(T.self, from: data)
	} catch {
		fatalError("Youldn't decode data correctly")
	}
	
	
}
