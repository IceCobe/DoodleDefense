extends Node2D

var EnemyScene = preload('res://enemy.tscn')

# Define the coordinate ranges for spawning enemies
var x_range = Vector2(100, 1000)  # Enemies can spawn between x=100 and x=400
var y_range = Vector2(100, 100)  # Enemies can spawn between y=100 and y=300

func _on_timer_timeout():
	var enemy = EnemyScene.instantiate()  # Create an instance of the enemy

	# Generate a random position within the defined ranges
	var random_position = Vector2(
		randf_range(x_range.x, x_range.y),
		randf_range(y_range.x, y_range.y)
	)
	
	# Generate a random rotation between 0 and 2π radians
	var random_rotation = randf_range(0, 2 * PI)
	
	enemy.position = random_position  # Set the enemy's position to the random position
	enemy.rotation = random_rotation  # Set the enemy's rotation to the random rotation
	
	get_parent().add_child(enemy)  # Add the enemy to the scene tree
