//
//  AddProjectView.swift
//  Challenge
//
//  Created by Lynk on 1/30/21.
//

import SwiftUI

struct AddProjectView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

  
    @State var title: String = ""
    @State var description: String = ""
    @State var inputImage: UIImage?
    @State var selectedColor: Color = .white
    @State var datePicked: Date?
    @State var project: Project?
    @Binding var presentAddView: Bool
    

    var body: some View {
        
        
        Color("bgColor").overlay(
            KeyboardHost {
            VStack(alignment: .leading) {
                
                HStack(alignment: .center) {
                    Text("Create Project").font(.system(size: 24))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .padding(.top, 55.0)
                        .padding(.bottom, 25)
                        .frame(maxWidth: .infinity, alignment: .center)
                }.padding(.horizontal, 16.0)
                .frame(alignment: .center )
                
                
                AddHeaderView(inputImage: $inputImage, selectedColor: $selectedColor, project: project)
                DateButton(datePicked: $datePicked)
               
               
                
                Text("Title").font(.system(size: 16))
                    .fontWeight(.heavy)
                    .lineLimit(1)
                    .padding(.top, 16.0)
                TextField("Type Here", text: $title)
                    .padding(.leading, 8.0)
                    .frame(height: 38.0)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("borderColor"), lineWidth: 1))
                    .background(Color.white)
                    
                
                Text("Description").font(.system(size: 16))
                    .fontWeight(.heavy)
                    .lineLimit(1)
                TextField("Type Here",text: $description)
                    .padding(.leading,8.0)
                    .frame(height: 38.0)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("borderColor"), lineWidth: 1))
                    .background(Color.white)
                    
                    
                    
                
                Spacer()
                Spacer()
                
                Button(action: {
                    addItem()
                }) {
                    HStack {
                        Text("Save")
                            .fontWeight(.semibold)
                            .font(.system(size: 16))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("saveBlue"))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.bottom, 32.0)
                .padding(.horizontal, 16.0)
                

            }
            .padding(.horizontal, 16.0)
        
            }).ignoresSafeArea()
    }
    

    
    private func addItem() {
        withAnimation {
            guard let date = datePicked,
                  title != "",
                  description != "" else { return }
            
            guard inputImage != nil || selectedColor != .white else { return }
            
            let newItem = Project(context: viewContext)
            newItem.timestamp = Date()
            newItem.date = date
            newItem.title = title
            newItem.projectDescription = description
            
            if let image = inputImage {
                newItem.header = image.jpegData(compressionQuality: 1.0)
            } else {
                let color = UIColor(selectedColor)
                guard let data = color.encode() else { return }
                newItem.headerColor = data
            }
            
            do {
                try viewContext.save()
                presentAddView = false
            } catch {
                let nsError = error as NSError
                print(error)
            }
        }
    }
    
}
