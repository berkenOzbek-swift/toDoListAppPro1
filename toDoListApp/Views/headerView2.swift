import SwiftUI

struct headerView2: View {
    @State var title = ""
    @State var secondTitle = ""
    @State var definition = ""
    @State private var animationStart = false
    
    var body: some View {
        ZStack{
            
            VStack{
                Spacer()
                Text(title)
                    .customFont(.title, size: 60)
                    .foregroundColor(Color.white)
                    .bold()
                    .opacity(animationStart ? 1.0 : 0.0)
                    .scaleEffect(animationStart ? 1.0 : 0.2)
                    .animation(.easeInOut(duration: 0.5))
                
                Text(secondTitle)
                    .customFont(.body, size: 30)
                    .bold()
                    .foregroundColor(Color.white)
                    .opacity(animationStart ? 1.0 : 0.0)
                    .scaleEffect(animationStart ? 1.0 : 0.2)
                    .animation(.easeInOut(duration: 0.5).delay(0.2))
                    Spacer()
                Text(definition)
                    .customFont(.body, size: 20)
                    .foregroundColor(Color.white)
                    .opacity(animationStart ? 1.0 : 0.0)
                    .scaleEffect(animationStart ? 1.0 : 0.2)
                    .animation(.easeInOut(duration: 0.5).delay(0.2))
                    .padding(40)

            }
            .padding(.top, 50)
        }
        .frame(width: UIScreen.main.bounds.width, height: 350) // Adjust the frame size according to your needs
        .onAppear() {
            self.animationStart.toggle()
        }
    }
}

struct headerView2_Previews: PreviewProvider {
    static var previews: some View {
        headerView2(title: "To Do List", secondTitle: "Getting Around Here", definition: "Organize your tasks efficiently with our intuitive to-do list app.")
    }
}
