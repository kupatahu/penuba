package trip

import androidx.compose.material.Icon
import androidx.compose.material.IconButton
import androidx.compose.material.Scaffold
import androidx.compose.material.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.runtime.Composable
import component.ExtendedTopAppBar
import moe.tlaster.precompose.navigation.Navigator

@Composable
fun TripCreationScreen(navigator: Navigator) {
    Scaffold(
        topBar = {
            ExtendedTopAppBar(
                title = { Text("Create New Trip") },
                navigationIcon = {
                    IconButton(onClick = { navigator.goBack() }) {
                        Icon(Icons.Filled.ArrowBack, "backIcon")
                    }
                },
            )
        },
    ) {}
}