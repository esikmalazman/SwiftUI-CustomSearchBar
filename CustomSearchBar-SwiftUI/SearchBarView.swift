//
//  SearchBarView.swift
//  CustomSearchBar-SwiftUI
//
//  Created by Ikmal Azman on 17/04/2023.
//

import SwiftUI

struct SearchBarView: View {
    @FocusState private var textFieldIsActive : Bool
    @Binding var searchText : String
    var onSearchDidChange : (String) -> Void = {_ in}
    var onSearch : (String) -> Void = {_ in}
    
    var body: some View {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(searchText.isEmpty ? .gray : .black)
                
                TextField("Search", text: $searchText) {
                    onSearch(searchText)
                }
                .focused($textFieldIsActive)
                .autocorrectionDisabled(true)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding()
                        .offset(x: 15, y: 0)
                        .opacity(searchText.isEmpty ? 0 : 1)
                        .onTapGesture {
                            textFieldIsActive = false
                            searchText = ""
                        }
                }
                .onChange(of: searchText) { newValue in
                    onSearchDidChange(newValue)
                }
            }
            .font(.headline)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.1))
                    .shadow(color:.black.opacity(0.15),
                            radius: 10,
                            x: 0, y: 0)
            )
            
        

    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
