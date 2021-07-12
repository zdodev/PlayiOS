import SwiftUI

struct MyTextView: View {
    @State private var index = 0
    
    // 배경색 배열 준비
    private let backgroundColors: [Color] = [.red, .yellow, .blue, .green, .orange]
    
    var body: some View {
        VStack {
            Spacer()
            Text("배경 아이템 인덱스 \(index)")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
            Spacer()
        }
        .background(backgroundColors[index])
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("배경 아이템이 클릭되었다.")
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                index += 1
                if index >= backgroundColors.count {
                    index = 0
                }
            }
        }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
