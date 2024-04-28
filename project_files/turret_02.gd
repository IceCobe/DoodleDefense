extends RigidBody2D

var BulletScene = preload('res://bullet_02.tscn')

func _physics_process(_delta):
	var mouse_pos = get_global_mouse_position()
	var to_mouse = mouse_pos - global_position
	var angle = atan2(to_mouse.y, to_mouse.x)
	
	rotation = angle

func shoot():
	var bullet_instance = BulletScene.instantiate()  # Make sure to use `.instance()` here
	
	var offset = Vector2(1, 0).rotated(rotation) * 30
	bullet_instance.global_position = global_position + offset

	# Here we set the bullet's rotation to match the turret's rotation.
	bullet_instance.rotation = rotation
	
	# Assuming the bullet script uses 'direction' as a property.
	# This line might be unnecessary if the bullet's script automatically
	# sets its movement based on its rotation. If not, it's required.
	bullet_instance.direction = Vector2(cos(rotation), sin(rotation)).normalized()
	
	# Add bullet instance to the scene tree
	get_parent().add_child(bullet_instance)

func _on_reload_timer_timeout():
	shoot()
