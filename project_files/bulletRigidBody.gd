extends RigidBody2D

# Speed at which the bullet moves.
var speed = 20

# Direction the bullet is traveling. Should be normalized.
var direction = Vector2(1, 0)

func _ready():
	# Ensure the direction is normalized to avoid faster diagonal movement.
	direction = direction.normalized()

func _physics_process(delta):
	# Move the bullet in the specified direction.
	var velocity = direction * speed
	move_and_collide(velocity)
