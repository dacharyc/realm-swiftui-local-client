import SwiftUI
import RealmSwift

/// View a list of all Items in the realm. User can swipe to delete Items.
struct ItemList: View {
    // ObservedResults is a collection of all Item objects in the realm.
    // Deleting objects from the observed collection
    // deletes them from the realm.
    @ObservedResults(Item.self) var items
    
    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    ItemRow(item: item)
                }.onDelete(perform: $items.remove)
            }
            .listStyle(InsetListStyle())
            Spacer()
        }
        .navigationBarTitle("Items", displayMode: .inline)
    }
}
