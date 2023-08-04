package component

import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.WindowInsetsSides
import androidx.compose.foundation.layout.only
import androidx.compose.runtime.Composable
import androidx.compose.runtime.NonRestartableComposable
import androidx.compose.ui.unit.Density
import androidx.compose.ui.unit.LayoutDirection
import kotlinx.cinterop.ExperimentalForeignApi
import kotlinx.cinterop.useContents
import platform.CoreGraphics.CGFloat
import platform.UIKit.UIApplication
import platform.UIKit.UIEdgeInsets

actual val WindowInsets.Companion.statusBars: WindowInsets
    @Composable @NonRestartableComposable get() = Insets.only(WindowInsetsSides.Top)

@OptIn(ExperimentalForeignApi::class)
internal object Insets : WindowInsets {

    private val safeAreaInsets by lazy {
        UIApplication.sharedApplication.keyWindow?.safeAreaInsets
    }

    override fun getTop(density: Density): Int = get(density) { it.top }

    override fun getLeft(density: Density, layoutDirection: LayoutDirection): Int =
        get(density) { if (layoutDirection == LayoutDirection.Ltr) it.left else it.right }

    override fun getRight(density: Density, layoutDirection: LayoutDirection): Int =
        get(density) { if (layoutDirection == LayoutDirection.Ltr) it.right else it.left }

    override fun getBottom(density: Density): Int = get(density) { it.bottom }

    private fun get(density: Density, block: (UIEdgeInsets) -> CGFloat): Int {
        return if (safeAreaInsets != null) {
            val topInset = safeAreaInsets?.useContents { block(this) }?.toFloat() ?: 0f
            (topInset * density.density).toInt()
        } else 0
    }
}