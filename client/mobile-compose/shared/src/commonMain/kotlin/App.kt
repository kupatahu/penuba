import androidx.compose.animation.ExperimentalAnimationApi
import androidx.compose.runtime.Composable
import cafe.adriel.voyager.navigator.Navigator
import cafe.adriel.voyager.transitions.SlideTransition
import trip.TripListScreen

@OptIn(ExperimentalAnimationApi::class)
@Composable
fun App() {
    Navigator(TripListScreen()) {
        SlideTransition(it)
    }
}