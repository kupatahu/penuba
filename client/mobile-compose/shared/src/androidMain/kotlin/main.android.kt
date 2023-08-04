import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import com.google.accompanist.systemuicontroller.rememberSystemUiController

@Composable fun MainView() {
    val systemUiController = rememberSystemUiController()

    systemUiController.setNavigationBarColor(Color.White)
    systemUiController.setStatusBarColor(Color.White)
    App()
}
