import SwiftUI
import ContactsUI

struct ContactsView: View {
    @State private var allContacts = [CNContact]()
    @State private var showingContactsPicker = false

    var body: some View {
        NavigationStack {
            List(allContacts) { contact in
                Text("Say hello to \(contact.givenName)")
            }
            .toolbar {
                Button("Select Contacts", systemImage: "person.crop.circle.badge.plus") {
                    showingContactsPicker.toggle()
                }
            }
            .contactAccessPicker(isPresented: $showingContactsPicker) { results in
                fetchContacts(with: results)
            }
        }
    }

    func fetchContacts(with newIdentifiers: [String]) {
        Task {
            // Create an array of all identifiers, old and new
            let existingIdentifiers = allContacts.map(\.identifier)
            let allIdentifiers = existingIdentifiers + newIdentifiers

            let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
            let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
            fetchRequest.predicate = CNContact.predicateForContacts(withIdentifiers: allIdentifiers)
            var newContacts = [CNContact]()

            try CNContactStore().enumerateContacts(with: fetchRequest) { contact, _ in
                newContacts.append(contact)
            }

            allContacts = newContacts
        }
    }
}
