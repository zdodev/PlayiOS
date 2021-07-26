import SwiftUI

struct MyCard: View {
    var icon: String
    var title: String
    var start: String
    var end: String
    var backgroundColor: Color
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                    .opacity(0)
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(.white)
                Spacer()
                    .frame(height: 5)
                Text("\(start) - \(end)")
                    .foregroundColor(.white)
            }
        }
        .padding(30)
        .background(backgroundColor)
        .cornerRadius(20)
    }
}

struct MyCard_Previews: PreviewProvider {
    static var previews: some View {
        MyCard(icon: "book.fill", title: "책읽기", start: "1시", end: "3시", backgroundColor: .green)
    }
}
