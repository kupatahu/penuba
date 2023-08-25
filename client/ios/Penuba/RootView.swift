import ComposableArchitecture
import SwiftUI

struct RootView: View {
    var body: some View {
        ContactsView(
            store: Store(initialState: ContactsDomain.State()) {
                ContactsDomain()
            }
        )
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
