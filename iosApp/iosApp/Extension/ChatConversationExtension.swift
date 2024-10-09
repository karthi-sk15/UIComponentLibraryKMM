//
//  ChatConversationExtension.swift
//  iosApp
//
//  Created by Karthikeyan on 30/09/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation
import SwiftUI

//extension ChatConversationView.ChatTitleDateView  {
//     init(
//         date: Date
//     )where CustomDateView == EmptyView  {
//         self.init(date: date, customView: {EmptyView()})
//     }
//}

///MessageInputView
extension ChatConversationView.MessageInputView {
    init(
        sendMessage: @escaping (
            String
        ) -> Void
    ) where Icons == EmptyView, SendButtons == EmptyView {
        self.init(sendMessage: sendMessage,
                  textFieldIconsView: {
            EmptyView()
        },
                  sendButtonView: {
            EmptyView()
        })
    }
    
    init(
        sendMessage: @escaping (
            String
        ) -> Void,
        textFieldIconsView: @escaping () -> Icons
    ) where SendButtons == EmptyView {
        self.init(
            sendMessage: sendMessage,
            textFieldIconsView: textFieldIconsView,
            sendButtonView: {
                EmptyView()
            })
    }
    
    init(
        sendMessage: @escaping (
            String
        ) -> Void,
        sendButtonView: @escaping () -> SendButtons
    ) where Icons == EmptyView {
        self.init(sendMessage: sendMessage,
                  textFieldIconsView: {
            EmptyView()
        },
                  sendButtonView: sendButtonView)
    }
}


///ChatAppBarView
extension ChatConversationView.ChatAppBarView {
    
    // Default initializer with an EmptyView for userDetailView
    public init(
        user: UserListTileModel,
        @ViewBuilder videoCallView: () -> OnVideoCallView,
        @ViewBuilder onCallView: () -> OnCallView,
        onVideoTap: (() -> Void)? = nil,
        onCallTap: (() -> Void)? = nil
    ) where UserDetailView == EmptyView {
        self.init(
            user: user,
            userDetailView: { EmptyView() },
            videoCallView: videoCallView,
            onCallView: onCallView,
            onVideoTap: onVideoTap,
            onCallTap: onCallTap
        )
    }
    public init(
        @ViewBuilder userDetailView: () -> UserDetailView
    ) where OnVideoCallView == EmptyView, OnCallView == EmptyView{
        self.init(
            userDetailView: userDetailView,
            videoCallView: { EmptyView() },
            onCallView: { EmptyView() }
        )
    }
    // Default initializer with an EmptyView for videoCallView
    public init(
        user: UserListTileModel,
        @ViewBuilder userDetailView: () -> UserDetailView,
        @ViewBuilder onCallView: () -> OnCallView,
        onVideoTap: (() -> Void)? = nil,
        onCallTap: (() -> Void)? = nil
    ) where OnVideoCallView == EmptyView {
        self.init(
            user: user,
            userDetailView: userDetailView,
            videoCallView: { EmptyView() },
            onCallView: onCallView,
            onVideoTap: onVideoTap,
            onCallTap: onCallTap
        )
    }

    // Default initializer with an EmptyView for onCallView
    public init(
        user: UserListTileModel,
        @ViewBuilder userDetailView: () -> UserDetailView,
        @ViewBuilder videoCallView: () -> OnVideoCallView,
        onVideoTap: (() -> Void)? = nil,
        onCallTap: (() -> Void)? = nil
    ) where OnCallView == EmptyView {
        self.init(
            user: user,
            userDetailView: userDetailView,
            videoCallView: videoCallView,
            onCallView: { EmptyView() },
            onVideoTap: onVideoTap,
            onCallTap: onCallTap
        )
    }

    // Default initializer where all views are EmptyView
    public init(
        onVideoTap: (() -> Void)? = nil,
        onCallTap: (() -> Void)? = nil
    ) where UserDetailView == EmptyView, OnVideoCallView == EmptyView, OnCallView == EmptyView {
        self.init(
            userDetailView: { EmptyView() },
            videoCallView: { EmptyView() },
            onCallView: { EmptyView() },
            onVideoTap: onVideoTap,
            onCallTap: onCallTap
        )
    }
    
    // Default initializer for when only user is provided
    public init(
        user: UserListTileModel
    ) where UserDetailView == EmptyView, OnVideoCallView == EmptyView, OnCallView == EmptyView {
        self.init(
            user: user,
            userDetailView: { EmptyView() },
            videoCallView: { EmptyView() },
            onCallView: { EmptyView() },
            onVideoTap: nil,
            onCallTap: nil
        )
    }
}




///MessageBubble
extension ChatConversationView.MessageBubble {
    init(
        message: ChatConversionModel,
        userName: String
    ) where RemoteUser == EmptyView, TextBubbles == EmptyView, CurrentUser == EmptyView {
        self.init(message: message,
                  userName: userName,
                  remoteUserTimeView: {
            EmptyView()
        },
                  textBubbles: {
            EmptyView()
        },
                  currentUserTickView: {
            EmptyView()
        })
    }
    
    init(
        message: ChatConversionModel,
        userName: String,
        @ViewBuilder remoteUserTimeView: () -> RemoteUser
    ) where TextBubbles == EmptyView, CurrentUser == EmptyView {
        self.init(message: message,
                  userName: userName,
                  remoteUserTimeView: remoteUserTimeView,
                  textBubbles: {
            EmptyView()
        },
                  currentUserTickView: {
            EmptyView()
        })
    }
    
    init(
        message: ChatConversionModel,
        userName: String,
        @ViewBuilder textBubbles: () -> TextBubbles
    ) where RemoteUser == EmptyView, CurrentUser == EmptyView  {
        self.init(message: message,
                  userName: userName,
                  remoteUserTimeView: {
            EmptyView()
        },
                  textBubbles:textBubbles ,
                  currentUserTickView: {
            EmptyView()
        })
    }
    init(
        message: ChatConversionModel,
        userName: String,
        @ViewBuilder currentUserTickView: () -> CurrentUser
    ) where RemoteUser == EmptyView, TextBubbles == EmptyView  {
        self.init(message: message,
                  userName: userName,
                  remoteUserTimeView: {
            EmptyView()
        },
                  textBubbles:{
            EmptyView()
        } ,
                  currentUserTickView: currentUserTickView)
    }
}

