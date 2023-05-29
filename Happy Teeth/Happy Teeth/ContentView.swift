import SwiftUI
import HealthKit

struct ContentView: View {
    @State var activePage: AppPage = .start
    var healthModel: HealthModel

    
    var body: some View {
        switch activePage {
        case .start:
            StartView(activePage: $activePage, health: healthModel)
        case .firstStep:
            FirstStepView(activePage: $activePage)
        case .secondStep:
            SecondStepView(activePage: $activePage)
        case .thirdStep:
            ThirdStepView(activePage: $activePage)
        case .fourthStep:
            FourthStepView(activePage: $activePage)
        case .fifthStep:
            FifthStepView(activePage: $activePage)
        case .sixthStep:
            SixthStepView(activePage: $activePage)
        case .seventhStep:
            SeventhStepView(activePage: $activePage)
        case .thropyStep:
            AchievementView(activePage: $activePage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(healthModel: HealthModel())
    }
}

struct StartView: View {
    @Binding var activePage: AppPage
    var health: HealthModel

    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 1000, height: 1000)
                    .padding(.top, -350)
                
                Image("Mascot")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.top, -350)
                
                Button(action: {
//                    print("kepencet kok")
                    activePage = .firstStep
                    
                }) {
                    Text("Start Brush")
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(width: 300, height: 40)
                        .background(Color.yellow)
                        .cornerRadius(20)
                        .offset(x: 0, y: 0)
                        .shadow(color: .black, radius: 5, x: 1, y: 5)
                }
                
                Spacer()
            }
            .onAppear{
                health.requestAuthorization { success in
                    if !success {
                        print("Access not granted!")
                    }
                }
            }
        }
    }
}

enum AppPage {
    case start
    case firstStep
    case secondStep
    case thirdStep
    case fourthStep
    case fifthStep
    case sixthStep
    case seventhStep
    case thropyStep
}
