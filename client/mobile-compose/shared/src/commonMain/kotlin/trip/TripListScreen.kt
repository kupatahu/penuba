package trip

import androidx.compose.foundation.layout.Row
import androidx.compose.material.Icon
import androidx.compose.material.IconButton
import androidx.compose.material.Scaffold
import androidx.compose.material.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.runtime.Composable
import component.ExtendedTopAppBar
import moe.tlaster.precompose.navigation.Navigator
import moe.tlaster.precompose.stateholder.LocalStateHolder

@Composable
fun TripListScreen(navigator: Navigator) {
    Scaffold(
        topBar = {
            ExtendedTopAppBar(
                title = { Text("Trips") },
                actions = {
                    Row {
                        IconButton(onClick = { navigator.navigate("/trips/new") }) {
                            Icon(Icons.Filled.Add, "addIcon")
                        }
                    }
                },
            )
        },
    ) {}
}