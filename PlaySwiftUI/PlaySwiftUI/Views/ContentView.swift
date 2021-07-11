import SwiftUI

// View 프로토콜을 채택
struct ContentView: View {
    @State private var isActivated = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    MyVStack()
                    MyVStack()
                    MyVStack()
                }
                .padding(isActivated ? 50 : 10)
                .background(isActivated ? Color.yellow : Color.black)
                // 탭 제스처 추가
                .onTapGesture {
                    // 애니메이션 효과
                    withAnimation {
                        // Bool 값 토글
                        isActivated.toggle()
                    }
                }
                
                // 내비게이션 버튼
                NavigationLink(destination: MyVStack()) {
                    Text("내비게이션 버튼")
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }.padding(.top, 50)
            }
        }
    }
}

// PreviewProvider 프로토콜을 채택
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
