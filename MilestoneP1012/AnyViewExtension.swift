//
//  AnyViewExtension.swift
//  MilestoneP1012
//
//  Created by RqwerKnot on 10/03/2022.
//

import SwiftUI

// If you intend to use type erasure regularly, it’s worth adding this convenience extension:

extension View {
    func erasedToAnyView() -> AnyView {
        AnyView(self)
    }
}

struct AnyViewExtension: View {
    var body: some View {
        Text("Hello World")
            .font(.title)
            .erasedToAnyView()
    }
}

struct AnyViewExtension_Previews: PreviewProvider {
    static var previews: some View {
        AnyViewExtension()
    }
}
