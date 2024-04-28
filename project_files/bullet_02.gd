extends RigidBody2D

# Speed at which the bullet moves.
var speed = 200

# Direction the bullet is traveling. Should be normalized.
var direction = Vector2(1, 0)

func _ready():
	# Ensure the direction is normalized to avoid faster diagonal movement.
	direction = direction.normalized()
	# Set the bullet's linear velocity.
	linear_velocity = direction * speed
