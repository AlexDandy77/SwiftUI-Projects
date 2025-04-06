import SwiftUI

struct TimeConverterView: View {
    @State private var sourceTime = 0.0
    @State private var targetTime = 0.0
    let timeOptions = ["Seconds", "Minutes", "Hours"]
    @State private var sourceSelection = "Minutes"
    @State private var targetSelection = "Seconds"
    
    func getUnit(from label: String) -> UnitDuration {
        switch label {
        case "Seconds": return .seconds
        case "Minutes": return .minutes
        case "Hours": return .hours
        default: return .seconds
        }
    }
    var convertedTime: Double {
        let input = Measurement(value: sourceTime, unit: getUnit(from: sourceSelection))
        let output = input.converted(to: getUnit(from: targetSelection))
        return output.value
    }
    
    var body: some View{
        NavigationStack {
            Form {
                Section("From:") {
                    TextField("Time", value: $sourceTime, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Source", selection: $sourceSelection) {
                        ForEach(timeOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("To:") {
                    Text(convertedTime, format: .number)
                        .foregroundColor(.blue)
                        .bold()
                    
                    Picker("Target", selection: $targetSelection) {
                        ForEach(timeOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Time Converter")
        }
    }
}