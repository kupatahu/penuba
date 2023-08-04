import androidx.compose.runtime.Composable
import cafe.adriel.voyager.navigator.Navigator
import trip.TripListScreen

@Composable
fun App() {
    Navigator(TripListScreen())
}