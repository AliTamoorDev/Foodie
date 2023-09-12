//
//  PieChartView.swift
//
//
//  Created by Ali Tamoor on  9/3/21.
//

import SwiftUI


public struct PieChartView: View {
    public let values: [Double]
    public let names: [String]
    public let formatter: (Double) -> String
    
    public var colors: [Color]
    public var backgroundColor: Color
    
    public var widthFraction: CGFloat
    public var innerRadiusFraction: CGFloat
    @State private var isHidden = true
    @State private var activeIndex: Int = -1
    
    var slices: [PieSliceData] {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in values.enumerated() {
            let degrees: Double = value * 360 / sum
            tempSlices.append(PieSliceData(startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees), text: String(format: "%.0f%%", value * 100 / sum), color: self.colors[i]))
            endDeg += degrees
        }
        return tempSlices
    }
    
    public init(values:[Double], names: [String], formatter: @escaping (Double) -> String, colors: [Color] = [Color.blue, Color.green, Color.orange], backgroundColor: Color = Color(red: 21 / 255, green: 24 / 255, blue: 30 / 255, opacity: 1.0), widthFraction: CGFloat = 0.75, innerRadiusFraction: CGFloat = 0.60){
        self.values = values
        self.names = names
        self.formatter = formatter
        
        self.colors = generateRandomColors(count: values.count)
        self.backgroundColor = backgroundColor
        self.widthFraction = widthFraction
        self.innerRadiusFraction = innerRadiusFraction
    }
    
    public var body: some View {
        GeometryReader { geometry in
            VStack{
                Text("Sale Breakdown")
                    .foregroundColor(Color("TertiaryBG"))
                    .font(.custom("Lato-Semibold", size: 45))
                    .padding(.vertical, 40)
                ZStack{
                    ForEach(0..<self.values.count){ i in
                        PieSlice(pieSliceData: self.slices[i], isTextHidden: $isHidden)
                            .scaleEffect(self.activeIndex == i ? 1.03 : 1)
                            .animation(Animation.spring())
                    }
                    .frame(width: widthFraction * geometry.size.width, height: widthFraction * geometry.size.width)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let radius = 0.5 * widthFraction * geometry.size.width
                                let diff = CGPoint(x: value.location.x - radius, y: radius - value.location.y)
                                let dist = pow(pow(diff.x, 2.0) + pow(diff.y, 2.0), 0.5)
                                if (dist > radius || dist < radius * innerRadiusFraction) {
                                    self.activeIndex = -1
                                    return
                                }
                                var radians = Double(atan2(diff.x, diff.y))
                                if (radians < 0) {
                                    radians = 2 * Double.pi + radians
                                }
                                
                                for (i, slice) in slices.enumerated() {
                                    if (radians < slice.endAngle.radians) {
                                        self.activeIndex = i
                                        break
                                    }
                                }
                                isHidden = false
                            }
                            .onEnded { value in
                                self.activeIndex = -1
                                isHidden = true
                            }
                    )
//                    Circle()
//                        .fill(self.backgroundColor)
//                        .frame(width: widthFraction * geometry.size.width * innerRadiusFraction, height: widthFraction * geometry.size.width * innerRadiusFraction)
//
//                    VStack {
//                        Text(self.activeIndex == -1 ? "Total" : names[self.activeIndex])
//                            .font(.title)
//                            .foregroundColor(Color.gray)
//                        Text(self.formatter(self.activeIndex == -1 ? values.reduce(0, +) : values[self.activeIndex]))
//                            .font(.title)
//                    }
                    
                }
                PieChartRows(colors: self.colors, names: self.names, values: self.values.map { self.formatter($0) }, percents: self.values.map { String(format: "%.2f%%", $0 * 100 / self.values.reduce(0, +)) })
                    .padding(.horizontal, 20)
            }
            .background(self.backgroundColor)
            .foregroundColor(Color.white)
            .cornerRadius(20)
        }
        .padding(.horizontal)
    }
}

private func generateRandomColors(count: Int) -> [Color] {
        var colors: [Color] = []
        for _ in 0..<count {
            let red = Double.random(in: 0...1)
            let green = Double.random(in: 0...1)
            let blue = Double.random(in: 0...1)
            colors.append(Color(red: red, green: green, blue: blue))
        }
        return colors
    }


struct PieChartRows: View {
    var colors: [Color]
    var names: [String]
    var values: [String]
    var percents: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<self.values.count){ i in
                HStack {
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(self.colors[i])
                    //                        .border(.white)
                        .frame(width: 20, height: 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 2) // Border color and width
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    Text(String(percents[i]))
                        .font(.custom("Lato-Bold", size: 15))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                  
                    Text(self.names[i])
                        .font(.custom("Lato-Semibold", size: 15))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

            }
        }
        .padding(20)
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(values: [1300, 500, 300,200], names: ["Rent", "Transport", "Education","paper"], formatter: {value in String(format: "$%.2f", value)})
    }
}


