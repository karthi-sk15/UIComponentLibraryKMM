//
//  DateHelper.swift
//  iosApp
//
//  Created by Karthikeyan on 24/09/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation

struct DateHelper {
    
    /// Determines if the date should be shown before the current message.
    /// - Parameters:
    ///   - messages: The list of messages.
    ///   - index: The current message index.
    /// - Returns: A Boolean indicating whether the date should be shown.
    static func shouldShowDate(for messages: [ChatConversionModel], at index: Int) -> Bool {
        if index == 0 { return true } // Always show the date for the first message
        let previousMessage = messages[index - 1]
        let currentMessage = messages[index]
        
        // Show date if the current message is on a different day than the previous one
        return !Calendar.current.isDate(previousMessage.timestamp, inSameDayAs: currentMessage.timestamp)
    }
}
