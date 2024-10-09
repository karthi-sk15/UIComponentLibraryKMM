import SwiftUI
import shared

struct ContentView: View {
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationView {
            ScrollView(
                .vertical,
                showsIndicators:false
            ){
                
                VStack (
                    alignment: .leading,
                    spacing:20
                ){
                    VStack  (
                        alignment: .leading,
                        spacing:20
                    ) {
                        UserListTileView.TopBar(
                            title: "Messages",
                            action: {
                                // Action code here
                            })
                        UserListTileView.SearchBar(
                            searchText: $searchQuery
                        )
                        UserListTileView.ProfileStoryView(
                            profileImageUrls: [
                                "https://randomuser.me/api/portraits/men/1.jpg",
                                "https://randomuser.me/api/portraits/women/2.jpg",
                                "https://randomuser.me/api/portraits/men/2.jpg",
                                "https://randomuser.me/api/portraits/men/3.jpg",
                                "https://randomuser.me/api/portraits/women/4.jpg",
                                "https://randomuser.me/api/portraits/men/6.jpg",
                                "https://randomuser.me/api/portraits/women/6.jpg"
                            ]
                        ) {
                            print(
                                "Add button tapped"
                            )
                        }
                        
                    }
                    .frame(
                        maxWidth: .infinity
                    )
                    .padding()
                    .background(
                        Color.white.opacity(
                            0.5
                        )
                    )
                    
                    
                    VStack {
                        ForEach(
                            data
                        ) { i in
                            NavigationLink(
                                destination: ChatView(
                                    user: i
                                )
                            ) {
                                UserListTileView.UserListTiles(
                                    data: i
                                ).foregroundColor(
                                    .primary
                                )
                            }
                            
                        }
                    }.padding(
                        [
                            .leading,
                            .trailing
                        ],
                        10
                    )
                }.frame(
                    maxWidth: .infinity,
                    maxHeight:  .infinity,
                    alignment: .topLeading
                )
                
            }.background(
                Color.gray.opacity(
                    0.2
                )
            )
        }
    }
}


struct ChatView: View {
    let user: UserListTileModel
    @State private var userConversion = sampleMessages
    var body: some View {
        
        VStack{
            ScrollViewReader { scrollProxy in
                ScrollView {
                    LazyVStack(
                        spacing: 8
                    ) {
                        ForEach(
                            userConversion.indices,
                            id: \.self
                        ) { index in
                            if DateHelper.shouldShowDate(
                                for: userConversion,
                                at: index
                            ) {
                                ChatConversationView.ChatTitleDateView{
                                    Text("Date \(userConversion[index].timestamp)")
                                }
                            }
                            
                            ChatConversationView.MessageBubble(
                                message: userConversion[index],
                                userName: user.name
                            )
                        }
                    }
                    .padding()
                    .onChange(of: userConversion.count) { _ in
                        // Scroll to the last message when a new one is added
                        scrollProxy.scrollTo(userConversion.count - 1, anchor: .bottom)
                    }
                }
                .onAppear {
                    if !userConversion.isEmpty {
                        scrollProxy.scrollTo(userConversion.count - 1, anchor: .bottom)
                    }
                }
            }
            Spacer()
            ChatConversationView.MessageInputView(
                sendMessage: { newMessageText in
                    let newMessage = ChatConversionModel(senderName: "You", text: newMessageText, isOwnMessage: true)
                    userConversion.append(newMessage)
                    let delayedMessage = ChatConversionModel(senderName: "\(user.name)", text: "This is a delayed response.", isOwnMessage: false)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        userConversion.append(delayedMessage)
                    }
                    
                }
                //                textFieldIconsView: {
                //                    ChatConversationView.ChatAppBarView(
                //                        user: user
                //                    )
                //                },
                //                sendButtonView: {
                //                    Image(systemName: "face.smiling")
                //                        .resizable()
                //                        .aspectRatio(contentMode: .fit)
                //                        .frame(width: 24, height: 24)
                //                        .foregroundColor(.gray)
                //                        .padding(.trailing, 10)
                //                }
            )
            
        }.toolbar{
            ToolbarItem(
                placement: .principal
            ){
                ChatConversationView.ChatAppBarView(
                    user: user
//                    userDetailView: {
//                        HStack(alignment: .top) {
//                            ZStack{
//                                AsyncImage(url: URL(string: "\(user.image)")) { image in
//                                    image
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .frame(width: 50, height: 50)
//                                        .clipShape(Circle())
//                                } placeholder: {
//                                    ProgressView()
//                                        .frame(width: 50, height: 50)
//                                }
//                                
//                                Circle()
//                                    .fill(user.isOnline ? Color.green : Color.gray)
//                                       .frame(width: 10, height: 10)
//                                       .padding(1)
//                                       .background(Color.white)
//                                       .clipShape(Circle())
//                                       .offset(x: 18, y: 18)
//                            }
//                            
//                            VStack(alignment: .center) {
//                                    Text(user.name)
//                                        .font(.headline)
//                                        .foregroundColor(.primary)
//                                if user.isOnline {
//                                    Text("Typing...")
//                                        .font(.caption2)
//                                        .foregroundColor(.gray)
//                                        .padding(.leading,16)
//                                }
//                            }
//                        }.frame(width: 250).background(Color.red)                   
//                    }
                )
                
            }
        }.toolbarBackground(
            Color.gray.opacity(
                0.2
            ),
            for: .navigationBar
        )
        .toolbarBackground(
            .visible,
            for: .navigationBar
        )
    }
}



#Preview {
    ContentView()
}




