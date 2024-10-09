package com.example.uicomponentlibrarykmm

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform