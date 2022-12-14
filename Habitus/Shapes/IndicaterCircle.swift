//
//  IndicaterCircle.swift
//  Habitus
//
//  Created by Justin Wells on 11/19/22.
//

import SwiftUI

struct IndicaterCircle: View {
    @State private var rotateDegree: CGFloat = 0
    let count: UInt = 4
    let width: CGFloat = 3
    let spacing: CGFloat = 3
    let color: Color
    @State var rotationSpeed: Double

    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<Int(count), id: \.self) { index in
                item(forIndex: index, in: geometry.size)
            }
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: 200)
        .foregroundColor(color)
        .rotationEffect(Angle(degrees: rotateDegree))
        .onAppear(perform: {
            withAnimation(.linear(duration: rotationSpeed).repeatForever(autoreverses: false)) {
                rotateDegree = 360
            }
        })
    }

    private func item(forIndex index: Int, in geometrySize: CGSize) -> some View {
        Group { () -> Path in
            var p = Path()
            p.addArc(center: CGPoint(x: geometrySize.width/2, y: geometrySize.height/2),
                     radius: geometrySize.width/2 - width/2 - CGFloat(index) * (width + spacing),
                     startAngle: .degrees(0),
                     endAngle: .degrees(Double(Int.random(in: 120...300))),
                     clockwise: true)
            return p.strokedPath(.init(lineWidth: width))
        }
        .frame(width: geometrySize.width, height: geometrySize.height)
    }
}


