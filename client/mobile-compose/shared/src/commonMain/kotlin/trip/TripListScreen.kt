package trip

import androidx.compose.foundation.layout.Row
import androidx.compose.material.Icon
import androidx.compose.material.IconButton
import androidx.compose.material.Scaffold
import androidx.compose.material.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.runtime.Composable
import cafe.adriel.voyager.core.screen.Screen
import cafe.adriel.voyager.navigator.LocalNavigator
import cafe.adriel.voyager.navigator.currentOrThrow
import component.ExtendedTopAppBar

class TripListScreen() : Screen {
    @Composable
    override fun Content() {
        val navigator = LocalNavigator.currentOrThrow

        Scaffold(
            topBar = {
                ExtendedTopAppBar(
                    title = { Text("Trips") },
                    actions = {
                        Row {
                            IconButton(onClick = { navigator.push(TripCreationScreen()) }) {
                                Icon(Icons.Filled.Add, "addIcon")
                            }
                        }
                    },
                )
            },
        ) {}
    }
}