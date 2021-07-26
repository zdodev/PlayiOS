import SwiftUI

enum Index {
    case one
    case two
    case three
}

struct MyGeometryReaderVStack: View {
    @State var index = Index.one
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Button(action: {
                    print("1번이 클릭되었습니다.")
                    withAnimation {
                        index = .one
                    }
                }) {
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 100, height: geometry.size.height / 3)
                        .padding(.horizontal, index == .one ? 50 : 0)
                        .foregroundColor(.white)
                        .background(Color.red)
                }
                Button(action: {
                    print("2번이 클릭되었습니다.")
                    withAnimation {
                        index = .two
                    }
                }) {
                    Text("2")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 100, height: geometry.size.height / 3)
                        .padding(.horizontal, index == .two ? 50 : 0)
                        .foregroundColor(.white)
                        .background(Color.blue)
                }
                Button(action: {
                    print("3번이 클릭되었습니다.")
                    withAnimation {
                        index = .three
                    }
                }) {
                    Text("3")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 100, height: geometry.size.height / 3)
                        .padding(.horizontal, index == .three ? 50 : 0)
                        .foregroundColor(.white)
                        .background(Color.green)
                }
            }
        }
        .background(Color.yellow)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MyGeometryReaderVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReaderVStack()
    }
}
