package component

import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.statusBars
import androidx.compose.runtime.Composable
import androidx.compose.runtime.NonRestartableComposable

actual val WindowInsets.Companion.statusBar: WindowInsets
    @Composable
    @NonRestartableComposable
    get() = statusBars