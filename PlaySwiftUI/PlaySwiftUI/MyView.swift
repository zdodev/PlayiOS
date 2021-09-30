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
            List {
                ForEach(items, id: \.self) { item in
                    Text(item.name)
                }
                .onDelete { indexSet in
                    items.remove(atOffsets: indexSet)
                }
                .onMove { source, destination in
                    items.move(fromOffsets: source, toOffset: destination)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle(Text("Title"))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
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

struct Item: Identifiable, Hashable {
    let id = UUID()
    var name: String
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}

