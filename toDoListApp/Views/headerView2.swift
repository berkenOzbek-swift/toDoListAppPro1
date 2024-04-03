import SwiftUI

struct headerView2: View {
    @State var title = ""
    @State var secondTitle = ""
    @State private var animationStart = false
    
    var body: some View {
        ZStack{
            
            VStack{
                Text(title)
                    .font(.custom("Poppins-Bold", size: 60))                    .foregroundColor(Color.white)
                    .bold()
                    .opacity(animationStart ? 1.0 : 0.0)
                    .scaleEffect(animationStart ? 1.0 : 0.2)
                    .animation(.easeInOut(duration: 0.5))
                
                Text(secondTitle)
                    .font(.custom("Poppins-Bold", size: 30))                    .foregroundColor(Color.white)
                    .opacity(animationStart ? 1.0 : 0.0)
                    .scaleEffect(animationStart ? 1.0 : 0.2)
                    .animation(.easeInOut(duration: 0.5).delay(0.2))
            }
            .padding(.top, 50)
        }
        .frame(width: UIScreen.main.bounds.width, height: 350) // Adjust the frame size according to your needs
        .onAppear {
            self.animationStart.toggle()
        }
    }
}

struct headerView2_Previews: PreviewProvider {
    static var previews: some View {
        headerView2(title: "To Do List", secondTitle: "Getting Around Here")
    }
}
