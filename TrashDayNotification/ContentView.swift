//
//  ContentView.swift
//  TrashNotification
//
//  Created by 能勢航羽 on 2022/06/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
            NavigationLink("通知",destination: NotificationView())
            }.navigationBarTitle("ゴミ出し通知アプリ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
