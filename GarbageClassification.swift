//
//  GarbageClassification.swift
//  TrashDayNotification
//
//  Created by 能勢航羽 on 2022/06/19.
//

import SwiftUI

struct GarbageClassification: View {
    @State private var flag: [Bool] = [false,false,false,false,false,false,false,false]
    @State var trashitem: [String] = ["生ごみ","ペットボトル","貝殻","ガラス","新聞紙","時計","天ぷら油","段ボール"]
    var body: some View {
        ScrollView{
            VStack{
                Text("ボタンを押してゴミの種類を確認しよう")
                HStack{
                    Button(action: {
                        flag[0] = true
                    },label:{
                        RedTrashItemStyle(judgeflag: flag[0], trashitem: trashitem[0])
                            
                    })
                    Button(action: {
                        flag[1] = true
                    },label:{
                        GreenTrashItemStyle(judgeflag: flag[1], trashitem: trashitem[1])
                    })
                }
                HStack{
                    Button(action: {
                        flag[2] = true
                    },label:{
                        RedTrashItemStyle(judgeflag: flag[2],trashitem: trashitem[2])
                    })
                    Button(action: {
                        flag[3] = true
                    },label:{
                        BlueTrashItemStyle(judgeflag: flag[3], trashitem: trashitem[3])
                    })
                }
                HStack{
                    Button(action: {
                        flag[4] = true
                    },label:{
                        GreenTrashItemStyle(judgeflag: flag[4], trashitem: trashitem[4])
                    })
                    Button(action: {
                        flag[5] = true
                    },label:{
                        BlueTrashItemStyle(judgeflag: flag[5], trashitem: trashitem[5])
                    })
                }
                HStack{
                    Button(action: {
                        flag[6] = true
                    },label:{
                        GreenTrashItemStyle(judgeflag: flag[6], trashitem: trashitem[6])
                    })
                    Button(action: {
                        flag[7] = true
                    },label:{
                        GreenTrashItemStyle(judgeflag: flag[7], trashitem: trashitem[7])
                    })
                }
                
                
            }
        }
    }
}

struct GarbageClassification_Previews: PreviewProvider {
    static var previews: some View {
        GarbageClassification()
    }
}

struct TapButtonStyle : ButtonStyle {
    @State var text:String
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(configuration.isPressed ? Color.red : Color.blue )
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .shadow(color: configuration.isPressed ? .gray : .clear, radius: 2, x: 4, y: 4)
    }
}

