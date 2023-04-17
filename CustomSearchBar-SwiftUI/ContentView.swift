//
//  ContentView.swift
//  CustomSearchBar-SwiftUI
//
//  Created by Ikmal Azman on 17/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State var searchText : String = ""
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $searchText) { newQuery in
                print("Searched : \(newQuery)")
            } onSearch: {
                print("Tap Return Search : \(searchText)")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
