import SwiftUI
import Combine

struct ModelData: View {
    @StateObject var book = Book()
    @State private var isOn = true
    
    var body: some View {
        VStack {
            BookView(book: book)
            Button {
                book.title = "abc"
            } label: {
                Text("Tooggle")
            }

        }
    }
}

class Book: ObservableObject {
    @Published var title = "Great Expectations"
}

struct BookView: View {
    @ObservedObject var book: Book
    
    var body: some View {
        Text(book.title)
    }
}

struct ModelData_Previews: PreviewProvider {
    static var previews: some View {
        ModelData()
    }
}
