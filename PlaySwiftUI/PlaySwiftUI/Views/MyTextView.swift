import SwiftUI

struct MyTextView: View {
    @State private var index = 0
    
    @Binding var isActivated: Bool
    
    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    
    // 배경색 배열 준비
    private let backgroundColors: [Color] = [.red, .yellow, .blue, .green, .orange]
    
    var body: some View {
        VStack {
            Spacer()
            Text("배경 아이템 인덱스 \(index)")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: 100, alignment: .center)
            Text("활성화 상태: \(String(isActivated))")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(isActivated ? Color.yellow : Color.gray)
                .background(Color.black)
            Spacer()
        }
        .background(backgroundColors[index])
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("배경 아이템이 클릭되었다.")
            index += 1
            if index >= backgroundColors.count {
                index = 0
            }
        }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
