//
//  ChatConversationView.swift
//  iosApp
//
//  Created by Karthikeyan on 24/09/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI

public struct ChatConversationView {
    
    ///
    public struct ChatTitleDateView<CustomDateView: View>: View {
        private let date: Date?
        private let customView: CustomDateView
        
        ///
        public init(
             date: Date
         )where CustomDateView == EmptyView  {
             self.date = date
             self.customView = EmptyView()
         }

       ///
         public init(
             @ViewBuilder customView: () -> CustomDateView
         ) {
             self.date = nil
             self.customView = customView()
         }
        
        
        public var body: some View {
            if  date != nil {
                    Text(date!, style: .date)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(8)
                } else {
                    customView
                }
        }
    }
    
    
    ///
    public struct ChatAppBarView<UserDetailView:View,OnVideoCallView:View,OnCallView:View>: View {
        private let user: UserListTileModel?
        private let userDetailView: UserDetailView
        private let videoCallView: OnVideoCallView
        private let onVideoTap: (() -> Void)?
        private let onCallView: OnCallView
        private let onCallTap: (() -> Void)?
        
        public init( user: UserListTileModel,
                     @ViewBuilder userDetailView: () -> UserDetailView,
                     @ViewBuilder videoCallView: () -> OnVideoCallView,
                     @ViewBuilder onCallView: () -> OnCallView,
                     onVideoTap: (() -> Void)? = nil,
                     onCallTap:(() -> Void)? = nil
        ) {
            self.user = user
            self.userDetailView = userDetailView()
            self.videoCallView = videoCallView()
            self.onCallView = onCallView()
            self.onVideoTap = onVideoTap
            self.onCallTap = onCallTap
        }
        
        public init(
                     @ViewBuilder userDetailView: () -> UserDetailView,
                     @ViewBuilder videoCallView: () -> OnVideoCallView,
                     @ViewBuilder onCallView: () -> OnCallView,
                     onVideoTap: (() -> Void)? = nil,
                     onCallTap: (() -> Void)? = nil
        ) {
            self.user = nil
            self.userDetailView = userDetailView()
            self.videoCallView = videoCallView()
            self.onCallView = onCallView()
            self.onVideoTap = onVideoTap
            self.onCallTap = onCallTap
        }
        
        public var body: some View {
            HStack {
                if user != nil {
                    VStack(alignment: .center) {
                        HStack(spacing: 4) {
                            Circle()
                                .fill(user!.isOnline ? Color.green : Color.gray)
                                .frame(width: 10, height: 10)
                            Text(user!.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        if user!.isOnline {
                            Text("Typing...")
                                .font(.caption2)
                                .foregroundColor(.gray)
                                .padding(.leading,16)
                        }
                    }
                    .padding(.bottom,8)
                .frame(maxWidth: 250)
                } else {
                    userDetailView
                }
                
                
                Spacer()
                
               
                    if onCallView is EmptyView {
                        Image(systemName: "phone.fill")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.blue)
                        .gesture(TapGesture()
                            .onEnded {
                                onCallTap?()
                            }
                    )
                    } else {
                        onCallView
                    }
               
                
                Spacer(minLength: 40)
                
                VStack {
                    if videoCallView is EmptyView {
                        Image(systemName: "video")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.blue)
                        .gesture(TapGesture()
                            .onEnded {
                                onVideoTap?()
                            }
                    )
                    } else {
                        videoCallView
                    }
                }
            }.frame(maxWidth: .infinity, alignment: .center)
        }
    }
    
    
    public struct MessageBubble<RemoteUser: View , CurrentUser: View,TextBubbles: View>: View {
        private  let message: ChatConversionModel
        private let userName: String
        private let remoteUserTimeView: RemoteUser
        private let currentUserTickView: CurrentUser
        private let textBubbles: TextBubbles
        @State private var isVisible = false
        
