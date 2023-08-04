import androidx.compose.runtime.Composable
import moe.tlaster.precompose.navigation.NavHost
import moe.tlaster.precompose.navigation.rememberNavigator
import trip.TripCreationScreen
import trip.TripListScreen

@Composable
fun App() {
    val navigator = rememberNavigator()

    NavHost(
        navigator = navigator, initialRoute = "/trips"
    ) {
        scene(
            route = "/trips"
        ) {
            TripListScreen(navigator)
        }
        scene(
            route = "/trips/new"
        ) {
            TripCreationScreen(navigator)
        }
    }
}