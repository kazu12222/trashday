//
//  DayOfWeekStyle.swift
//  TrashDayNotification
//
//  Created by 能勢航羽 on 2022/06/16.
//

import SwiftUI

struct BlueTrashItemStyle: View {
    var trashitem : String
    var body: some View {
        Text("\(trashitem)")
                .frame(width:150, height: 150)
                .font(.system(size: 40,weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.blue)
                .clipShape(Circle())
                .padding()
        }
    
}

struct BlueTrashItemStyle_Previews: PreviewProvider {
    static var previews: some View {
        BlueTrashItemStyle(trashitem:"ごみ")
    }
}
