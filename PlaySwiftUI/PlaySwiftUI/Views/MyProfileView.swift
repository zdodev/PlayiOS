import SwiftUI

struct MyProfileView: View {
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        ScrollView {
            VStack {
                MyCircleImageView()
                    .padding(.vertical, 20)
                
                Text("zdodev")
                    .font(.system(size: 30))
                    .fontWeight(.black)
                
                Spacer()
                    .frame(height: 20)
                
                HStack {
                    Text("SwiftUI")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(20)
                    Text("UIKit")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                }
            }
        }
        .navigationBarTitle(Text("내 프로필"))
        .onAppear {
            isNavigationBarHidden = false
        }
//        .navigationBarItems(trailing: NavigationLink(
//                                destination: Text("설정 화면입니다.")
//                                    .font(.largeTitle)
//                                    .fontWeight(.black),
//                                label: {
//                                    Image(systemName: "gear")
//                                        .font(.system(.largeTitle))
//                                        .foregroundColor(.black)
//                                }))
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
