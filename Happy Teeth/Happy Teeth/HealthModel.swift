import Foundation
import HealthKit

class HealthModel: ObservableObject {
    static let shared = HealthModel()
    
    var healthStore: HKHealthStore = HKHealthStore()
    var toothbrushingStartTime: Date?
    
    @Published var toothbrushingData: [HKCategorySample] = []
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        } else {
            fatalError("HealthKit not available on this platform!")
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard let toothbrushingType = HKObjectType.categoryType(forIdentifier: .toothbrushingEvent) else {
            print("Tooth brushing data is not supported.")
            return
        }
        
        healthStore.requestAuthorization(toShare: [toothbrushingType], read: nil) { success, error in
            if success {
                completion(true)
            } else {
                print("Failed to request authorization for tooth brushing data: \(error?.localizedDescription ?? "")")
                completion(false)
            }
        }
    }
    
    
    func saveToothBrushingDuration(duration: TimeInterval) {
        let toothbrushingType = HKObjectType.categoryType(forIdentifier: .toothbrushingEvent)!
        
        let toothbrushinggSample = HKCategorySample(type: toothbrushingType, value: HKCategoryValue.notApplicable.rawValue, start: Date(), end: Date(timeIntervalSinceNow: duration))
        
        healthStore.save(toothbrushinggSample) { success, error in
            if success {
                print("Tooth Brushing duration saved successfully.")
            } else {
                print("Failed to save tooth brushing duration: \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    // Start the handwashing activity
    func startToothbrushing() {
        toothbrushingStartTime = Date()
    }
    
    // End the handwashing activity and save the duration
    func endToothBrushing() {
        guard let startTime = toothbrushingStartTime else {
            print("Tooth brushing activity was not started.")
            return
        }
        
        let duration = Date().timeIntervalSince(startTime)
        saveToothBrushingDuration(duration: duration)
        
        // Reset the start time for the next handwashing activity
        toothbrushingStartTime = nil
    }
    
}
