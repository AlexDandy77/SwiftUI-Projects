import SwiftUI

struct LengthConverterView: View {
    @State private var sourceLength = 0.0
    @State private var targetLength = 0.0
    let lengthOptions = ["Millimeters", "Centimeters", "Meters", "Kilometers"]
    @State private var sourceSelection = "Centimeters"
    @State private var targetSelection = "Meters"
    
    func getUnit(from label: String) -> UnitLength {
        switch label {
        case "Millimeters": return .millimeters
        case "Centimeters": return .centimeters
        case "Meters": return .meters
        case "Kilometers": return .kilometers
        default: return .centimeters
        }
    }
    var convertedLength: Double {
        let input = Measurement(value: sourceLength, unit: getUnit(from: sourceSelection))
        let output = input.converted(to: getUnit(from: targetSelection))
        return output.value
    }
    
    var body: some View{
        NavigationStack {
            Form {
                Section("From:") {
                    TextField("Length", value: $sourceLength, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Source", selection: $sourceSelection) {
                        ForEach(lengthOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("To:") {
                    Text(convertedLength, format: .number)
                        .foregroundColor(.blue)
                        .bold()
                    
                    Picker("Target", selection: $targetSelection) {
                        ForEach(lengthOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Length Converter")
        }
    }
}