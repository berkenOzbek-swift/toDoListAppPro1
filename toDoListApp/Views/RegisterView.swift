import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            backgroundView()
            // HEADER
            headerView2(title: "Register", secondTitle: "Start Organizing ToDos")
                .padding(.bottom, 50)
            
            // Register Tab
            VStack(spacing: 20) {
                TextField("Full Name", text: $viewModel.name)
                    .padding(.horizontal, 50) // Adjust horizontal padding
                    .overlay(content: {
                        Image("Icon Email")
                            .imageScale(.small)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    })
                    .modifier(CustomTextField())
                
                TextField("Email Address", text: $viewModel.email)
                    .padding(.horizontal, 50) // Adjust horizontal padding
                    .overlay(content: {
                        Image("Icon Email")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    })
                    .modifier(CustomTextField())
                SecureField("Password", text: $viewModel.password)
                    .padding(.horizontal, 50) // Adjust horizontal padding
                    .overlay(content: {
                        Image("Icon Lock")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    })
                    .modifier(CustomTextField())
                
                
                riveButton(text: "Sign Up"){
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
