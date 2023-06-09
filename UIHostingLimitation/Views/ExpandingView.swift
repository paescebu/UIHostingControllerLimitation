//
//  ExpandingView.swift
//  UIHostingLimitation
//
//  Created by Pascal Burlet on 07.06.23.
//

import SwiftUI

struct ExpandingView: View {
    @State var isExpanded = false
    
    var body: some View {
        VStack(spacing: 0) {
            Button("Tap Me") {
                isExpanded.toggle()
            }
            .frame(width: 50, height: 50)
            VStack(spacing: 0) {
                if isExpanded {
                    Text("Hello")
                        .frame(width: 50, height: 100)
                }
            }
        }
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .background(.clear)

    }
}

struct ExpandingView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingView()
            .padding()
    }
}
