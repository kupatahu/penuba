package trip

import moe.tlaster.precompose.navigation.Navigator
import moe.tlaster.precompose.navigation.RouteBuilder

object TripRoute {
    const val root = "/trips"
    const val list = "${root}/all"
    const val create = "${root}/new"

    fun route(navigator: Navigator): (RouteBuilder) -> Unit = {
        it.scene(
            route = list,
            content = { TripListScreen(navigator) }
        )
        it.scene(
            route = create,
            content = { TripCreationScreen(navigator) }
        )

    }
}
