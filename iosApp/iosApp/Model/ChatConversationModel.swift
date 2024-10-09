//
//  ChatConversationModel.swift
//  iosApp
//
//  Created by Karthikeyan on 24/09/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation


public struct ChatConversionModel: Identifiable {
    public let id : UUID
    public let senderName: String
    public let text: String
    public let timestamp: Date
    public let isOwnMessage: Bool
    public let isRead: Bool
    public let messageType: MessageType
    
    init(id: UUID = UUID(), senderName: String, text: String, timestamp: Date = Date(), isOwnMessage: Bool, isRead: Bool = false, messageType: MessageType = .text) {
        self.id = id
        self.senderName = senderName
        self.text = text
        self.timestamp = timestamp
        self.isOwnMessage = isOwnMessage
        self.isRead = isRead
        self.messageType = messageType
    }
}

public enum MessageType {
      case text
      case image
      case video
      case audio
      case file
}


public let sampleMessages: [ChatConversionModel] = [
    ChatConversionModel(senderName: "Alice", text: "Hey, how's it going?", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Pretty good! What about you?", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "I'm doing great, just got back from a trip.", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Nice! Where did you go?", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Went hiking in the mountains.", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "That sounds amazing!", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Yeah, it was refreshing. You should try it sometime.", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "I definitely will.", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "So, what are you up to?", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Just working on some SwiftUI projects.", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Cool! Learning anything new?", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Yeah, been diving into animations and gestures.", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "That sounds interesting! Gestures are fun to implement.", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Absolutely! Adds a lot of interactivity.", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Have you tried combining animations with gestures?", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Yes, it's a bit challenging but very rewarding.", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "For sure! What project are you working on?", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Building a custom chat interface, actually.", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "That’s awesome! Need any help?", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Thanks! I'm doing fine, but I'll reach out if I do.", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Alright, anytime!", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Appreciate it!",timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "What’s the most challenging part so far?", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Probably getting the message bubbles just right.", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Yeah, styling can be tricky. Consistency is key.", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Exactly! Been tweaking the design for a while.", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "You'll nail it! Just keep at it.", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Thanks for the motivation!", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Anytime! By the way, did you see the new SwiftUI update?", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Yeah, it’s got some cool new features!", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "I know, right? The new modifiers are pretty handy.", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Agreed! Makes life easier.", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Have you used the new `ScrollView` features?", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Not yet, but I plan to. Have you?", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Yes, they’re really useful for chat UIs.", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "I’ll definitely check them out.", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Do! It’s worth it.", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Will do, thanks for the tip!", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "No problem! Happy coding!", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "You too!", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Got to run now, talk later!", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Sure thing, take care!", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "You too, bye!", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Bye!", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Hey, back again!", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Welcome back! What’s up?", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "Just wanted to share a cool SwiftUI trick I learned.", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "I’m all ears!", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "So, have you tried animating gradients?", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "Not yet, but I’ve seen some examples.", isOwnMessage: true),
    ChatConversionModel(senderName: "Alice", text: "It’s super easy and looks amazing!", isOwnMessage: false),
    ChatConversionModel(senderName: "You", text: "I’ll have to try that out.", isOwnMessage: true)
]


