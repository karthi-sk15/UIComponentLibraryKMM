package com.example.uicomponentlibrarykmm.android.helper

object BubblesHelper {

    fun isImageMessage(message: String): Boolean {
        return message.endsWith(".png", ignoreCase = true) ||
                message.endsWith(".jpg", ignoreCase = true) ||
                message.endsWith(".jpeg", ignoreCase = true) ||
                message.endsWith(".gif", ignoreCase = true)
    }

    fun isPdfMessage(message: String): Boolean {
        return message.endsWith(".pdf", ignoreCase = true)
    }

    fun isDocxMessage(message: String): Boolean {
        return message.endsWith(".docx", ignoreCase = true)
    }

    fun isOnlineImage(message: String): Boolean {
        return message.startsWith("http://", ignoreCase = true) ||
                message.startsWith("https://", ignoreCase = true)
    }
}