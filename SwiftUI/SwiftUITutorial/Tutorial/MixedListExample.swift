import SwiftUI

// 동적인 사용자 정의 카테고리 (데이터 모델)
struct Caregory: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct MixedListExample: View {
    // 선택 가능한 모든 항목을 담을 수 있도록 Hashable 프로토콜을 따르는 AnyHashable 사용
    // 실제로는 enum과 Category를 래핑하는 단일 enum으로 만드는 것이 더 좋습니다.
    @State private var selection: AnyHashable?
    
    let categories: [Caregory] = [
        .init(name: "직장 프로젝트"),
        .init(name: "개인 기록"),
        .init(name: "아이디어 스케치"),
        .init(name: "일기장")
    ]
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                // 1. 정적인 섹션
                Section("주요 섹션") {
                    ForEach(MenuItem.allCases) { item in
                        NavigationLink(value: item) {
                            Label(item.rawValue, systemImage: item.systemIcon)
                        }
                    }
                }
                
                // 2. 동적인 섹션
                Section("사용자 정의 폴더") {
                    ForEach(categories) { category in
                        NavigationLink(value: category) {
                            Label(category.name, systemImage: "folder.fill")
                        }
                    }
                }
            }
            .navigationTitle("노트")
        } detail: {
            if let selection {
                if let item = selection as? MenuItem {
                    DetailView(item: item)
                } else if let category = selection as? Caregory {
                    Text("카테고리: \(category.name)에 대한 상세 내용")
                        .navigationTitle(category.name)
                }
            } else {
                Text("항목을 선택해주세요.")
            }
        }
    }
}
