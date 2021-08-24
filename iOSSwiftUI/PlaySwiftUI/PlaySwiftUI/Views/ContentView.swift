import SwiftUI

struct ContentView: View {
    @State var listData = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    
    @State var toggleStatus = true
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Settings")) {
                    Toggle(isOn: $toggleStatus, label: {
                        Text("Allow Notifications")
                    })
                }
                
                Section(header: Text("To Do Tasks")) {
                    ForEach(listData) { item in
                        HStack {
                            NavigationLink(destination: Text(item.task)) {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: { indices, newOffset in
                        listData.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
            }
            .navigationBarTitle(Text("To Do List"))
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        listData.remove(atOffsets: offsets)
    }
}

struct ToDoItem: Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
