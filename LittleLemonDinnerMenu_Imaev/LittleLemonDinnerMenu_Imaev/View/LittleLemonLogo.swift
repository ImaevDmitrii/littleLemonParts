//
//  LittleLemonLogo.swift
//  LittleLemonDinnerMenu_Imaev
//
//  Created by Mapache on 05.02.2024.
//

import SwiftUI

struct LittleLemonLogo: View {
    var body: some View {
        Image("Little Lemon logo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], 60)
            }
    }

#Preview {
    LittleLemonLogo()
}
