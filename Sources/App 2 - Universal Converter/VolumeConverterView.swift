import SwiftUI

struct VolumeConverterView: View {
    @State private var sourceVolume = 0.0
    @State private var targetVolume = 0.0
    let volumeOptions = ["Milliliters", "Liters", "Cubic Meters"]
    @State private var sourceSelection = "Liters"
    @State private var targetSelection = "Cubic Meters"
    
    func getUnit(from label: String) -> UnitVolume {
        switch label {
        case "Milliliters": return .milliliters
        case "Liters": return .liters
        case "Cubic Meters": return .cubicMeters
        default: return .liters
        }
    }
    var convertedVolume: Double {
        let input = Measurement(value: sourceVolume, unit: getUnit(from: sourceSelection))
        let output = input.converted(to: getUnit(from: targetSelection))
        return output.value
    }
    
    var body: some View{
        NavigationStack {
            Form {
                Section("From:") {
                    TextField("Volume", value: $sourceVolume, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Source", selection: $sourceSelection) {
                        ForEach(volumeOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("To:") {
                    Text(convertedVolume, format: .number)
                        .foregroundColor(.blue)
                        .bold()
                    
                    Picker("Target", selection: $targetSelection) {
                        ForEach(volumeOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Volume Converter")
        }
    }
}