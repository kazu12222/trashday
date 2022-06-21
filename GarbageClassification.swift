//
//  GarbageClassification.swift
//  TrashDayNotification
//
//  Created by 能勢航羽 on 2022/06/19.
//

import SwiftUI

struct GarbageClassification: View {
    var body: some View {
        ScrollView{
        VStack{
            Text("ボタンを押してゴミの種類を確認しよう")
        HStack{
            Button(action: {
                            print("Tap!")
                        }){
                            Text("Button")
                        }
                        .buttonStyle(TapButtonStyle())
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
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(configuration.isPressed ? Color.red : Color.blue )
    }
}
