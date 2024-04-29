extends RigidBody2D

# Speed at which the enemy moves.
@export var speed: float = 50
@export var torque_strength: float = 1000

func _physics_process(_delta):
	move_forward()
	rotate_towards_target()

func move_forward():
	var forward_dir = Vector2.RIGHT.rotated(rotation)
	get_parent().move_and_collide(forward_dir * speed)

func rotate_towards_target():
	var target_rotation = PI / 2
	var rotation_difference = fmod(target_rotation - rotation + 3 * PI, 2 * PI) - PI
	var torque = rotation_difference * torque_strength
	get_parent().apply_torque(torque)
