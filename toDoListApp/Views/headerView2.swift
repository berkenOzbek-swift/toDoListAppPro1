import SwiftUI

struct headerView2: View {
    @State var title = ""
    @State var secondTitle = ""
    @State var angle: Double
    @State private var animationStart = false
    
    var body: some View {
        ZStack{
            Image(ImageResource.toDoListBack2) // <-- Set your image name here
                .aspectRatio(contentMode: .fill)
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.black.opacity(0.4)) // Add opacity to the background
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                    .opacity(animationStart ? 1.0 : 0.0)
                    .scaleEffect(animationStart ? 1.0 : 0.2)
                    .animation(.easeInOut(duration: 0.5))
                
                Text(secondTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
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
        headerView(title: "To Do List", secondTitle: "Getting Around Here", angle: 10)
    }
}
