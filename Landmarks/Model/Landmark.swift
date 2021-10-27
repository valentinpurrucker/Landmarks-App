//
//  Landmark.swift
//  Landmarks
//
//  Created by Valentin Purrucker on 26.10.21.
//


import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
	let id: Int
	let name: String
	let park: String
	let state: String
	let description: String
	let category: Category
	let isFeatured: Bool
	
	
	enum Category : String, Codable, Hashable {
		case rivers = "Rivers"
		case lakes = "Lakes"
		case mountains = "Mountains"
	}
	
	var isFavorite: Bool
	
	
	private let imageName: String
	
	var image: Image {
		Image(imageName)
	}
	
	private let coordinates: Coordinate
	
	var locationCoordinate: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
	}

	
	struct Coordinate: Hashable, Codable {
		var longitude: Double
		var latitude: Double
	}
}
