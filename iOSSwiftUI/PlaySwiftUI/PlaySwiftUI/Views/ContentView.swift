import SwiftUI

struct ContentView: View {
    let store = AppStore(state: AppState(currentDice: "⚀"), reducer: appReducer)
    
    var body: some View {
        DiceView()
            .environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
