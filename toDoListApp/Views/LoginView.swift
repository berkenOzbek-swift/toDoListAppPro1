import SwiftUI
import RiveRuntime

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                backgroundView()
                // HEADER
                headerView2(title: "Bea' Yap", secondTitle: "Getting Around Here", definition: "Organize your tasks efficiently with our intuitive to-do list app.")
                    .padding(.bottom, 50)
                
                // LOGIN Tab
                VStack(spacing: 20) {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                    }
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
                    
                    riveButton(text: "Login") {
                        viewModel.login()
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                .padding()
                
                // Create User
                VStack {
                    Text("New Around Here")
                    NavigationLink(destination: RegisterView()) {
                        Text("Create New Account")
                            .foregroundColor(.pink)
                            .font(.headline)
                   }
                }
                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}

struct CustomTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
            .padding(.horizontal, 15)
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif
