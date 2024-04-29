extends Node

func rotate_towards_target(target_rotation):
	var rotation_difference = fmod(target_rotation - get_parent().rotation + 3 * PI, 2 * PI) - PI
	var torque = rotation_difference * get_parent().turn_speed
	get_parent().apply_torque(torque)

func move_forward():
	var forward_dir = Vector2.RIGHT.rotated(get_parent().rotation)
	var force = forward_dir * get_parent().speed
	get_parent().apply_central_force(force)