        public init( message: ChatConversionModel,
              userName: String,
              @ViewBuilder remoteUserTimeView: () -> RemoteUser,
              @ViewBuilder textBubbles: () -> TextBubbles,
              @ViewBuilder currentUserTickView: () -> CurrentUser
        ) {
            self.message = message
            self.userName = userName
            self.remoteUserTimeView = remoteUserTimeView()
            self.textBubbles = textBubbles()
            self.currentUserTickView = currentUserTickView()
        }
        public  var body: some View {
            HStack {
                if message.isOwnMessage {
                    Spacer()
                }
                VStack(alignment: message.isOwnMessage ? .trailing : .leading) {
                    if !message.isOwnMessage {
                        if remoteUserTimeView is EmptyView {
                            HStack(spacing: 4) {
                                Text("\(userName) |")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(message.timestamp, style: .time)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        } else {
                            remoteUserTimeView
                        }
                        
                    }
                    Text(message.text)
                        .padding()
                        .background(message.isOwnMessage ? Color.blue : Color.gray.opacity(0.2))
                        .foregroundColor(message.isOwnMessage ? .white : .black)
                        .cornerRadius(16)
                    
                    if message.isOwnMessage {
                        if currentUserTickView is EmptyView {
                            HStack(spacing: 4) {
                                
                                Text(message.timestamp, style: .time)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.gray)
                                
                            }
                            .padding(.top, 2)
                        } else {
                            
                            currentUserTickView
                            
                        }
                        
                    }
                }
                .frame(maxWidth: 400, alignment: message.isOwnMessage ? .trailing : .leading)
                .transition(message.isOwnMessage ? .move(edge: .trailing) : .move(edge: .leading))
                .opacity(isVisible ? 1 : 0)
                
                if !message.isOwnMessage {
                    Spacer()
                }
            }
            .padding(message.isOwnMessage ? .leading : .trailing, 50)
            .padding(.vertical, 4)
            .onAppear {
                withAnimation(.easeIn(duration:0.6)) {
                    isVisible = true
                }
            }
        }
    }
    
    
    ///
    public struct MessageInputView<Icons: View , SendButtons: View>: View {
        @State private var message: String = ""
        var sendMessage: (String) -> Void
        private let textFieldIconsView: Icons
        private let sendButtonView: SendButtons
        
        public init( sendMessage: @escaping (String) -> Void, @ViewBuilder textFieldIconsView: () -> Icons, @ViewBuilder sendButtonView: () -> SendButtons) {
            self.sendMessage = sendMessage
            self.textFieldIconsView = textFieldIconsView()
            self.sendButtonView = sendButtonView()
        }
        
        public var body: some View {
            HStack {
                ZStack(alignment: .trailing) {
                    
                    TextField("Type a message...", text: $message)
                        .padding(.trailing, 80)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    
                    
                    
                    if textFieldIconsView is EmptyView {
                        defaultIconsView
                    } else {
                        textFieldIconsView
                    }
                    
                    
                }.padding([.leading,.trailing],10)
                
                
                if !message.isEmpty {
                    Button(action: {
                        sendMessage(message)
                        message = ""
                    }) {
                        if sendButtonView is EmptyView {
                            defaultSendButton
                        } else {
                            sendButtonView
                        }}
                    .transition(.opacity)
                    .animation(.easeInOut, value: message)
                    .padding(.trailing, 10)
                }
            }
            .padding(.vertical, 10)
        }
        
        
        var defaultIconsView: some View {
            HStack {
                Button(action: {
                    print("Emoji button tapped")
                }) {
                    Image(systemName: "face.smiling")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
                
                Button(action: {
                    
                    print("Attachment button tapped")
                }) {
                    Image(systemName: "paperclip")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
            }
            .frame(width: 80)
        }
        
        
        var defaultSendButton: some View {
            Image(systemName: "paperplane.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(.blue)
                .padding(10)
                .background(Color.blue.opacity(0.1))
                .clipShape(Circle())
        }
        
    }
}





#Preview {
    ContentView()
}
