import SwiftUI
import Combine

struct MyTextField: View {
    @State private var username = ""
    @State private var isEditing = false
    @State private var nameComponents = PersonNameComponents()
    
    var body: some View {
        VStack {
            TextField("User name (email address)", text: $username) { isEditing in
                self.isEditing = isEditing
            } onCommit: {
                print(username)
            }
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .border(Color(UIColor.separator))
            Divider()
            Text(username)
                .foregroundColor(isEditing ? .red : .blue)
            Divider()
            let nameFormatter = PersonNameComponentsFormatter()
            TextField("Proper name", value: $nameComponents, formatter: nameFormatter, onCommit:  {
                print("onCommit")
            })
            .disableAutocorrection(true)
            .border(Color(UIColor.separator))
            Text(nameComponents.debugDescription)
        }
    }
}

struct MyTextField_Previews: PreviewProvider {
    static var previews: some View {
        MyTextField()
    }
}
