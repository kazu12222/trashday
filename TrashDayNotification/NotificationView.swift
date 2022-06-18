//
//  NotificationView.swift
//  TrashNotification
//
//  Created by 能勢航羽 on 2022/06/11.
//

import SwiftUI
import UserNotifications

struct NotificationView: View{
    @State var isMonday = false
    @State var isTuesday = false
    @State var isFriday = false
    @State var isSoon = false
    @State var is10 = false
    @State var models=[]
    
    func makeNotification(dayofweek: Int){
        //②通知タイミングを指定（8時半月曜日）
        var date = DateComponents()
        date.hour = 22
        date.minute = 0
        date.weekday = dayofweek//1が日曜日
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)//8時半に通知
        //③通知コンテンツの作成
        let content = UNMutableNotificationContent()//通知を作る時にとりあえず設定
        if(dayofweek==2&&dayofweek==1){
        content.title = "明日は燃えるゴミ"
        content.body = "ゴミを出してください"
        content.sound = UNNotificationSound.default
        }
        if(dayofweek==5){
        content.title = "明日は燃えないゴミ"
        content.body = "ゴミを出してください"
        content.sound = UNNotificationSound.default
        }
        
        //④通知タイミングと通知内容をまとめてリクエストを作成。
        let request = UNNotificationRequest(identifier: models.count.description, content: content, trigger: trigger)
        //⑤④のリクエストの通りに通知を実行させる
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)//④⑤はセット
    }
    func settingNotification(dayofweek :Int){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]){//通知許可の取得->falseだと何度でも
            (granted, _) in
            if granted{
                makeNotification(dayofweek: dayofweek)
            }else{
            }
        }
    }
    
    
    func aftersecondNotification(_ a:Int){
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]){//通知許可の取得->falseだと何度でも
        (granted, _) in
        if granted{
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(a), repeats: false)
            
            //通知コンテンツの作成
            let content = UNMutableNotificationContent()
            if(a==5){
            content.title = "5秒経ちました"
            content.body = "5秒"
            content.sound = UNNotificationSound.default
            }
            else if(a==10){
                content.title = "10秒経ちました"
                content.body = "10秒"
                content.sound = UNNotificationSound.default
            }
            
            //通知リクエストを作成
            let request = UNNotificationRequest(identifier: models.count.description, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }else{
        }
    }
}
    
    
    var body: some View {
        NavigationView{
        VStack{
            
            Text("青:燃えないゴミ")
                .foregroundColor(Color.blue)
                .font(.largeTitle)
            Text("赤:燃えるゴミ")
                .foregroundColor(Color.red)
                .font(.largeTitle)
            
            Toggle(isOn: $is10){
                Text("10秒後")
                    .frame(width:200, height: 80)
                    .font(.system(size: 40,weight: .bold))
                    .foregroundColor(Color.white)
                    .clipShape(Rectangle())
                    .padding()
            }
                .onChange(of: isSoon){ newValue in
                    aftersecondNotification(10)
                }
                .background(Color.green)
                
            Toggle(isOn: $isSoon){
                Text("5秒後")
                    .frame(width:200, height: 80)
                    .font(.system(size: 40,weight: .bold))
                    .foregroundColor(Color.white)
                    .clipShape(Rectangle())
                    .padding()
            }
                .onChange(of: isSoon){ newValue in
                    aftersecondNotification(5)
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
                    settingNotification(dayofweek: 1)
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
                    settingNotification(dayofweek: 2)
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
                    settingNotification(dayofweek: 5)
                }.background(Color.red)
                
        
            
        
    }
        .navigationBarTitle("通知設定")
        .navigationBarTitleDisplayMode(.inline)
            
    }
    
    }}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

