import SwiftUI
import Combine

struct MyView: View {
    @State private var isToggleOn = true
    @State private var items = [
        Item(name: "✨✨✨"),
        Item(name: "🎊🎊🎊"),
        Item(name: "🔥🔥🔥"),
    ]
    
    private var specialStrings = [
        "✨✨✨",
        "🎊🎊🎊",
        "🔥🔥🔥"
    ]
    
    var body: some View {
        NavigationView {
            List(items.indices, id:\.self) { index in
                NavigationLink(destination: DetailView(content: $items[index])) {
                    Text(items[index].name)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle(Text("Title"))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        items.append(Item(name: specialStrings.randomElement()!))
                    } label: {
                        Image(systemName: "plus")
                    }
                    Button {
                        if !items.isEmpty {
                            items.removeLast()
                        }
                    } label: {
                        Image(systemName: "minus")
                            .fixedSize()
                    }
                }
            }
        }
    }
}

struct DetailView: View {
    @Binding var content: Item
    private let specialStrings = [
        "✨✨✨",
        "🎊🎊🎊",
        "🔥🔥🔥"
    ]
    
    var body: some View {
        VStack {
            Text(content.name)
            Button {
                content.name = specialStrings.randomElement()!
            } label: {
                Text("click")
            }
            
        }
    }
}

struct Item: Identifiable {
    let id = UUID()
    var name: String
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}

