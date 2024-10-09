package com.example.uicomponentlibrarykmm.android.model


open class ConversationListTileDT(
    var userName: String,
    var lastMessage: String,
    var time: String,
    var isOnline: Boolean,
    var isGroup: Boolean
)


class Conversation(
    userName: String,
    lastMessage: String,
    time: String,
    isOnline: Boolean,
    isGroup: Boolean
) : ConversationListTileDT(userName, lastMessage, time, isOnline, isGroup)


val conversations = listOf(
    Conversation("Alice", "Hey, how are you?", "10:30 AM", true, false),
    Conversation("Bob", "Let’s catch up later!", "9:15 AM", false, false),
    Conversation("Charlie", "Meeting at 3 PM.", "Yesterday", true, false),
    Conversation("Diana", "Can you send the report?", "8:45 AM", false, false),
    Conversation("Eve", "Great job on the presentation!", "Yesterday", true, false),
    Conversation("Frank", "Lunch at 1 PM?", "Tuesday", false, false),
    Conversation("Grace", "I’ll call you in 5 minutes.", "7:30 AM", true, false),
    Conversation("Hank", "Happy birthday!", "Monday", false, false),
    Conversation("Ivy", "Let’s meet next week.", "Last week", true, false),
    Conversation("Jack", "I’m running late.", "Friday", false, false),
    Conversation("Karen", "Check your email.", "8:00 AM", true, false),
    Conversation("Leo", "Let’s start the meeting.", "Yesterday", false, false),
    Conversation("Mona", "Can you review the document?", "5:45 PM", true, false),
    Conversation("Nick", "See you tomorrow!", "2:15 PM", false, false),
    Conversation("Olivia", "I'll handle the task.", "10:00 AM", true, false),
    Conversation("Paul", "Where are you?", "11:45 AM", false, false),
    Conversation("Quincy", "I’m available now.", "Yesterday", true, false),
    Conversation("Rachel", "We’re on schedule.", "3:30 PM", false, false),
    Conversation("Steve", "I’ll be there soon.", "1:00 PM", true, false),
    Conversation("Tina", "Thanks for the help!", "Yesterday", false, false),
    Conversation("Uma", "Let’s finalize the plan.", "11:00 AM", true, true),
    Conversation("Victor", "I'll see you later.", "10:10 AM", false, false),
    Conversation("Wendy", "Just finished the report.", "2:50 PM", true, false),
    Conversation("Xavier", "Check out the new features.", "1:45 PM", false, false),
    Conversation("Yvonne", "I’m on my way.", "Yesterday", true, false),
    Conversation("Zack", "We need to talk.", "9:00 AM", false, false),
    Conversation("Aaron", "I’ll update you soon.", "Last week", true, false),
    Conversation("Bella", "The event was great!", "8:30 AM", false, false),
    Conversation("Caleb", "Let me know if you need anything.", "2:00 PM", true, false),
    Conversation("Daisy", "Let’s reschedule.", "7:15 PM", false, true),
    Conversation("Ethan", "I sent the files.", "12:45 PM", true, false),
    Conversation("Fiona", "Meeting postponed to tomorrow.", "Yesterday", false, false),
    Conversation("George", "I’ll check on that.", "3:45 PM", true, false),
    Conversation("Holly", "Thank you for your feedback.", "Yesterday", false, false),
    Conversation("Ian", "I’m working on it.", "4:30 PM", true, true),
    Conversation("Jill", "When can we meet?", "10:50 AM", false, false),
    Conversation("Kyle", "I’m heading out now.", "Yesterday", true, false),
    Conversation("Laura", "Can we discuss later?", "11:10 AM", false, false),
    Conversation("Matt", "All tasks are completed.", "5:00 PM", true, false),
    Conversation("Nina", "Do you need help with anything?", "9:35 AM", false, false),
    Conversation("Oscar", "I’ll follow up with you.", "10:05 AM", true, true),
    Conversation("Pam", "The project is on track.", "8:50 AM", false, false),
    Conversation("Quinn", "Let’s do lunch tomorrow.", "Yesterday", true, false),
    Conversation("Rita", "I’m reviewing the document now.", "1:40 PM", false, false),
    Conversation("Sam", "How was your weekend?", "4:15 PM", true, false),
    Conversation("Terry", "I’ll join the call.", "12:20 PM", false, false),
    Conversation("Uma", "Please send me the details.", "10:20 AM", true, false),
    Conversation("Victor", "Everything is set.", "Yesterday", false, false)
)