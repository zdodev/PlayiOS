import SwiftUI

// 1. 데이터 모델 정의
enum MenuItem: String, CaseIterable, Identifiable {
    case inbox = "받은 편지함"
    case drafts = "임시 보관함"
    case sent = "보낸 편지함"
    
    var id: String { rawValue }
    
    var systemIcon: String {
        switch self {
        case .inbox:
            return "tray.fill"
        case .drafts:
            return "doc.text.fill"
        case .sent:
            return "paperplane.fill"
        }
    }
}

struct TwoColumnExample: View {
    // 선택된 항목의 상태를 저장합니다.
    @State private var selection = MenuItem.inbox
    
    var body: some View {
        NavigationSplitView {
            List(MenuItem.allCases, selection: $selection) { item in
                NavigationLink(value: item) {
                    Label(
                        item.rawValue,
                        systemImage: item.systemIcon
                    )
                }
            }
            .navigationTitle("메일함")
        } detail: {
            DetailView(item: selection)
        }
    }
}

struct DetailView: View {
    let item: MenuItem
    
    var body: some View {
        VStack {
            Image(systemName: item.systemIcon)
                .font(.largeTitle)
            Text("\(item.rawValue) 내용")
                .font(.title)
            Text("여기는 선택된 \(item.rawValue)의 상세 콘텐츠가 표시됩니다.")
                .padding()
        }
        .navigationTitle(item.rawValue)
    }
}

#Preview {
    TwoColumnExample()
}
