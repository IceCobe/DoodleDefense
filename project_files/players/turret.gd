extends RigidBody2D

var BulletScene = preload('res://components/bullet.tscn')

func _physics_process(_delta):
	var mouse_pos = get_global_mouse_position()
	var to_mouse = mouse_pos - global_position
	var angle = atan2(to_mouse.y, to_mouse.x)
	
	rotation = angle

func shoot():
	var bullet_instance = BulletScene.instantiate()
	
	var offset = Vector2(1, 0).rotated(rotation) * 30
	bullet_instance.global_position = global_position + offset

	bullet_instance.rotation = rotation
	bullet_instance.direction = Vector2(cos(rotation), sin(rotation)).normalized()
	get_parent().add_child(bullet_instance)

func _on_reload_timer_timeout():
	shoot()
