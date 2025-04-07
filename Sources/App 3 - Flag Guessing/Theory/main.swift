// Stacks
// VStack - automatically
// HStack - horizontal
// ZStack - z-axis

VStack(spacing: 20) {
    Text("Hello, world!")
}

VStack(alignment: .leading) {
    Text("Hello, world!")
}

HStack(spacing: 30) {
    Text("Hello, world!")
}

VStack {
    Spacer()
    Text("First")
    Text("Second")
    Text("Third")
    Spacer()
    Spacer()
}

ZStack {
    Text("Hello, world!")
    Text("This is inside a stack")
}

// Colors and Frames
ZStack {
    Text("Your content")
}
.background(.red)

// or
ZStack {
    Text("Your content")
        .background(.red)
}

// full background
ZStack {
    Color.red
    Text("Your content")
}

Color.red
    .frame(width: 200, height: 200)

Color.red
    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)

Color(red: 1, green: 0.8, blue: 0)

ZStack {
    Color.red
    Text("Your content")
}
.ignoresSafeArea()    


ZStack {
    VStack(spacing: 0) {
        Color.red
        Color.blue
    }   

    Text("Your content")
        .foregroundStyle(.secondary)
        .padding(50)
        .background(.ultraThinMaterial)
}
.ignoresSafeArea()

// Gradients
LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)

LinearGradient(stops: [
    Gradient.Stop(color: .white, location: 0.45),
    Gradient.Stop(color: .black, location: 0.55),
], startPoint: .top, endPoint: .bottom)

LinearGradient(stops: [
    .init(color: .white, location: 0.45),
    .init(color: .black, location: 0.55),
], startPoint: .top, endPoint: .bottom)

RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)

AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)

Text("Your content")
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .foregroundStyle(.white)
    .background(.red.gradient)

// Buttons and images
Button("Delete section") {
    print("Now deleting...")
}

struct ContentView: View {
    var body: some View {
        Button("Delete section", action: executeDelete)
    }

    func executeDelete() {
        print("Now deleting")
    }
}

Button("Delete section", role: .destructive, action: executeDelete)

VStack {
    Button("Button 1") { }
        .buttonStyle(.bordered)
    Button("Button 2", role: .destructive) { }
        .buttonStyle(.bordered)
    Button("Button 3") { }
        .buttonStyle(.borderedProminent)
        .tint(.mint)
    Button("Button 4", role: .destructive) { }
        .buttonStyle(.borderedProminent)
}

Button {
    print("Button was tapped")
} label: {
    Text("tap me")
        .padding()
        .foregroundStyle(.white)
        .background(.red)
}

Image("pencil")
Image(decorative: "pencil")
Image(systemName: "pencil")

Button {
    print("Edit button was tapped")
} label: {
    Image(systemName: "pencil")
}

Button("Edit", systemImage: "pencil") {
    print("Edit button was tapped")
}

Button {
    print("Edit button was tapped")
} label: {
    Label("Edit", systemImage: "pencil")
        .padding()
        .foregroundColor(.white)
        .background(.red)
}

// Alerts
struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Alexei is watching you.")
        }
    }
}



