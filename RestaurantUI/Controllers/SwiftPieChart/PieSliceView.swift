//
//  PieSliceView.swift
//  
//
//  Created by Ali Tamoor on 9/3/21.
//

import SwiftUI

struct PieSlice: View {
    var pieSliceData: PieSliceData
    @Binding var isTextHidden: Bool
    var midRadians: Double {
        return Double.pi / 2.0 - (pieSliceData.startAngle + pieSliceData.endAngle).radians / 2.0
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let width: CGFloat = min(geometry.size.width, geometry.size.height)
                    let height = width
                    path.move(
                        to: CGPoint(
                            x: width * 0.5,
                            y: height * 0.5
                        )
                    )
                    
                    path.addArc(center: CGPoint(x: width * 0.5, y: height * 0.5), radius: width * 0.5, startAngle: Angle(degrees: -90.0) + pieSliceData.startAngle, endAngle: Angle(degrees: -90.0) + pieSliceData.endAngle, clockwise: false)
                    path.border(Color.orange)
                    
                }
                
                .fill(pieSliceData.color)
                
                Path { path in
                                 let width: CGFloat = min(geometry.size.width, geometry.size.height)
                                 let height = width
                                 path.move(
                                     to: CGPoint(
                                         x: width * 0.5,
                                         y: height * 0.5
                                     )
                                 )
                                 
                                 path.addArc(center: CGPoint(x: width * 0.5, y: height * 0.5), radius: width * 0.5, startAngle: Angle(degrees: -90.0) + pieSliceData.startAngle, endAngle: Angle(degrees: -90.0) + pieSliceData.endAngle, clockwise: false)
                             }
                             .stroke(Color.white, lineWidth: 3)
//                
                Text(pieSliceData.text)
                    .position(
                        x: geometry.size.width * 0.5 * CGFloat(1.0 + 0.78 * cos(self.midRadians)),
                        y: geometry.size.height * 0.5 * CGFloat(1.0 - 0.78 * sin(self.midRadians))
                    )
                    .foregroundColor(Color.white)
                    .opacity(isTextHidden ? 0 : 1)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}


struct PieSliceData {
    var startAngle: Angle
    var endAngle: Angle
    var text: String
    var color: Color
}


struct PieSlice_Previews: PreviewProvider {
    static var previews: some View {
        PieSlice(pieSliceData: PieSliceData(startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 120.0), text: "30%", color: Color.black), isTextHidden: .constant(true))
    }
}
