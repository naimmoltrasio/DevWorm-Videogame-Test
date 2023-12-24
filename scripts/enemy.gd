extends CharacterBody2D

var speed = 60
var player_chase = false
var player = null


func _physics_process(delta):
	if player_chase:
		position += (player.position - position) / speed
		move_and_collide(Vector2(0,0))
		$AnimatedSprite2D.play("walk")
	
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h  = true
		else:
			$AnimatedSprite2D.flip_h  = false
	else:
		$AnimatedSprite2D.play("idle")


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true



func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
