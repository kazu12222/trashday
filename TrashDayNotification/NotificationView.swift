//
//  NotificationView.swift
//  TrashNotification
//
//  Created by 能勢航羽 on 2022/06/11.
//

import SwiftUI
import UserNotifications

struct NotificationView: View{
    
    @State private var isMonday = false
    @State private var isTuesday = false
    @State private var isFriday = false
    @State private var isFive = false
    @State private var isTen = false
    
    enum Weekday: Int{
        case sunday = 1
        case monday = 2
        case tuesday = 3
        case wednesday = 4
        case thursday = 5
        case friday = 6
        case saturday = 7
    }
    
    func makeNotification(dayofweek: Int){
        //②通知タイミングを指定（8時15分月曜日）
        var date = DateComponents()
        date.hour = 8
        date.minute = 15
        //1が日曜日
        date.weekday = dayofweek
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)//8時15に通知
        //③通知コンテンツの作成
        //通知を作る時にとりあえず設定
        let content = UNMutableNotificationContent()
        if(dayofweek == Weekday.monday.rawValue){
            content.title = "今日は燃えないゴミ"
        }
        if(dayofweek == Weekday.tuesday.rawValue && dayofweek == Weekday.friday.rawValue){
            content.title = "今日は燃えるゴミ"
            content.title = "今日は燃えるゴミ"
        }
        content.body = "ゴミを出してください"
        content.sound = UNNotificationSound.default
        //④通知タイミングと通知内容をまとめてリクエストを作成。
        let request = UNNotificationRequest(identifier: dayofweek.description, content: content, trigger: trigger)
        //⑤④のリクエストの通りに通知を実行させる
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)//④⑤はセット
    }
    func settingNotification(dayofweek: Int){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]){//通知許可の取得->falseだと何度でも
            (granted, _) in
            if granted{
                makeNotification(dayofweek: dayofweek)
            }
        }
    }
    
    
    func aftersecondNotification(waittime: Int){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]){//通知許可の取得->falseだと何度でも
            (granted, _) in
            if granted{
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(waittime), repeats: false)
                
                //通知コンテンツの作成
                let content = UNMutableNotificationContent()
                if(waittime == 5){
                    content.title = "5秒経ちました"
                    content.body = "5秒"
                    content.sound = UNNotificationSound.default
                }
                else if(waittime == 10){
                    content.title = "10秒経ちました"
                    content.body = "10秒"
                    content.sound = UNNotificationSound.default
                }
                
                //通知リクエストを作成
                let request = UNNotificationRequest(identifier: waittime.description, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
        }
    }
    
    
    var body: some View {
        ScrollView{
            VStack{
                
                Text("青:燃えないゴミ")
                    .foregroundColor(Color.blue)
                    .font(.largeTitle)
                Text("赤:燃えるゴミ")
                    .foregroundColor(Color.red)
                    .font(.largeTitle)
                
                Toggle(isOn: $isTen){
                    Text("10秒後")
                        .frame(width:200, height: 80)
                        .font(.system(size: 40,weight: .bold))
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .padding()
                }
                .onChange(of: isTen){ newValue in
                    
                    aftersecondNotification(waittime: 10)
                }
                .background(Color.green)
                
                Toggle(isOn: $isFive){
                    Text("5秒後")
                        .frame(width:200, height: 80)
                        .font(.system(size: 40,weight: .bold))
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .padding()
                }
                .onChange(of: isFive){ newValue in
                    
                    aftersecondNotification(waittime: 5)
                }
                .background(Color.green)
                
                Toggle(isOn: $isMonday){
                    Text("月曜日")
                        .frame(width:200, height: 80)
                        .font(.system(size: 40,weight: .bold))
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .padding()
                }
                .onChange(of: isMonday) { newValue in
                    
                    settingNotification(dayofweek: Weekday.monday.rawValue)
                }
                .background(Color.blue)
                
                Toggle(isOn: $isTuesday){
                    Text("火曜日")
                        .frame(width:200, height: 80)
                        .font(.system(size: 40,weight: .bold))
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .padding()
                    
                }
                .onChange(of: isTuesday) { newValue in
                    
                    settingNotification(dayofweek: Weekday.tuesday.rawValue)
                }
                .background(Color.red)
                
                Toggle(isOn: $isFriday){
                    Text("金曜日")
                        .frame(width:200, height: 80)
                        .font(.system(size: 40,weight: .bold))
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                        .padding()
                }
                .onChange(of: isFriday) { newValue in
                    
                    settingNotification(dayofweek: Weekday.friday.rawValue)
                }.background(Color.red)
                
                
                
                
            }
            .navigationBarTitle("通知設定")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

