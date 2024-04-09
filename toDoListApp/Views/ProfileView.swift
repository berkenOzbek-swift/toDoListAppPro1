//
//  ProfileView.swift
//  toDoListApp
//
//  Created by Berken Özbek on 19.03.2024.
//
import FirebaseFirestore
import FirebaseAuth
import SwiftUI
import UIKit

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    
    var body: some View {
        NavigationView {
            VStack{
                backgroundView()
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading User....")
                }
             }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
        .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $selectedImage)
               
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar Image
        if let selectedImage = selectedImage {
            Image(uiImage: selectedImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 125, height: 125)
                .padding()
                .onTapGesture {
                    isShowingImagePicker = true
                }
        } else {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(width: 125, height: 125)
                .padding()
                .onTapGesture {
                    isShowingImagePicker = true
                }
        }
        VStack(alignment: .leading) {
         HStack {
             Text("Name: ")
                 .bold()
                 .foregroundColor(.red)
             Text(user.name)
                 .bold()
         }
         .padding(.top, 1)
         HStack {
             Text("Email: ")
                 .bold()
                 .foregroundColor(.red)
             Text(user.email)
                 .bold()
         }
         .padding(.top, 10)
         HStack {
             Text("Since Member: ")
                 .bold()
                 .foregroundColor(.red)
             Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                 .bold()
         }
         .padding(.top, 10)
         .padding(.bottom, 190)
        }
        
        // Name, Since Member etc.
        VStack(alignment: .leading) {
            // Your existing profile information...
        }
        .padding()
        
        // Log Out
        riveButton(text: "Log Out", action: {
            viewModel.logOut()
        })
        .tint(.red)
        Spacer()
    }
    
    private func loadImage() {
        guard let selectedImage = selectedImage else { return }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.sheetPresentationController?.preferredCornerRadius = 30
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


#Preview {
    ProfileView()
}

