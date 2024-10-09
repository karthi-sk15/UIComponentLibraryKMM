package com.example.uicomponentlibrarykmm.android

import android.net.Uri
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.compose.setContent
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Bookmark
import androidx.compose.material3.Button
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import coil.compose.rememberAsyncImagePainter
import com.example.uicomponentlibrarykmm.android.model.Conversation
import com.example.uicomponentlibrarykmm.android.model.conversations
import com.example.uicomponentlibrarykmm.android.theme.MyApplicationTheme
import com.example.uicomponentlibrarykmm.android.view.ChatMessage
import com.example.uicomponentlibrarykmm.android.view.UserListTile

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyApplicationTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    Column(modifier = Modifier.fillMaxSize()) {

                        ChatMessage.ChatAppBar(
                            userName = "Stephen Fernando",
                            onlineStatus = "Online Now",
                            profileImageUrl = "https://randomuser.me/api/portraits/women/2.jpg", // Replace with a real image URL
                            onBackClick = { /* Handle back button click */ },
                            onCallClick = { /* Handle call button click */ },
                            onVideoCallClick = { /* Handle video call button click */ },
//                            videoIconContent = {
//                                Icon(
//                                    imageVector = Icons.Default.ShoppingCart,
//                                    contentDescription = "Video Call",
//                                    tint = Color.Blue
//                                )
//                            },
//                            callIconContent = {
//                                Icon(
//                                    imageVector = Icons.Default.Call,
//                                    contentDescription = "Call"
//                                )
//                            }
                        )

                        ChatMessage.Bubbles(
                            message = "Default colors!",
                            isCurrentUser = true,
                        )
                        ChatMessage.Bubbles(
                            message = "Default colorsfvehbvhekehbebvhknvernrebebebjkrvbrjbbjerkberkrb",
                            isCurrentUser = false, backgroundColor = Color.Magenta,
                            paddingRight = 30.dp
                        )

                        val onSendMessage: (String) -> Unit = { message ->
                            println("Message sent: $message")
                        }

                        val onValueChange: (String) -> Unit = { message ->
                            println("onValueChange: $message")

                        }

                        ChatMessage.MessageInputAndButtonBar(
                            onSendMessage = onSendMessage,
                            onValueChange = onValueChange,
                        )
                        UserListTile.ConversationItem(
                            conversation = conversations[0],
//                            timeBottomContent =
//                            {
//                                if (!conversations[1].isOnline) {
//                                    Icon(
//                                        imageVector = Icons.Filled.Bookmark,
//                                        contentDescription = "Pinned",
//                                        modifier = Modifier.size(24.dp)
//                                    )
//                                }
//                            },
                            modifier = Modifier.background(Color.White)
                        )


                        ImageUploadScreen( onImageSelected = {})


                        ConversationListScreen(
                            conversations = conversations,
                            onConversationClick = {

                            },
                        )


                    }
                }
            }
        }
    }
}


@Composable
fun ConversationListScreen(
    conversations: List<Conversation>,
    onConversationClick: (Conversation) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize()
    ) {
        items(conversations) { conversation ->
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .background(color = Color.White)
                    .clickable(onClick = { onConversationClick(conversation) }),

                ) {

                UserListTile.ConversationItem(
                    conversation = conversation,
                    timeBottomContent =
                    {
                        if (!conversation.isOnline) {
                            Icon(
                                imageVector = Icons.Filled.Bookmark,
                                contentDescription = "Pinned",
                                modifier = Modifier.size(24.dp)
                            )
                        }
                    }
                )
                HorizontalDivider()
            }

        }
    }
}



@Composable
fun ImageUploadScreen(
    onImageSelected: (Uri) -> Unit
) {
    var selectedImageUri by remember { mutableStateOf<Uri?>(null) }
    val getContent = rememberLauncherForActivityResult(ActivityResultContracts.GetContent()) { uri: Uri? ->
        uri?.let {
            selectedImageUri = it
        }
    }

    Column {
        Button(
            onClick = { getContent.launch("image/*") },
            content = { Text("Select Image") }
        )

        selectedImageUri?.let { uri ->
            // Display the selected image
            Image(
                painter = rememberAsyncImagePainter(uri),
                contentDescription = null,
                modifier = Modifier.fillMaxSize()
            )

            Button(
                onClick = { onImageSelected(uri) },
                content = { Text("Upload Image") }
            )
        }
    }
}