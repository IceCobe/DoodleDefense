extends RigidBody2D

# Speed at which the enemy moves.
var speed = 50
var torque_strength = 1000

# Direction the enemy is traveling. Downwards is along the positive Y-axis.
var direction = Vector2(-1, 0)

func _ready():
	direction = direction.normalized()


func _physics_process(_delta):
	var target_rotation = PI / 2
	# Calculate the shortest rotation direction
	var rotation_difference = fmod(target_rotation - rotation + 3 * PI, 2 * PI) - PI
	# Apply an angular velocity to rotate towards the target rotation
	var torque = rotation_difference * torque_strength

	# Apply the calculated torque
	apply_torque(torque)
	
	# Calculate the forward direction vector based on the current rotation
	var forward_dir = Vector2.RIGHT.rotated(rotation)
	
	# Apply a force in the forward direction
	apply_central_force(forward_dir * speed)
