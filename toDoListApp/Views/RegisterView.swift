import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // HEADER
            headerView2(title: "Register", secondTitle: "Start Organizing ToDos",  angle: 0)
                .padding(.bottom, 50)
            
            // Register Tab
            VStack(spacing: 20) {
                TextField("Full Name", text: $viewModel.name)
                    .modifier(CustomTextField())
                
                TextField("Email Address", text: $viewModel.email)
                    .modifier(CustomTextField())
                
                SecureField("Password", text: $viewModel.password)
                    .modifier(CustomTextField())
                
                TLButton(text: "Sign Up", color: .orange) {
                    viewModel.createdUser()
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct CustomTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
            .padding(.horizontal, 15)
    }
}

extension View {
    func customTextFieldStyle() -> some View {
        self.modifier(CustomTextFieldModifier())
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
