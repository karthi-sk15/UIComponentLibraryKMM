package com.example.uicomponentlibrarykmm.android.view

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MissedVideoCall
import androidx.compose.material.icons.filled.AttachFile
import androidx.compose.material.icons.filled.Call
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.material3.TextFieldDefaults
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import coil.compose.rememberAsyncImagePainter
import coil.compose.rememberImagePainter
import com.example.uicomponentlibrarykmm.android.R
import com.example.uicomponentlibrarykmm.android.helper.BubblesHelper


class ChatMessage {

    companion object {

        /**
         * Chat screen Left and Right Message Bubbles
         *
         * With Parameter = isCurrentUser (Left and Right), message , Bubbles (modifier), and BackgroundColor
         **/
        @Composable
        fun Bubbles(
            message: String,
            isCurrentUser: Boolean,
            modifier: Modifier = Modifier,
            textModifier: Modifier = Modifier,
            backgroundColor: Color = Color.Blue,
            paddingRight: Dp = 0.dp,
            paddingLeft: Dp = 0.dp,
            alignment: Alignment = if (isCurrentUser) Alignment.CenterEnd else Alignment.CenterStart
        ) {
            Box(
                modifier = modifier
                    .fillMaxWidth()
                    .padding(4.dp)
                    .padding(end = paddingRight, start = paddingLeft),
                contentAlignment = alignment
            ) {
//                Text(
//                    text = message,
//                    modifier = textModifier
//                        .background(backgroundColor, shape = RoundedCornerShape(12.dp))
//                        .padding(8.dp),
//                    color = Color.White
//                )

                when {
                    BubblesHelper.isImageMessage(message) -> {
                        if (BubblesHelper.isOnlineImage(message)) {
                            // Load Online Image
                            Image(
                                painter = rememberAsyncImagePainter(message),
                                contentDescription = null,
                                modifier = textModifier
                                    .size(150.dp)
                                    .background(backgroundColor, shape = RoundedCornerShape(12.dp))
                                    .padding(8.dp)
                            )
                        } else {
                            // Load Local Image
                            Image(
                                painter = rememberImagePainter(message),
                                contentDescription = null,
                                modifier = textModifier
                                    .size(150.dp)
                                    .background(backgroundColor, shape = RoundedCornerShape(12.dp))
                                    .padding(8.dp)
                            )
                        }
                    }
                    BubblesHelper.isPdfMessage(message) -> {
                        Text(
                            text = "PDF Document",
                            modifier = textModifier
                                .clickable {
                                    // Handle PDF viewing logic
                                }
                                .background(backgroundColor, shape = RoundedCornerShape(12.dp))
                                .padding(8.dp),
                            color = Color.White
                        )
                    }
                    BubblesHelper.isDocxMessage(message) -> {
                        Text(
                            text = "DOCX Document",
                            modifier = textModifier
                                .clickable {
                                    // Handle DOCX viewing logic
                                }
                                .background(backgroundColor, shape = RoundedCornerShape(12.dp))
                                .padding(8.dp),
                            color = Color.White
                        )
                    }
                    else -> {
                        // Default to Text Message
                        Text(
                            text = message,
                            modifier = textModifier
                                .background(backgroundColor, shape = RoundedCornerShape(12.dp))
                                .padding(8.dp),
                            color = Color.White
                        )
                    }
                }
            }
        }

        /**
         * Chat screen TextField and Send Button
         *
         * With Parameter = TextField Value-> SendMessage, TextField CallBack-> onValueChange , Button CallBack -> onSendMessage and Button -> Content
         **/
        @Composable
        fun MessageInputAndButtonBar(
            onValueChange: (String) -> Unit,
            onSendMessage: (String) -> Unit,
            modifier: Modifier = Modifier,
            buttonContent: (@Composable () -> Unit)? = null
        ) {
            var sendMessage by remember { mutableStateOf("") }
            Row(
                modifier = modifier
                    .background(Color.White)
                    .fillMaxWidth()
                    .padding(8.dp),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.Center
            ) {
                TextField(
                    value = sendMessage,
                    onValueChange = { newValue ->
                        sendMessage = newValue
                        onValueChange(newValue)
                    },
                    modifier = Modifier.weight(1f),
                    placeholder = { Text(text = "Type a message") },
                    singleLine = true,
                    shape = RoundedCornerShape(24.dp),
                    colors = TextFieldDefaults.colors(
                        focusedIndicatorColor = Color.Transparent,
                        unfocusedIndicatorColor = Color.Transparent
                    ),
                    leadingIcon = {
                        Image(
                            painter = painterResource(id = R.drawable.icon_happy_smile),
                            contentDescription = "Emoji Icon",
                            modifier = Modifier
                                .size(24.dp)
                                .clickable { /* Handle Emoji click here */ }
                        )
                    },
                    trailingIcon = {
                        Icon(
                            imageVector = Icons.Default.AttachFile, // Use any icon here
                            contentDescription = "Attach Icon",
                            modifier = Modifier
                                .size(24.dp)
                                .clickable { /* Handle Attachment click here */ }
                        )
                    }
                )
                Spacer(modifier = Modifier.width(8.dp))
                Button(
                    onClick = {
                        onSendMessage(sendMessage)
                        sendMessage = ""
                    },
                    enabled = sendMessage.isNotEmpty()
                ) {
                    buttonContent?.invoke() ?: run {
                        Text(text = "Send")
                    }

                }
            }
        }

        /**
         * Chat screen Appbar
         *
         * With Back button , Circular Image , User Name , Online , Call and Video call Buttons
         **/
        @OptIn(ExperimentalMaterial3Api::class)
        @Composable
        fun ChatAppBar(
            userName: String,
            onlineStatus: String,
            profileImageUrl: String,
            onBackClick: () -> Unit,
            callIconContent: (@Composable () -> Unit)? = null,
            onCallClick: () -> Unit,
            videoIconContent: (@Composable () -> Unit)? = null,
            onVideoCallClick: () -> Unit,
        ) {
            TopAppBar(
                navigationIcon = {
                    IconButton(onClick = onBackClick) {
                        Icon(
                            imageVector = Icons.AutoMirrored.Default.ArrowBack,
                            contentDescription = "Back"
                        )
                    }
                },
                title = {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Box(
                            modifier = Modifier
                                .size(40.dp)
                                .background(Color.Gray, CircleShape)
                        ) {
                            Image(
                                painter = rememberAsyncImagePainter(profileImageUrl),
                                contentDescription = "Profile Image",
                                contentScale = ContentScale.Crop,
                                modifier = Modifier
                                    .size(40.dp)
                                    .clip(CircleShape)
                            )
                        }
                        Spacer(modifier = Modifier.width(8.dp))
                        Column(
                            verticalArrangement = Arrangement.Top
                        ) {
                            Text(
                                text = userName,
                                fontWeight = FontWeight.Bold,
                                fontSize = 18.sp,
                                lineHeight = 18.sp
                            )
                            Text(
                                text = onlineStatus,
                                fontWeight = FontWeight.SemiBold,
                                fontSize = 14.sp,
                                color = Color.Gray,
                                lineHeight = 18.sp
                            )
                        }

                    }
                },
                actions = {
                    IconButton(onClick = onCallClick) {
                        callIconContent?.invoke() ?: run {
                            Icon(
                                imageVector = Icons.Default.Call,
                                contentDescription = "Call"
                            )
                        }
                    }
                    IconButton(onClick = onVideoCallClick) {
                        videoIconContent?.invoke() ?: run {
                            Icon(
                                imageVector = Icons.AutoMirrored.Filled.MissedVideoCall,
                                contentDescription = "Video Call",
                            )
                        }
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = Color.White,
                    titleContentColor = Color.Black,
                    navigationIconContentColor = Color.Black,
                    actionIconContentColor = Color.Black
                )
            )
        }
    }
}




