//
//  ContentView.swift
//  Fashion-hup
//
//  Created by Sandal on 20/02/1443 AH.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var islogin:UserAuth
    @State var width:CGFloat=0
    @State var width1:CGFloat=150
    @State var totalwidth:CGFloat=300
    @ObservedObject var slider = CustomSlider(start: 10, end: 100)
    @State var colors = [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
                         Color(#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)),
                         Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)),
                         Color(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)),
                         Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),
                         Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)),
                         Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)),
                         Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)),
                         Color(#colorLiteral(red: 1, green: 0.6213179231, blue: 0, alpha: 1)),
                         Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))]
    @State var selected_color = ""
    var body: some View {
        VStack{
            VStack{
            HStack(spacing:8){
                Text("من: \(StringFunction().numberStrToEnglish(numberStr:String(Int(slider.lowHandle.currentValue))))")
                Spacer()
                Text("الي: \(StringFunction().numberStrToEnglish(numberStr:String(Int(slider.highHandle.currentValue))))")
                
            }.padding(.horizontal).font(.custom(Fount_name.reguler.rawValue, size: 14))
            SliderView(slider: slider).padding(.horizontal)
        }.environment(\.layoutDirection, .leftToRight)
            VStack(alignment:.leading,spacing:5){
                Text("الالوان").padding(.horizontal).font(.custom(Fount_name.reguler.rawValue, size: 17))
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:3){
                            ForEach(colors, id: \.self) { index in
                                Circle().fill(index).frame(width: 25,height:25).cornerRadius(10).onTapGesture {
                                    selected_color = color_function().hexStringFromColor(color: UIColor( index))
                                }
                                .scaleEffect(selected_color != color_function().hexStringFromColor(color: UIColor(index)) ? 1 : 1.2)
                                .shadow(color: .AppGray, radius: 1, x: 3, y: 3)
                                .padding(.horizontal,5)
                            }
                    }.frame(height: 40).padding(.horizontal,25)
            }
            }
            Button(action: {
//                if FormValidation(){
//                    isLoading=true
//                checkUserSignIn()
//                        UpdateCustomer()
                    
//                }
            }, label: {
                Text("بحث")
                    .font(.custom(Fount_name.bold.rawValue, size: 20))
                    
                    .foregroundColor(.white)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
                    .frame(width: 320, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(
                                Color.AppPrimaryColor
                                
                            )
                    )
                
            })
        }
       
    }
//       }
//        VStack{
//        Text("السعر")
//            Text("من \(getValur(valu: width/totalwidth)) :  الى \(getValur(valu: width1/totalwidth))")
//            ZStack(alignment: .leading ){
//                Rectangle().fill(Color.black.opacity(0.20)).frame(height:7)
//                Rectangle().fill(Color.AppPrimaryColor).frame(width:self.width1-width, height:7)
//                    .offset(x:self.width+18)
//                HStack(spacing:0){
//                    Circle().fill(Color.black)
//                        .frame(width: 18, height: 18)
//                        .offset(x:self.width)
//                        .gesture(
//                            DragGesture()
//                                .onChanged({ (value) in
//                                    if  value.location.x >= 0 &&  value.location.x <= self.width1{
//                                    self.width = value.location.x
//                                    }
//                                })
//                        )
//                    Circle().fill(Color.black).frame(width: 18, height: 18)
//                        .offset(x:self.width1)
//                        .gesture(
//                        DragGesture()
//                            .onChanged({ (value) in
//                                if  value.location.x <= totalwidth &&  value.location.x >= self.width{
//                                self.width1 = value.location.x
//                                }
//                            })
//                    )
////                        .gesture(
////                            DragGesture()
////                                .onChanged({ (value) in
////                                    self.width1 = value.location.x
////                                })
////                        )
//
//                }
//            }
//        }.padding()
//    }
    func getValur(valu:CGFloat) -> String {
        return String(format: "%2.2f", valu)
    }
}


import SwiftUI
import Combine

//SliderValue to restrict double range: 0.0 to 1.0
@propertyWrapper
struct SliderValue {
    var value: Double
    
    init(wrappedValue: Double) {
        self.value = wrappedValue
    }
    
    var wrappedValue: Double {
        get { value }
        set { value = min(max(0.0, newValue), 1.0) }
    }
}

class SliderHandle: ObservableObject {
    
    //Slider Size
    let sliderWidth: CGFloat
    let sliderHeight: CGFloat
    
    //Slider Range
    let sliderValueStart: Double
    let sliderValueRange: Double
    
    //Slider Handle
    var diameter: CGFloat = 40
    var startLocation: CGPoint
    
    //Current Value
    @Published var currentPercentage: SliderValue
    
    //Slider Button Location
    @Published var onDrag: Bool
    @Published var currentLocation: CGPoint
        
