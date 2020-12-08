extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(PackedScene) var falling_block_scn
var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$GameOverLabel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()


func _on_BlockCatcherArea2D_body_entered(body):
	body.queue_free()
	score += 1
	update_score_label()


func game_over():
	$GameOverLabel.visible = true
	get_tree().paused = true

func restart_game():	
	$GameOverLabel.visible = false
	for child in $FallingBlockContainer.get_children():
		child.queue_free()
	
	score = 0
	update_score_label()
	get_tree().paused = false




func _on_SpawnTimer_timeout():	
	var new_node = falling_block_scn.instance()
	new_node.set_position(Vector2(rand_range(5, 195), 10))
	$FallingBlockContainer.add_child(new_node)
	
	if $SpawnTimer.wait_time > 0.1: 
		$SpawnTimer.wait_time -= 0.05
	


func update_score_label():
	$ScoreLabel.text = "Score: " + str(score)
