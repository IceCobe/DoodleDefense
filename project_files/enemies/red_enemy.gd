extends RigidBody2D

# Speed at which the enemy moves.
@export var speed: float = 50
@export var turn_speed: float = 3000

# Direction the enemy is traveling. Downwards is along the positive Y-axis.
var target_direction: Vector2 = Vector2.LEFT

func _ready():
	target_direction = target_direction.normalized()

func _physics_process(_delta):
	$movement_node.rotate_towards_target(PI / 2)
	$movement_node.move_forward()
