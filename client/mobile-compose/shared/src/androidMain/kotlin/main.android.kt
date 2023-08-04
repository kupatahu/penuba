import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import com.google.accompanist.systemuicontroller.rememberSystemUiController

@Composable fun MainView() {
    val systemUiController = rememberSystemUiController()
    systemUiController.setNavigationBarColor(color = Color.Transparent, darkIcons = true)
    systemUiController.setStatusBarColor(color = Color.Transparent, darkIcons = true)

    App()
}
