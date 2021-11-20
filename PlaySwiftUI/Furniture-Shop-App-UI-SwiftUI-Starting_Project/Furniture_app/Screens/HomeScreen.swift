//
//  HomeScreen.swift
//  Furniture_app
//
//  Created by Zero DotOne on 2021/11/19.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex = 0
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                // 👀👀 신기하네
                                ForEach(0 ..< categories.count) { index in
                                    CategoryView(isActive: index == selectedIndex, text: categories[index])
                                        .onTapGesture {
                                            selectedIndex = index
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
//                                    ProductCardView(image: Image("chair_\(index)"), size: 210)
                                    NavigationLink {
                                        DetailScreen()
                                    } label: {
                                        ProductCardView(image: Image("chair_\(index + 1)"), size: 210)
                                    }
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(1 ..< 5) { index in
                                    ProductCardView(image: Image("chair_\(index)"), size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                    }
                }
                
                HStack {
                    BottomNavBarItem(image: Image(systemName: "house")) {}
                    BottomNavBarItem(image: Image(systemName: "heart")) {}
                    BottomNavBarItem(image: Image(systemName: "cart")) {}
                    BottomNavBarItem(image: Image(systemName: "person")) {}
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: .black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button {
                print("Tapped menu")
            } label: {
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button {
                print("Tapped image")
            } label: {
                Image("Profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28.0))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28.0))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var search = ""
    
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8.0)
                
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20.0)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button {
                print("tapped button")
            } label: {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .font(.system(size: 14.0))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            
            if isActive {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: 210, height: 200 * (size / 210))
                .cornerRadius(3.0)
            
            Text("Luxury Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: 210)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            image
                .frame(maxWidth: .infinity)
        }
    }
}

