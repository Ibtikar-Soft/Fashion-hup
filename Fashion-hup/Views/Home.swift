//
//  Home.swift
//  Fashion-hup
//
//  Created by Sandal on 20/02/1443 AH.
//

import SwiftUI
import GoogleSignIn
import FirebaseAuth
struct Home: View {
    /// serch
    var searchPlaceHolde:String="البحث"
    @State var searchKey=""
    @State var nowIteam = true
    ///
    
    // advace search
    @State var advance_serch = false//true
    
    ////
    
    @State var show_iteam_description = false
    @State var view_comments =  false
    @State var ratings:[ProductRating]=[ProductRating(id: 1, rate: 3, rateDate: "", delegateName: "محمد عبدالكريم", comment: "هذا نص تجريبي لاختبار شكل و حجم النصوص و طريقة عرضها في هذا المكان و حجم و لون الخط حيث يتم التحكم في هذا النص وامكانية تغييرة في اي وقت عن طريق ادارة الموقع "),
                                        ProductRating(id: 2, rate: 5, rateDate: "", delegateName: "محمد عبدالكريم", comment: "هذا نص تجريبي لاختبار شكل و حجم النصوص و طريقة عرضها في هذا المكان و حجم و لون الخط حيث يتم التحكم في هذا النص وامكانية تغييرة في اي وقت عن طريق ادارة الموقع "),
                                        ProductRating(id: 3, rate: 1, rateDate: "", delegateName: "محمد عبدالكريم", comment: "هذا نص تجريبي لاختبار شكل و حجم النصوص و طريقة عرضها في هذا المكان و حجم و لون الخط حيث يتم التحكم في هذا النص وامكانية تغييرة في اي وقت عن طريق ادارة الموقع "),
                                        ProductRating(id: 4, rate: 4, rateDate: "", delegateName: "محمد عبدالكريم", comment: "هذا نص تجريبي لاختبار شكل و حجم النصوص و طريقة عرضها في هذا المكان و حجم و لون الخط حيث يتم التحكم في هذا النص وامكانية تغييرة في اي وقت عن طريق ادارة الموقع "),
                                        ProductRating(id: 5, rate: 5, rateDate: "", delegateName: "محمد عبدالكريم", comment: "هذا نص تجريبي لاختبار شكل و حجم النصوص و طريقة عرضها في هذا المكان و حجم و لون الخط حيث يتم التحكم في هذا النص وامكانية تغييرة في اي وقت عن طريق ادارة الموقع ")]
    
    @State var counter = 1
    @State var searchShopBySection:[ShopList]=[]
    @Namespace var animeition
    @State var selected = -1
    
