//
//  NotificationView.swift
//  TrashNotification
//
//  Created by 能勢航羽 on 2022/06/11.
//

import SwiftUI
import UserNotifications

struct NotificationView: View{
    @State var isMonday = true
    @State var isTuesday = true
    @State var isFriday = true
    
    func makeNotification(_ a: Int){
        //②通知タイミングを指定（8時半月曜日）
        var date = DateComponents()
        date.hour = 8
        date.minute = 30
        date.weekday = a//曜日
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)//8時半に通知
        //③通知コンテンツの作成
        let content = UNMutableNotificationContent()//通知を作る時にとりあえず設定
        content.title = "ゴミ出し明日"
        content.body = "ゴミを出してください"
        content.sound = UNNotificationSound.default
        
        //④通知タイミングと通知内容をまとめてリクエストを作成。
        let request = UNNotificationRequest(identifier: "notification001", content: content, trigger: trigger)
        //⑤④のリクエストの通りに通知を実行させる
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)//④⑤はセット
    }
    func settingNotification(_ b:Int){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]){//通知許可の取得->falseだと何度でも
            (granted, _) in
            if granted{
                makeNotification(b)
            }else{
            }
        }
    }
    
    var body: some View {
        VStack{
            Toggle(isOn: $isMonday){
                Text("月曜日")
                    .font(.largeTitle)
                    .bold()
            }
            Toggle(isOn: $isTuesday){
                Text("火曜日")
                    .font(.largeTitle)
                    .bold()
            }
            Toggle(isOn: $isFriday){
                Text("金曜日")
                    .font(.largeTitle)
                    .bold()
            }
            
            if isMonday{
                settingNotification(b:1)
            }
            if isTuesday{
                settingNotification(b:2)
            }
            if isFriday{
                settingNotification(b:5)
}
        
}
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
}
