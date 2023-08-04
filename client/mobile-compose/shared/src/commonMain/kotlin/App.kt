import androidx.compose.animation.slideInHorizontally
import androidx.compose.animation.slideOutHorizontally
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import moe.tlaster.precompose.navigation.NavHost
import moe.tlaster.precompose.navigation.SwipeProperties
import moe.tlaster.precompose.navigation.rememberNavigator
import moe.tlaster.precompose.navigation.transition.NavTransition
import trip.TripRoute

@Composable
fun App() {
    val navigator = rememberNavigator()
    val navTransition = remember {
        NavTransition(
            createTransition = slideInHorizontally { it },
            destroyTransition = slideOutHorizontally { it },
            pauseTransition = slideOutHorizontally { -it / 4 },
            resumeTransition = slideInHorizontally { -it / 4 },
            exitTargetContentZIndex = 1f
        )
    }

    NavHost(
        navigator = navigator,
        initialRoute = TripRoute.root,
        navTransition = navTransition,
        swipeProperties = SwipeProperties()
    ) {
        group(
            route = TripRoute.root,
            initialRoute = TripRoute.list,
            content = TripRoute.route(navigator)
        )
    }
}