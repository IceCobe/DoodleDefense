extends RigidBody2D

# Speed at which the enemy moves.
@export var speed: float = 50
@export var torque_strength: float = 1000

# Direction the enemy is traveling. Downwards is along the positive Y-axis.
var direction: Vector2 = Vector2.LEFT

func _ready():
	direction = direction.normalized()

func _physics_process(_delta):
	rotate_towards_target()
	move_forward()

func rotate_towards_target():
	var target_rotation = PI / 2
	var rotation_difference = fmod(target_rotation - rotation + 3 * PI, 2 * PI) - PI
	var torque = rotation_difference * torque_strength
	apply_torque(torque)

func move_forward():
	var forward_dir = Vector2.RIGHT.rotated(rotation)
	var force = forward_dir * speed
	apply_central_force(force)
