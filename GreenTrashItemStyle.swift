//
//  GreenTrashItemStyle.swift
//  TrashDayNotification
//
//  Created by 能勢航羽 on 2022/06/19.
//

import SwiftUI

struct GreenTrashItemStyle: View {
    var trashitem: String
    var body: some View {
        Text("\(trashitem)")
                .frame(width:150, height: 150)
                .font(.system(size: 40,weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.green)
                .clipShape(Circle())
                .padding()
    }
}

struct GreenTrashItemStyle_Previews: PreviewProvider {
    static var previews: some View {
        GreenTrashItemStyle(trashitem: "ごみ")
    }
}
