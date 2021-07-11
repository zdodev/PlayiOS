import SwiftUI

// View 프로토콜을 채택
struct ContentView: View {
    let carStack = HStack {
        Text("Car Image")
        Image(systemName: "car.fill")
    }
    
    var body: some View {
        Button(action:
            tappedButton, label: {
            Text("Button")
        })
    }
    
    private func tappedButton() {
        print("Button")
    }
}

struct MyHStackView: View {
    var body: some View {
        HStack {
            Text("myHStackView 1")
            Text("myHStackView 2")
        }
    }
}

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(Color.white)
            .border(Color.gray, width: 0.2)
            .shadow(color: .black, radius: 5, x: 0, y: 5)
    }
}

struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(.blue)
    }
}

extension View {
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
}

// PreviewProvider 프로토콜을 채택
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