    @State var selected_product:ShopList=ShopList(shopID: 1, branchID: "1", branchName: "", name: "", logo: "", status: false, x: "", y: "", rate: 2, shopTag: [])
    @State var shopBySection:GetShopBySection=GetShopBySection(
        shopList: [
            ShopList(shopID: 1, branchID: "1", branchName: "sa", name: "sda", logo: "dsa", status: false, x: "12,323", y: "21.13", rate: 15,
                     shopTag: [
                        ShopTag(branchsTagsID: 1, shopID: 1, tagID: 1),
                        ShopTag(branchsTagsID: 11, shopID: 1, tagID: 2)
                     ]),
            ShopList(shopID: 2, branchID: "1", branchName: "dsds", name: "adas", logo: "ddadasa", status: false, x: "12,323", y: "21.13", rate: 5, shopTag: [ShopTag(branchsTagsID: 1, shopID: 1, tagID: 2)]),
            
            ShopList(shopID: 3, branchID: "2", branchName: "sdsaa", name: "sdsada", logo: "dsrta", status: false, x: "12,323", y: "21.13", rate: 5, shopTag: [ShopTag(branchsTagsID: 1, shopID: 1, tagID: 3)])
        ], sectionTag:  [
            SectionTag(tagID: -1, sectionID: 1, tagName: "الكل"),
            SectionTag(tagID: 1, sectionID: 2, tagName: "رجالي"),
            SectionTag(tagID: 2, sectionID: 3, tagName: "نسائي"),
            SectionTag(tagID: 3, sectionID: 4, tagName: "اطفالي")
        ])
    var body: some View {
        ScrollView{
        ZStack{
            
        VStack{
            
            
            
            HStack{
               
                HStack( spacing: 15){
                    
                    TextField(searchPlaceHolde,text: $searchKey, onEditingChanged: { edit in
                        checkProgressState()
                    }, onCommit: {
                        checkProgressState()
                    })
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                }.font(.system(size: 15)).frame(width:UIScreen.width*0.8,height:40).padding(.horizontal,12)
                .background(Color.white)
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.4)
                    )
                Spacer()
//                    Button(action: {
//
//                    }, label: {
//                        Image(systemName: "bag.fill").foregroundColor(.AppPrimaryColor)
//                    })
               
            }.frame(width:UIScreen.width*0.8).padding(.top,10)

            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:9){
                    ForEach(shopBySection.sectionTag,id:\.self){ tab in
                        categoryTabButton(title: tab, animation: animeition, selected: $selected).rotation3DEffect(Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                        if shopBySection.sectionTag.last != tab{Spacer(minLength: 0)}
                    }
                }.padding(.vertical,20)
                .padding(.horizontal,10)
                
                //                .flipsForRightToLeftLayoutDirection(true)
            }.padding(.horizontal,5)
            Spacer()
                    if selected == -1 {
                        
                            VStack(spacing:5){
                            HStack{
                                
                                Text("المنتجات الاحدث").font(.custom(Fount_name.reguler.rawValue, size: 18))
                                Spacer()
                            }.padding(.horizontal).padding(.vertical,5)
                       
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                                                        Spacer()
                                        ForEach(shopBySection.shopList,id:\.shopID){ prod in
                                            ProductsCard(product: prod,show_iteam_description: $show_iteam_description, selected_product: $selected_product).foregroundColor(.AppFount)
                                            
                                        }

                            }.font(.custom("STC-Regular", size: 16))//.flipsForRightToLeftLayoutDirection(true)
//                                .padding(.leading,5)

                        }
                            
                            HStack{
                                Text("المنجات الاكثر مبيعا").font(.custom(Fount_name.reguler.rawValue, size: 18))
                                Spacer()
                            }.padding(.horizontal).padding(.vertical,5)
                       
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                        ForEach(shopBySection.shopList,id:\.shopID){ prod in
                                            ProductsCard(product: prod,show_iteam_description: $show_iteam_description, selected_product: $selected_product).foregroundColor(.AppFount)
                                        }
                            }.font(.custom("STC-Regular", size: 16))//.flipsForRightToLeftLayoutDirection(true)

                            }.padding(.leading,5)
                            
                            HStack{

                                Text("العروض").font(.custom(Fount_name.reguler.rawValue, size: 18))
                                Spacer()
                            }.padding(.horizontal).padding(.vertical,5)
                       
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    Spacer()
                                        ForEach(shopBySection.shopList,id:\.shopID){ prod in
                                            ProductsCard(product: prod,show_iteam_description: $show_iteam_description, selected_product: $selected_product).foregroundColor(.AppFount)
                                        }

                            }.font(.custom("STC-Regular", size: 16))//.flipsForRightToLeftLayoutDirection(true)

                            }.padding(.leading,5)
                                                        Spacer()
                        }
                        Group{
                        /*
                        
                        
                        ForEach((searchShopBySection.count != 0 ? searchShopBySection : shopBySection.shopList),id:\.shopID){ prod in
                            //                                if prod.status {
                            //                            NavigationLink(destination: SupCategories(subcategor: prod,AllBasketIteam:AllBasketIteam).background(Color.white.ignoresSafeArea(.all,edges: .all))) {
                            //                                ProductsCard(product: prod).foregroundColor(.AppFontColor)
                            //                            }
                            //                            }
                            //                                else{
                            ProductsCard(product: prod,show_iteam_description: $show_iteam_description, selected_product: $selected_product).foregroundColor(.AppFount)
                            //                                }
                        }
                        */
                        }
                    
        }
                    else {
                        ZStack(alignment: .top){
                       
                        VStack{
                            HStack{
                        ForEach((searchShopBySection.count != 0 ? searchShopBySection : shopBySection.shopList),id:\.shopID){ prod in
                            ForEach(prod.shopTag,id:\.tagID){ shoptag in
                                
                                                                if shoptag.tagID == selected{
                                //                                    if  prod.status {
                                //                                    NavigationLink(destination: SupCategories(subcategor: prod,AllBasketIteam:AllBasketIteam).background(Color.white.ignoresSafeArea(.all,edges: .all))) {
                                    ProductsCard(product: prod,show_iteam_description: $show_iteam_description, selected_product: $selected_product).foregroundColor(.AppFount)
                                
                                                                    }
                                                                }
                        }
                            Spacer()
                            }.padding(.leading,5)
                            .padding(.horizontal,15)
                            Spacer()
                        }.padding(.top,60)
                            HStack{
                                FilteView(advance_serch: $advance_serch)
                            }
                        }
                    }
        }
            if show_iteam_description{
                ZStack{
                    Color.white
                    VStack{
                        HStack{
                            Text("رسم إسم")
                            Spacer()
                            Image(systemName: "arrow.forward").resizable().frame(width: 30, height: 20, alignment: .bottom)
                                .onTapGesture {
                                show_iteam_description=false
                            }
                        }.padding().font(.custom(Fount_name.reguler.rawValue, size: 15))
//                        Spacer()
                        if !view_comments{
                            
                        
                        Group{
                        VStack{
                           
                            HStack{
                            Image(systemName:"heart.circle.fill").resizable().background(Color.white).foregroundColor(.AppPrimaryColor).frame(width: 30, height: 30, alignment: .center)
                                .clipShape(Circle())
                                .padding().shadow(color: .gray, radius: 3, x: 3, y: 3)
                                Spacer()
                                VStack(spacing:1){
                                    
                                        ZStack{
                                            HStack(spacing:0){                                    Text("11").foregroundColor(.gray)
                                                Text(palance_coine)
                                            }
                                            Rectangle().fill(Color.AppPrimaryColor).frame(width:25,height:1)
                                    }.font(.custom(Fount_name.reguler.rawValue, size: 10))
                                    HStack(spacing:3){
                                    Text("7")
                                    .font(.custom(Fount_name.reguler.rawValue, size: 14)).foregroundColor(.gray)
                                        Text(palance_coine)
                                       }.font(.custom(Fount_name.reguler.rawValue, size: 12))
                                }.padding(.horizontal)
                            }
                            AsyncImage(
                                                url: URL(string:AppImageBase+"UploadFiles/429092021121941.png")!,
                                                placeholder: { Image(app_logo)},
                                                image: { Image(uiImage: $0).resizable() }
                            ).frame(width: 130, height: 130).clipShape(Rectangle())
                            
                            
                            
                            VStack{
                                HStack{
                                    Text("شراء")
                                    Spacer()
                                    Text("عرض")
                                    Spacer()
                                    Text("المفضلة")
                                }.font(.custom(Fount_name.reguler.rawValue, size: 13)).foregroundColor(.AppPrimaryColor)
                                
                                    HStack{
                                        Text("99")
                                        Spacer()
                                        Text("247")
                                        Spacer()
                                        Text("170")
                                    }.font(.custom(Fount_name.reguler.rawValue, size: 11)).foregroundColor(.AppFount)
                            
                            }.padding(.horizontal).frame( height: 40, alignment: .center)
                            
                            
                            
                            VStack(spacing:5){
                                HStack{
                                    Text("الاحجام")
                                    Spacer()
                                    Text("الكمية")
                                    Spacer()
                                    Text("الالوان")
                                }.font(.custom(Fount_name.reguler.rawValue, size: 13)).foregroundColor(.AppPrimaryColor)
                                
                                    HStack{
                                        Text("1 2 3 4")
                                        Spacer()
                                        HStack{
                                            Button(action: {
                                                counter += 1
                                            }, label: {
                                                Image(systemName: "plus").foregroundColor(.white).font(.custom(Fount_name.reguler.rawValue, size: 15))
                                            }).padding(5)
                                            
                                            Text(StringFunction().numberStrToEnglish(numberStr:"\( counter)")).frame(width: 60,height: 35).background(Color.white).foregroundColor(.AppFount)
                                                .font(.custom(Fount_name.reguler.rawValue, size: 15))
                                            Button(action: {
                                                counter -= 1
                                            }, label: {
                                                Image(systemName: "minus").foregroundColor(.white).font(.custom(Fount_name.reguler.rawValue, size: 15))
                                            }).padding(5)
                                        }.frame( height: 40).background(Color.AppPrimaryColor).cornerRadius(15)
                                        Spacer()
                                        HStack{
                                            Circle().fill(Color.red).frame(width: 20, height: 20, alignment: .center)
                                            Circle().fill(Color.green).frame(width: 20, height: 20, alignment: .center)
                                            Circle().fill(Color.blue).frame(width: 20, height: 20, alignment: .center)
                                        }
                                    }.font(.custom(Fount_name.reguler.rawValue, size: 13)).foregroundColor(.AppPrimaryColor)
                            
                            }.padding(.horizontal).frame( height: 70, alignment: .center)

                            Spacer()
                            Button(action: {}, label: {
                                HStack{
//                                    Spacer()
                                    Text("أضف الى السلة")
                                        .font(.custom(Fount_name.reguler.rawValue, size: 15))
                                        .frame(width: UIScreen.width*0.8,height: 40, alignment: .center).background(Color.AppPrimaryColor).foregroundColor(.white)
                                    
//                                    Spacer()
                                }
                                
                            })
                        }.frame(width: UIScreen.width*0.75, height: UIScreen.hight*0.5, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 0.1)
                                .shadow(color: .gray, radius: 0.2, x: 3, y: 3)
//                                .shadow(color: .white, radius: -0.2, x: -3, y: -3)
                        ).cornerRadius(20)
                        //
                        
                    }
                        }
                        Group{
                            HStack{
                                VStack(spacing:5){
                                Text("الوصف")
                                    .foregroundColor(!view_comments ? .black : .AppPrimaryColor)
                                    .font(.custom(Fount_name.bold.rawValue, size: 17)).onTapGesture {
                                        withAnimation(.easeIn(duration: 0.5)){
                                            view_comments.toggle()
                                        }
                                    }
//                                     .background(Color.AppPrimaryColor).foregroundColor(.white)
                                    Rectangle().fill(Color.AppPrimaryColor).frame(height:3).opacity(
                                        
                                        view_comments ? 0 : 1
                                        
                                    )
                                }
                                Spacer()
                                VStack(spacing:5){
                                    Text("التعليقات")
                                        .foregroundColor(view_comments ? .black : .AppPrimaryColor)
                                        .font(.custom(Fount_name.bold.rawValue, size: 17)).onTapGesture {
                                            withAnimation(.easeOut(duration: 0.5)){
                                            view_comments.toggle()
                                        }
                                    }
//                                     .background(Color.AppPrimaryColor).foregroundColor(.white)
                                    Rectangle().fill(Color.AppPrimaryColor).frame(height:3).opacity(
                                        
                                        view_comments ? 1 : 0
                                        
                                    )
                                }
                               
//                                    .background(Color.AppPrimaryColor).foregroundColor(.white)
                            }
                            if !view_comments{
                            Text("ذا نص تجريبي لاختبار شكل و حجم النصوص و طريقة عرضها في هذا المكان و حجم و لون الخط حيث يتم التحكم في هذا النص وامكانية تغييرة في اي وقت عن طريق ادارة الموقع . يتم اضافة هذا النص كنص تجريبي للمعاينة فقط وهو لا يعبر عن أي موضوع محدد انما لتحديد الشكل العام للقسم او الصفحة أو الموقع.")
                                .frame(width: UIScreen.width*0.8)
                                .font(.custom(Fount_name.reguler.rawValue, size: 13))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                
                            }
//                            Spacer()
                        }.frame(width: UIScreen.width*0.75)

                            if view_comments{
                        VStack{
//
                            ScrollView(.vertical,showsIndicators: false){

                    //
                                if ratings.count > 0{
                                    
                                    ForEach(ratings,id:\.self){accountRate in

                                    ProductRatingCard(accountRating:accountRate)
                                    }
                                    
                                }
                                else{
                                    Text("لايوجد تقيم بعد")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.AppPrimaryColor)
                                        .padding(15)
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(4)
                                }
                            }
                                
                            Spacer()
                        }
                        
                            }
                        
                        Spacer()
                    }
                }//.ignoresSafeArea()
            }
            if advance_serch{
                ZStack{
                    Color.AppPrimaryColor.opacity(0.5)
                    AdvanceSearch(advance_serch: $advance_serch)
                }.ignoresSafeArea().frame(height:UIScreen.hight)
            }
        }
        }.onTapGesture {
            hideKeyboard()
        }
    }
    
    func checkProgressState(){
        
        searchShopBySection = shopBySection.shopList.filter(){$0.name.contains(searchKey)}
        
        nowIteam = ( !searchKey.isEmpty && (searchShopBySection.count == 0)) ? true : false
        
    }
}
