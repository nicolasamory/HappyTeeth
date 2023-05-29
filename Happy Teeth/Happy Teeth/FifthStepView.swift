import SwiftUI
import AVKit

struct FifthStepView: View {
    
    @State private var timerFlagPause: Bool = false
    @State private var timeRemaining = 20
    @State private var timer: Timer?
    @Binding var activePage: AppPage

    let audioPlayer = AVPlayer(url: Bundle.main.url(forResource: "Fifth Step", withExtension: "mp3")!)
    
    var body: some View {
        
        ZStack {
            
            BackgroundView()
                .ignoresSafeArea()
            
            Image("Gigi5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 800, height: 800)
            
            
            Image("Arrow1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 600, height: 600)
                .offset(x: 20, y: 250)
            
            
            VStack {
                HStack {
                    
                    Button(action: {
                        if timer == nil {
                            startTimer()
                            timerFlagPause = false
                        } else {
                            pauseTimer()
                            timerFlagPause = true
                        }
                    }) {
                        Image(systemName: timer == nil ? "play.circle.fill" : "pause.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                    }

                }
                .padding(.leading, -170)
                
                Text("\(timeRemaining)")
                    .font(.system(size: 80))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 4, x:0, y:1)

                Spacer()

            }
            .padding(.top, 100)
        }
        .onAppear {
            startTimer()
            audioPlayer.play()
        }
        .onChange(of: timeRemaining) { newValue in
            if newValue == 0 {
            activePage = .sixthStep
            audioPlayer.pause()
                    }
                }
    
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.timer?.invalidate()
                self.timer = nil
            }
        }
    }
    
    func pauseTimer() {
        timerFlagPause = true
        timer?.invalidate()
        timer = nil
    }
            
    
}

struct FifthStepView_Previews: PreviewProvider {
    
    static var previews: some View {
        FifthStepView(activePage: .constant(.fifthStep))
    }
}

