//
//  UserListTileModel.swift
//  iosApp
//
//  Created by Karthikeyan on 24/09/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation



public struct UserListTileModel: Identifiable {
    public var id: Int
    public var name: String
    public var message: String
    public var date: String
    public var image: String
    public var isOnline: Bool
}

public var data: [UserListTileModel] = [
    UserListTileModel(id: 0, name: "Emily", message: "Hello!!!", date: "25/03/20", image: "https://randomuser.me/api/portraits/women/0.jpg", isOnline: true),
    UserListTileModel(id: 1, name: "John", message: "How are you?", date: "22/03/20", image: "https://randomuser.me/api/portraits/men/1.jpg", isOnline: false),
    UserListTileModel(id: 2, name: "Catherine", message: "New Tutorial", date: "20/03/20", image: "https://randomuser.me/api/portraits/women/2.jpg", isOnline: true),
    UserListTileModel(id: 3, name: "Emma", message: "Hey everyone", date: "25/03/20", image: "https://randomuser.me/api/portraits/women/3.jpg", isOnline: false),
    UserListTileModel(id: 4, name: "Lina", message: "SwiftUI Tutorials", date: "25/03/20", image: "https://randomuser.me/api/portraits/women/4.jpg", isOnline: true),
    UserListTileModel(id: 5, name: "Steve Jobs", message: "New Apple iPhone", date: "15/03/20", image: "https://randomuser.me/api/portraits/men/5.jpg", isOnline: false),
    UserListTileModel(id: 6, name: "Roy", message: "Hey guys!!!", date: "25/03/20", image: "https://randomuser.me/api/portraits/men/6.jpg", isOnline: true),
    UserListTileModel(id: 7, name: "Julia", message: "Hello!!!", date: "25/03/20", image: "https://randomuser.me/api/portraits/women/7.jpg", isOnline: true),
    UserListTileModel(id: 8, name: "Watson", message: "How are you?", date: "22/03/20", image: "https://randomuser.me/api/portraits/men/8.jpg", isOnline: false),
    UserListTileModel(id: 9, name: "Kavuya", message: "New Tutorial", date: "20/03/20", image: "https://randomuser.me/api/portraits/men/9.jpg", isOnline: true),
    UserListTileModel(id: 10, name: "Julie", message: "Hey everyone", date: "25/03/20", image: "https://randomuser.me/api/portraits/women/10.jpg", isOnline: false),
    UserListTileModel(id: 11, name: "Lisa", message: "SwiftUI Tutorials", date: "25/03/20", image: "https://randomuser.me/api/portraits/women/11.jpg", isOnline: true),
    UserListTileModel(id: 12, name: "Chris", message: "Let's catch up soon!", date: "26/03/20", image: "https://randomuser.me/api/portraits/men/12.jpg", isOnline: false),
    UserListTileModel(id: 13, name: "Natalie", message: "Good morning!", date: "27/03/20", image: "https://randomuser.me/api/portraits/women/13.jpg", isOnline: true),
    UserListTileModel(id: 14, name: "David", message: "What are your thoughts?", date: "28/03/20", image: "https://randomuser.me/api/portraits/men/14.jpg", isOnline: true),
    UserListTileModel(id: 15, name: "Sophia", message: "Meeting postponed.", date: "29/03/20", image: "https://randomuser.me/api/portraits/women/15.jpg", isOnline: false),
    UserListTileModel(id: 16, name: "Max", message: "Can you send me that file?", date: "30/03/20", image: "https://randomuser.me/api/portraits/men/16.jpg", isOnline: true),
    UserListTileModel(id: 17, name: "Olivia", message: "Congratulations!", date: "31/03/20", image: "https://randomuser.me/api/portraits/women/17.jpg", isOnline: false),
    UserListTileModel(id: 18, name: "Liam", message: "Let's discuss this.", date: "01/04/20", image: "https://randomuser.me/api/portraits/men/18.jpg", isOnline: true),
    UserListTileModel(id: 19, name: "Mia", message: "Looking forward to it.", date: "02/04/20", image: "https://randomuser.me/api/portraits/women/19.jpg", isOnline: false),
    UserListTileModel(id: 20, name: "Noah", message: "Can we reschedule?", date: "03/04/20", image: "https://randomuser.me/api/portraits/men/20.jpg", isOnline: true),
    UserListTileModel(id: 21, name: "Ella", message: "Thanks for your help!", date: "04/04/20", image: "https://randomuser.me/api/portraits/women/21.jpg", isOnline: false),
    UserListTileModel(id: 22, name: "James", message: "I'll get back to you.", date: "05/04/20", image: "https://randomuser.me/api/portraits/men/22.jpg", isOnline: true),
    UserListTileModel(id: 23, name: "Grace", message: "Let me know!", date: "06/04/20", image: "https://randomuser.me/api/portraits/women/23.jpg", isOnline: false),
    UserListTileModel(id: 24, name: "Henry", message: "See you tomorrow.", date: "07/04/20", image: "https://randomuser.me/api/portraits/men/24.jpg", isOnline: true),
    UserListTileModel(id: 25, name: "Charlotte", message: "Please review.", date: "08/04/20", image: "https://randomuser.me/api/portraits/women/25.jpg", isOnline: false),
    UserListTileModel(id: 26, name: "Daniel", message: "Let's finalize the plan.", date: "09/04/20", image: "https://randomuser.me/api/portraits/men/26.jpg", isOnline: true),
    UserListTileModel(id: 27, name: "Amelia", message: "Exciting news!", date: "10/04/20", image: "https://randomuser.me/api/portraits/women/27.jpg", isOnline: false),
    UserListTileModel(id: 28, name: "Ethan", message: "I'll send it over.", date: "11/04/20", image: "https://randomuser.me/api/portraits/men/28.jpg", isOnline: true),
    UserListTileModel(id: 29, name: "Harper", message: "Let me check.", date: "12/04/20", image: "https://randomuser.me/api/portraits/women/29.jpg", isOnline: false),
    UserListTileModel(id: 30, name: "Sebastian", message: "Meeting confirmed.", date: "13/04/20", image: "https://randomuser.me/api/portraits/men/30.jpg", isOnline: true),
]


