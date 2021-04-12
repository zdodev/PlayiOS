struct HeaderItem: Hashable {
    let title: String
    let items: [Item]
}

let headerItem = [
    HeaderItem(title: "todo", items: [
        Item(title: "나는 최고다.", description: "정말 최고다.", date: "2021-01-01"),
        Item(title: "너는 최고다.", description: "너무 최고다.", date: "2021-01-01"),
        Item(title: "우리는 최고다.", description: "진짜 최고다.", date: "2021-01-01"),
    ])
]
