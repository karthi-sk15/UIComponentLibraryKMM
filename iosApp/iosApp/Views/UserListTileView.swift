//
//  UserListTileView.swift
//  iosApp
//
//  Created by Karthikeyan on 24/09/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI

public struct UserListTileView {
    
    ///AppBar Title and Menu Icon
    public struct TopBar: View {
        public var title: String
        public var action: () -> Void
        
        public var body: some View {
            HStack {
                Text(title)
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundStyle(.black.opacity(0.7))
                Spacer()
                Button(action: action) {
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black.opacity(0.6))
                }
            }
            
        }
    }
    
    
    
    ///Search User for UserListTile
    public struct SearchBar: View {
        @Binding var searchText: String
        
        public var body: some View {
            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.black.opacity(0.3))
                TextField("Search", text: $searchText)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
        }
    }
    
    
    
    ///Profile Story View
    public struct ProfileStoryView: View {
        let profileImageUrls: [String]
        var addAction: () -> Void
        
        public var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    Button(action: addAction) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black.opacity(0.6))
                    }
                    .frame(width: 60, height: 60)
                    .background(Color.blue.opacity(0.5))
                    .clipShape(Circle())
                    
                    ForEach(profileImageUrls, id: \.self) { url in
                        AsyncImage(url: URL(string: url)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                                .frame(width: 60, height: 60)
                        }
                    }
                }
            }
        }
    }
    
    public struct UserListTiles: View {
        public var data : UserListTileModel
        public var body: some View {
            VStack(){
                HStack(){
                    ZStack{
                        AsyncImage(url: URL(string: "\(data.image)")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                                .frame(width: 50, height: 50)
                        }
                        
                        Circle()
                            .fill(data.isOnline ? Color.green : Color.gray)
                               .frame(width: 10, height: 10)
                               .padding(1)
                               .background(Color.white)
                               .clipShape(Circle())
                               .offset(x: 18, y: 18)
                    }
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("\(data.name)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("\(data.message)").font(.caption)
                    }
                    Spacer()
                    VStack(spacing: 5){
                        Text("\(data.date)")
                            .font(.system(size: 12,weight: .medium))
                        Spacer()
                    }
                }.padding(2)
                Divider()
            }
        }
        
    }
    
    
    
    
    
}



#Preview {
    ContentView()
}
