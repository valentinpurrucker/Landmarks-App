//
//  ContentView.swift
//  Landmarks
//
//  Created by Valentin Purrucker on 26.10.21.
//

import SwiftUI

struct ContentView: View {
	
	@State var selection: Tab = .list
	
	
	enum Tab {
		case featured
		case list
	}
	
	
    var body: some View {
		
		TabView(selection: $selection) {
			LandmarksList()
				.tabItem {
					Label("List", systemImage: "list.bullet")
				}
				.tag(Tab.list)
			CategoryHome()
				.tabItem {
					Label("Featured", systemImage: "star")
				}
				.tag(Tab.featured)
		}
		
		
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(ModelData())
    }
}
