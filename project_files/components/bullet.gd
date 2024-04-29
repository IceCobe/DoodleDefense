extends RigidBody2D

# Expose variables for easy adjustment in the editor.
@export var speed: float = 1000
@export var direction: Vector2 = Vector2.RIGHT

# Ready Function
func _ready():
	initialize_bullet()

# Function to initialize the bullet's velocity.
func initialize_bullet():
	direction = direction.normalized() # Ensure direction is normalized to maintain consistent speed.
	linear_velocity = direction * speed
