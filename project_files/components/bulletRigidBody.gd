extends RigidBody2D

const BulletScene = preload('res://bullet_02.tscn')

func _physics_process(_delta):
	var mouse_pos = get_global_mouse_position()
	var to_mouse = mouse_pos - global_position
	var angle = atan2(to_mouse.y, to_mouse.x)
	
	rotation = angle

func shoot():
	print('spawning bullet')
	var bullet_instance = BulletScene.instance()
	
	var offset = Vector2(0, -1).rotated(rotation) * 30
	bullet_instance.global_position = global_position + offset
	
	# Assuming the bullet script uses 'direction' as a property.
	bullet_instance.direction = Vector2(cos(rotation), sin(rotation)).normalized()
	
	# Add bullet instance to the scene tree
	get_parent().add_child(bullet_instance)

func _on_reload_timer_timeout():
	print('reload finished')
	shoot()
