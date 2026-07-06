import SwiftUI

struct ContentView: View {
    @State private var resultText: String = "Press Calculate"

    var body: some View {
        VStack(spacing: 20) {
            Text("Aim Predictor")
                .font(.largeTitle)
                .bold()

            Text(resultText)
                .font(.system(.body, design: .monospaced))
                .multilineTextAlignment(.center)
                .padding()

            Button("Calculate") {
                let player = Vector3(x: 0, y: 0, z: 0)
                let target = Vector3(x: 10, y: 0, z: 5)
                let targetVelocity = Vector3(x: 1, y: 0, z: 0.5)
                let timeToImpact: Float = 2.0

                let predictedTarget = calculateIntercept(
                    targetPos: target,
                    targetVelocity: targetVelocity,
                    timeToTarget: timeToImpact
                )
                let aimDirection = calculateLookAt(currentPos: player, targetPos: predictedTarget)

                resultText = String(
                    format: "Aim Direction:\n[%.4f, %.4f, %.4f]",
                    aimDirection.x, aimDirection.y, aimDirection.z
                )
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

