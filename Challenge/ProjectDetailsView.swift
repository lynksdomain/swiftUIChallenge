//
//  ProjectDetailsView.swift
//  Challenge
//
//  Created by Lynk on 1/31/21.
//

import SwiftUI

struct ProjectDetailsView: View {
    
    var project: FetchedResults<Project>.Element
    
    var color: Color {
        get {
            if let colorData = project.headerColor,
               let uiColor = UIColor.color(data: colorData){
                return Color(uiColor)
            } else {
                return .white
            }
        }
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        
        Image("dismiss")
            .resizable()
            .frame(width: 30, height: 30)
            .aspectRatio(contentMode: .fit)
    }
    
    }
    
    var body: some View {
    
        Color("bgColor").overlay(
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
                

                
                
                
                ZStack(alignment: .center) {
                    color
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("borderColor"), lineWidth: 1))

                    if let imageData = project.header,
                       let uiImage = UIImage(data: imageData) {
                        HStack {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .layoutPriority(-1)

                        }.clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    
                }.frame(height: 160.0)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
                
                
                    
                    ZStack(alignment: .center) {
                        Color.white
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("borderColor"), lineWidth: 0.5))
                        if let projectDate = project.date {
                        
                        HStack {
                            Image("date")
                                .resizable()
                                .frame(width: 12.0, height: 12.0)
                            
                            Text(projectDate.formattedDate())
                                .font(.system(size: 14))
                                .fontWeight(.heavy)
                                .foregroundColor(Color("dateOrange"))
                        }
                        }
                        
                    }.padding(.top).frame(height: 60)
                
                
                
                
                
                
                Text("Title").font(.system(size: 16))
                    .fontWeight(.heavy)
                    .lineLimit(1)
                    .padding(.top, 16.0)
                if let title = project.title{
                    Text(title).font(.system(size: 14))
                        .padding(.top, 8.0)
                }
                Text("Description").font(.system(size: 16))
                    .fontWeight(.heavy)
                    .lineLimit(1)
                    .padding(.top, 16.0)
                if let description = project.projectDescription {
                    VStack(alignment:.leading){
                        
                        Text(description).font(.system(size: 14))
                            .padding(.top, 8.0)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        
                        
                    }.padding(.trailing,50)
                }
                Spacer()
                
                
                
                
                
            }.padding(.horizontal, 16.0)
        ).ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}
