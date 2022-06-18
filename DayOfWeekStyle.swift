//
//  DayOfWeekStyle.swift
//  TrashDayNotification
//
//  Created by 能勢航羽 on 2022/06/16.
//

import SwiftUI

struct DayOfWeekStyle: View {
    var weekofday : String
    var body: some View {
        Text("\(weekofday)")
                .frame(width: 110, height: 110)
                .font(.system(size: 40,weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.blue)
                .clipShape(Rectangle())
                .padding()
        }
    
}

struct DayOfWeekStyle_Previews: PreviewProvider {
    static var previews: some View {
        DayOfWeekStyle(weekofday:"曜日")
    }
}
