package component

import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.runtime.Composable
import androidx.compose.runtime.NonRestartableComposable

@get:Composable
@get:NonRestartableComposable
expect val WindowInsets.Companion.statusBars : WindowInsets