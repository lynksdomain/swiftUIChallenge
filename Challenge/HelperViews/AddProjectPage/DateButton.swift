//
//  DateButton.swift
//  Challenge
//
//  Created by Lynk on 1/31/21.
//

import SwiftUI

struct DateButton: View {
    
    @State var showingDatePicker = false
    @State var dateString = "Add date & Time"
    @Binding var datePicked: Date?

    
    var body: some View {
        
        ZStack(alignment: .center) {
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("borderColor"), lineWidth: 0.5))
            
            Button(action: {
                showingDatePicker.toggle()
                
                
            }) {
                HStack {
                    Image("date")
                        .resizable()
                        .frame(width: 12.0, height: 12.0)
                    
                    Text(dateString)
                        .font(.system(size: 14))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("dateOrange"))
                }
            }
            
            .fullScreenCover(isPresented: $showingDatePicker, onDismiss: {
                setDate()
            }, content: {
                DatePickerView(datePicked: $datePicked)
            })
            
        }.padding(.top).frame(height: 60)
        
    }
    
    func setDate() {
        guard let date = datePicked else { return }
        dateString = date.formattedDate()
    }
    
}
