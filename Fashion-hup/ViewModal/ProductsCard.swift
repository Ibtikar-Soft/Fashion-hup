//
//  ProductsCard.swift
//  Fashion-hup
//
//  Created by Sandal on 22/02/1443 AH.
//

import SwiftUI
import CoreLocation
struct ProductsCard: View {
    var product:ShopList
    @Binding var show_iteam_description:Bool
    @Binding var selected_product:ShopList
//    var animation:Namespace.ID
    var body: some View {
        ZStack(alignment: .bottom){
            

            AsyncImage(
                                url: URL(string:AppImageBase+"UploadFiles/429092021121941.png")!,
                                placeholder: { Image(app_logo)},
                                image: { Image(uiImage: $0).resizable() }
                             )
            VStack{
                
                HStack{
                    
                    Image(systemName:"heart.circle.fill").resizable().background(Color.white).foregroundColor(.AppPrimaryColor).frame(width: 40, height: 40, alignment: .center)
                        .clipShape(Circle())
                        .padding()
                    Spacer()
                }
                
                Spacer()
                HStack{
                    Text(product.name).padding(.leading,8).padding([.top,.leading],10)

                    Spacer()
                    HStack(spacing:3){
                    Text("\(product.rate ?? 10)")
                        Text(palance_coine)
                    }.padding(.trailing,8)
                }.frame( height: 45, alignment: .center).background(Color.AppPrimaryColor.opacity(0.7)).font(.custom(Fount_name.reguler.rawValue, size: 14))
                .foregroundColor(.white)
//        }
           
            }
        }.frame(width: 167, height: 220)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.4)
        ).cornerRadius(20).onTapGesture {
            selected_product = product
            show_iteam_description = true
        }
        
        
        
    }
    func getDistance(latitu:Double,longitu:Double,key:Bool)->String{
        let coordinate₀ = CLLocation(latitude: latitude, longitude: longitude)
        let coordinate₁ = CLLocation(latitude: latitu, longitude: longitu)
        
        let distanceInMeters = coordinate₀.distance(from: coordinate₁)
        if !key{
            print("__________________________________________")
            print(backageMaxDistance)
        if (backageMaxDistance>0){
        print(distanceInMeters/1000)
        print(backageMaxDistance)
            
        return ((Int(distanceInMeters/1000) <= backageMaxDistance) ? "ضمن الباقة" : "خارج الباقة")
        }
        return "خارج الباقة"
        }
        else{
            return "\(Double(round(10*(distanceInMeters/1000))/10)) كم"
            print("\(distanceInMeters/1000)) km")
//                        return "\(round(10*distanceInMeters/1000)) km"
        }
        
    }
}

struct RemoteImage: View {
   private enum LoadState {
       case loading, success, failure
   }

   private class Loader: ObservableObject {
       var data = Data()
       var state = LoadState.loading

       init(url: String) {
           guard let parsedURL = URL(string: "\(AppImageBase)"+url) else {
               fatalError("Invalid URL: \(url)")
           }

//        if (imageCache.object(forKey:  "\(AppImageBase)"+url as NSString)) != nil {
//            self.data  = (imageCache.object(forKey:  "\(AppImageBase)"+url as NSString))! as Data
//        }
//        else{
            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
//                    imageCache.setObject(self.data as NSData, forKey: ("\(AppImageBase)"+url) as NSString )
//                    imageCache.setObject(self.data as NSData, forKey: (url as NSString))
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
//        }
          
       }
   }

   @StateObject private var loader: Loader
   var loading: Image
   var failure: Image

   var body: some View {
       selectImage()
           .resizable()
   }

   init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
       _loader = StateObject(wrappedValue: Loader(url: url))
       self.loading = loading
       self.failure = failure
   }

   private func selectImage() -> Image {
       switch loader.state {
       case .loading:
           return loading
       case .failure:
           return failure
       default:
           if let image = UIImage(data: loader.data) {
               return Image(uiImage: image)
           } else {
               return failure
           }
       }
   }
}
