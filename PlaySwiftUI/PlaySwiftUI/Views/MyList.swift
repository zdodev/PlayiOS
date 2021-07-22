import SwiftUI

struct MyList: View {
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        if #available(iOS 14.0, *) {
            
        } else {
            UITableView.appearance().tableFooterView = UIView()
        }
        
        UITableView.appearance().separatorStyle = .none
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        List {
            Section(header: Text("오늘 할 일")
                        .font(.headline)
                        .foregroundColor(.black), footer: Text("Footer")) {
                ForEach(1...3, id: \.self) { itemIndex in
                    MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", backgroundColor: .green)
                }
            }
            .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            Section(header: Text("내일 할 일")
                        .font(.headline)
                        .foregroundColor(.black),
                    footer: Text("Footer")) {
                ForEach(1...10, id: \.self) { itemIndex in
                    MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", backgroundColor: .blue)
                }
            }
            .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .listRowBackground(Color.yellow)
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("내 목록")
        .onAppear() {
            isNavigationBarHidden = false
        }
    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
