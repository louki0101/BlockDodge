extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SPEED = 180

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_pressed("ui_left"):
		move_and_slide(Vector2(-SPEED, 0))
	if Input.is_action_pressed("ui_right"):
		move_and_slide(Vector2(SPEED, 0))


func _on_HitArea2D_body_entered(body):
	if body.is_in_group("hitable"):
		get_parent().game_over()
