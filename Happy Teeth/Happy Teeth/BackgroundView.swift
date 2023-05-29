//
//  BackgroundView.swift
//  Happy Teeth
//
//  Created by Nicolas Amory P.F on 23/05/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Image ("Background")
                .ignoresSafeArea()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
