import Foundation

struct Vector3 {
    var x: Float
    var y: Float
    var z: Float
}

/// Calculates the normalized look-at direction from currentPos to targetPos
func calculateLookAt(currentPos: Vector3, targetPos: Vector3) -> Vector3 {
    var direction = Vector3(
        x: targetPos.x - currentPos.x,
        y: targetPos.y - currentPos.y,
        z: targetPos.z - currentPos.z
    )

    let magnitude = sqrt(direction.x * direction.x +
                          direction.y * direction.y +
                          direction.z * direction.z)

    if magnitude > 0 {
        direction.x /= magnitude
        direction.y /= magnitude
        direction.z /= magnitude
    }
    return direction
}

/// Predicts target position based on velocity and time-to-impact (lead calculation)
func calculateIntercept(targetPos: Vector3, targ

