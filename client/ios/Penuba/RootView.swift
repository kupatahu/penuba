import ComposableArchitecture
import SwiftUI

struct RootView: View {
    let store: StoreOf<RootDomain>
    
    var body: some View {
        ContactsView(
            store: self.store.scope(state: \.contacts, action: { .contacts($0) })
        )
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(
            store: Store(initialState: RootDomain.State()) {
                RootDomain()
            }
        )
    }
}
