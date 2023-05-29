
//
//  ContentView.swift
//  Happy Teeth
//
//  Created by Nicolas Amory P.F on 23/05/23.
//

import SwiftUI
import AVKit

//class GlobalString: ObservableObject {
//    @Published var isPresented :Bool =  false
//}
//var isPresented :Bool = false


struct AchievementView: View {
    @Binding var activePage: AppPage
//    @StateObject var globalString = GlobalString()

//    @Environment(\.dismiss) private var dismiss
//    @State private var isPresented: Bool = false
    
    let audioPlayer = AVPlayer(url: Bundle.main.url(forResource: "Great Job", withExtension: "mp3")!)
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Text("Great Job!")
                    .font(.largeTitle)
                    .offset(x: 0, y: 220)
                
                Image("Thropy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 820, height: 820)
                    .padding(.top, 0)
                
                Button(action: {
                    activePage = .start
                }) {
                  
                }
                
                Spacer()
            }
        }
        .onAppear {
            audioPlayer.play()
            HealthModel.shared.endToothBrushing()
        }
    }
}




struct AchievementView_Previews: PreviewProvider {
    
    static var previews: some View {
     
            AchievementView(activePage: .constant(.thropyStep))

        

    }
}


