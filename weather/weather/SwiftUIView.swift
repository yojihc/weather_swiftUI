//
//  SwiftUIView.swift
//  weather
//
//  Created by yoji on 4/27/22.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        WeatherView().border(Color.red)
        

    }
}

struct WeatherView: View {
    var body: some View {
        
        // #MARK: ZStack GB Lesson 02
        ZStack {
            
            Text("Сегодня первое июня")
                .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
            
        }
       
        // #MARK: VStack GB LEsson 02
//        VStack {
//            Text("Сегодня первое июня").layoutPriority(1)
//
//            Image("sun2")
//                .resizable()
//                .frame(width: 100, height: 100)
//
//            Text("Великолепнейшая погода 25 градусов Цельсия, солнечно, осадков не ожидается")
//                .multilineTextAlignment(.center)
//                .fixedSize(horizontal: false, vertical: true)
//
//        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}



