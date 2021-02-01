//
//  ContentView.swift
//  Challenge
//
//  Created by Lynk on 1/29/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Project.timestamp, ascending: false)],
        animation: .default)
    
    private var projects: FetchedResults<Project>
    
    @State private var presentAddView = false
    @State private var presentDetail = [false]
    
    var body: some View {
        NavigationView {
            Color("bgColor").overlay(
                ScrollView {
                    VStack {
                        Text("Projects").font(.system(size: 24))
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .padding(.top, 55.0)
                            .padding(.bottom, 25)
                        
                        ForEach(projects) { project in
                            
                            NavigationLink(
                                destination:
                                    ProjectDetailsView(project:project)) {
                                
                                
                                HStack {
                                    ZStack(alignment: .center) {
                                        Color.white
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(Color("borderColor"), lineWidth: 1))
                                        
                                        VStack {
                                            if let imageData = project.header,
                                               let uiimage = UIImage(data: imageData) {
                                                
                                                Image(uiImage: uiimage)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(height: 117.0)
                                                    .layoutPriority(-1)
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                
                                                
                                                
                                            } else if let colorData = project.headerColor,
                                                      let uicolor = UIColor.color(data:colorData)
                                            {
                                                
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color(uicolor))
                                                    .frame(height: 117.0)
                                                
                                                
                                                
                                                
                                            }
                                            
                                            
                                            
                                            Spacer()
                                            HStack() {
                                                if let title = project.title,
                                                   let date = project.date {
                                                    Text(title)
                                                        .font(.system(size: 14))
                                                        .fontWeight(.medium)
                                                        .padding(.leading, 8.0)
                                                        .foregroundColor(Color.black)
                                                    
                                                    Spacer()
                                                    
                                                    Text(date.formattedDate())
                                                        .font(.system(size: 14))
                                                        .fontWeight(.heavy)
                                                        .multilineTextAlignment(.trailing)
                                                        .padding(.trailing, 8.0)
                                                        .foregroundColor(Color("dateOrange"))
                                                    
                                                    
                                                }
                                            }.frame(maxWidth: .infinity)
                                            
                                            
                                            
                                            Spacer()
                                        }.clipShape(RoundedRectangle(cornerRadius: 16))
                                    }
                                    .frame(height: 160.0)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                }
                            }
                        }
                        Spacer(minLength: 16)
                        HStack {
                            AddProjectRow(presentAddView: self.$presentAddView).environment(\.managedObjectContext,viewContext)                    }
                            .padding(.bottom)
                    }.padding(.horizontal, 16.0)
                }
            ).ignoresSafeArea()
        }
    }
}
