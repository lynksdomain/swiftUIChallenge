//
//  DatePickerView.swift
//  Challenge
//
//  Created by Lynk on 1/31/21.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var datePicked: Date?
    @Environment(\.presentationMode) var presentationMode
    @State var defaultDate = Date()
    
    
    var body: some View {
        ZStack {
        
        ZStack {
            Rectangle()
                .fill(Color.clear)
            
        }
        .frame(maxHeight:.infinity)
        .background(BackgroundBlurView().onTapGesture(count: 1, perform: {
            datePicked = defaultDate
            self.presentationMode.wrappedValue.dismiss()
        }))
        .ignoresSafeArea()
        
        DatePicker("", selection: $defaultDate)
            .datePickerStyle(GraphicalDatePickerStyle())
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(maxWidth:350)
            .frame(height:300)
            .padding(.horizontal,8)
        }
    }
}
