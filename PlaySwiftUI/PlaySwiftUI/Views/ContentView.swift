import SwiftUI

struct ContentView: View {
    @State var isNavigationBarHidden = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        NavigationLink(
                            destination: MyList(isNavigationBarHidden: $isNavigationBarHidden),
                            label: {
                                Image(systemName: "line.horizontal.3")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                            })
                        Spacer()
                        NavigationLink(
                            destination: MyProfileView(isNavigationBarHidden: $isNavigationBarHidden),
                            label: {
                                Image(systemName: "person.crop.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                            })
                    }
                    .padding(20)
                    Text("zdo 할일목록")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                    ScrollView {
                        VStack {
                            MyProjectCard()
                            MyBasicCard()
                            MyCard(icon: "tray.fill", title: "정리하기", start: "10시", end: "11시", backgroundColor: .blue)
                            MyCard(icon: "tray.fill", title: "정리하기", start: "10시", end: "11시", backgroundColor: .secondary)
                            MyCard(icon: "tray.fill", title: "정리하기", start: "10시", end: "11시", backgroundColor: .black)
                        }
                        .padding()
                    }
                }
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    )
                    .padding(10)
                    .shadow(radius: 20)
            }
            .navigationBarTitle("뒤로가기")
            .navigationBarHidden(isNavigationBarHidden)
            .onAppear() {
                isNavigationBarHidden = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
