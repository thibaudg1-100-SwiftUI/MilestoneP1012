//
//  AnyViewOnly.swift
//  MilestoneP1012
//
//  Created by RqwerKnot on 10/03/2022.
//

import SwiftUI

// There is at least one time you really do need the type erasing powers of AnyView, but it really should be your last choice. For example, you can’t make an array of groups, because [Group] by itself has no meaning – SwiftUI wants to know what’s in the group. On the other hand, [AnyView] is perfectly fine, because the point of AnyView is that the contents don’t matter.

// So, this kind of code is only possible with actual type erasure:

struct AnyViewOnly: View {
    @State private var views = [AnyView]()
    
    var body: some View {
        VStack {
            Button("Add Shape") {
                if Bool.random() {
                    views.append(AnyView(Circle().frame(height: 50)))
                } else {
                    views.append(AnyView(Rectangle().frame(width: 50)))
                }
            }
            
            ForEach(0..<views.count, id: \.self) {
                views[$0]
            }
            
            Spacer()
        }
    }
}

// Every time you tap the button a shape gets added to the array, but because both Shape and Group are meaningless the array must be typed [AnyView].

struct AnyViewOnly_Previews: PreviewProvider {
    static var previews: some View {
        AnyViewOnly()
    }
}