    init(sliderWidth: CGFloat, sliderHeight: CGFloat, sliderValueStart: Double, sliderValueEnd: Double, startPercentage: SliderValue) {
        self.sliderWidth = sliderWidth
        self.sliderHeight = sliderHeight
        
        self.sliderValueStart = sliderValueStart
        self.sliderValueRange = sliderValueEnd - sliderValueStart
        
        let startLocation = CGPoint(x: (CGFloat(startPercentage.wrappedValue)/1.0)*sliderWidth, y: sliderHeight/2)
        
        self.startLocation = startLocation
        self.currentLocation = startLocation
        self.currentPercentage = startPercentage
        
        self.onDrag = false
    }
    
    lazy var sliderDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>  = DragGesture()
        .onChanged { value in
            self.onDrag = true
            
            let dragLocation = value.location
            
            //Restrict possible drag area
            self.restrictSliderBtnLocation(dragLocation)
            
            //Get current value
            self.currentPercentage.wrappedValue = Double(self.currentLocation.x / self.sliderWidth)
            
        }.onEnded { _ in
            self.onDrag = false
        }
    
    private func restrictSliderBtnLocation(_ dragLocation: CGPoint) {
        //On Slider Width
        if dragLocation.x > CGPoint.zero.x && dragLocation.x < sliderWidth {
            calcSliderBtnLocation(dragLocation)
        }
    }
    
    private func calcSliderBtnLocation(_ dragLocation: CGPoint) {
        if dragLocation.y != sliderHeight/2 {
            currentLocation = CGPoint(x: dragLocation.x, y: sliderHeight/2)
        } else {
            currentLocation = dragLocation
        }
    }
    
    //Current Value
    var currentValue: Double {
        return sliderValueStart + currentPercentage.wrappedValue * sliderValueRange
    }
}

class CustomSlider: ObservableObject {
    
    //Slider Size
    final let width: CGFloat = 300
    final let lineWidth: CGFloat = 8
    
    //Slider value range from valueStart to valueEnd
    final let valueStart: Double
    final let valueEnd: Double
    
    //Slider Handle
    @Published var highHandle: SliderHandle
    @Published var lowHandle: SliderHandle
    
    //Handle start percentage (also for starting point)
    @SliderValue var highHandleStartPercentage = 1.0
    @SliderValue var lowHandleStartPercentage = 0.0

    final var anyCancellableHigh: AnyCancellable?
    final var anyCancellableLow: AnyCancellable?
    
    init(start: Double, end: Double) {
        valueStart = start
        valueEnd = end
        
        highHandle = SliderHandle(sliderWidth: width,
                                  sliderHeight: lineWidth,
                                  sliderValueStart: valueStart,
                                  sliderValueEnd: valueEnd,
                                  startPercentage: _highHandleStartPercentage
                                )
        
        lowHandle = SliderHandle(sliderWidth: width,
                                  sliderHeight: lineWidth,
                                  sliderValueStart: valueStart,
                                  sliderValueEnd: valueEnd,
                                  startPercentage: _lowHandleStartPercentage
                                )
        
        anyCancellableHigh = highHandle.objectWillChange.sink { _ in
            self.objectWillChange.send()
        }
        anyCancellableLow = lowHandle.objectWillChange.sink { _ in
            self.objectWillChange.send()
        }
    }
    
    //Percentages between high and low handle
    var percentagesBetween: String {
        return String(format: "%.2f", highHandle.currentPercentage.wrappedValue - lowHandle.currentPercentage.wrappedValue)
    }
    
    //Value between high and low handle
    var valueBetween: String {
        return String(format: "%.2f", highHandle.currentValue - lowHandle.currentValue)
    }
}

struct SliderView: View {
    @ObservedObject var slider: CustomSlider
    
    var body: some View {
        RoundedRectangle(cornerRadius: slider.lineWidth)
            .fill(Color.gray.opacity(0.2))
            .frame(width: slider.width, height: slider.lineWidth)
            .overlay(
                ZStack {
                    //Path between both handles
                    SliderPathBetweenView(slider: slider)
                    
                    //Low Handle
                    SliderHandleView(handle: slider.lowHandle)
                        .highPriorityGesture(slider.lowHandle.sliderDragGesture)
                    
                    //High Handle
                    SliderHandleView(handle: slider.highHandle)
                        .highPriorityGesture(slider.highHandle.sliderDragGesture)
                }
            )
    }
}

struct SliderHandleView: View {
    @ObservedObject var handle: SliderHandle
    
    var body: some View {
        Circle()
            .frame(width: 25 , height: 25)
            .foregroundColor(.white)
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 0)
            .scaleEffect(handle.onDrag ? 1.3 : 1)
            .contentShape(Rectangle())
            .position(x: handle.currentLocation.x, y: handle.currentLocation.y)
    }
}

struct SliderPathBetweenView: View {
    @ObservedObject var slider: CustomSlider
    
    var body: some View {
        Path { path in
            path.move(to: slider.lowHandle.currentLocation)
            path.addLine(to: slider.highHandle.currentLocation)
        }
        .stroke(Color.AppPrimaryColor, lineWidth: slider.lineWidth)
    }
}
