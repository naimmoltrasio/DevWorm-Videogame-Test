extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.game_first_loadin:
		$player.position.x = Global.player_start_posx
		$player.position.y = Global.player_start_posy
	else:
		$player.position.x = Global.player_exit_cliffside_posx
		$player.position.y = Global.player_exit_cliffside_posy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene()


func _on_cliffside_transition_point_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true


#func _on_cliffside_transition_point_body_exited(body):
	#pass
	#if body.has_method("player"):
	#	print("sale")
	#	Global.transition_scene = false

func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "world":
			get_tree().change_scene_to_file("res://scene/cliff_side.tscn")
			Global.game_first_loadin = false
			Global.finish_changescene()
			



