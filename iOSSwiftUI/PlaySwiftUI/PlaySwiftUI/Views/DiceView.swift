import SwiftUI

struct DiceView: View {
    @EnvironmentObject var store: AppStore
    
    @State private var shouldRoll = false
    @State private var pressed = false
    
    var diceRollAnimation = Animation.spring()
    
    var body: some View {
        VStack {
            Text(store.state.currentDice)
                .font(.system(size: 300, weight: .bold, design: .monospaced))
                .foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                .rotationEffect(.degrees(shouldRoll ? 360 : 0))
                .animation(diceRollAnimation)
            Button(action: {
                rollTheDice()
            }) {
                Text("랜덤 주사위 굴리기")
                    .fontWeight(.black)
            }
            .buttonStyle(MyButtonStyle())
            .scaleEffect(pressed ? 0.8 : 1.0)
            .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity) { pressing in
                withAnimation(.easeInOut(duration: 0.2)) {
                    pressed = pressing
                }
            } perform: {
                
            }

        }
    }
    
    private func rollTheDice() {
        store.dispatch(action: .rollTheDice)
        shouldRoll.toggle()
        print(#fileID, #function, #line)
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
