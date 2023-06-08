struct HeaderItem: Hashable {
    var title: String
    var items: [Item]
}

//var todoHeaderItem = [
//    HeaderItem(title: "todo", items: [
//        Item(title: "나는 최고다.", description: "정말 최고다.", date: "2021-01-01"),
//        Item(title: "너는 최고다.", description: "너무 최고다.", date: "2021-01-01"),
//        Item(title: "우리는 최고다.", description: "진짜 최고다.", date: "2021-01-01"),
//    ])
//]

var doingHeaderItem = [
    HeaderItem(title: "doing", items: [
        Item(title: "나는 최고다.", description: "정말 최고다.", date: "2021-01-01"),
        Item(title: "너는 최고다.", description: "너무 최고다.", date: "2021-01-01"),
        Item(title: "우리는 최고다.", description: "진짜 최고다.", date: "2021-01-01"),
        Item(title: "전설의 시작.", description: "zdo", date: "2021-01-01"),
    ])
]

var doneHeaderItem = [
    HeaderItem(title: "done", items: [
        Item(title: "나는 최고다.", description: "정말 최고다.", date: "2021-01-01"),
        Item(title: "너는 최고다.", description: "너무 최고다.", date: "2021-01-01"),
        Item(title: "우리는 최고다.", description: "진짜 최고다.", date: "2021-01-01"),
        Item(title: "전설의 시작.", description: "zdo", date: "2021-01-01"),
        Item(title: "Let's get it!", description: "😎", date: "2021-01-01"),
    ])
]
