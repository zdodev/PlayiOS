import SwiftUI

struct MyVStack: View {
    // 데이터를 연동
    @Binding var isActivated: Bool
    
    // 이니셜라이저
    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    
    var body: some View {
        VStack {
            Text("1!")
                .fontWeight(.bold)
                .font(.system(size: 80))
            Text("2!")
                .fontWeight(.bold)
                .font(.system(size: 80))
            Text("3!")
                .fontWeight(.bold)
                .font(.system(size: 80))
        }
        .background(isActivated ? Color.green : Color.red)
        .padding(isActivated ? 10 : 0)
    }
}

struct MyVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyVStack()
    }
}
