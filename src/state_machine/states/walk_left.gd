extends PlayerState 

func enter(previous_state_path: String, data: Dictionary = {}) -> void:
	player.velocity.x = player.speed
	player.animation_player.play("walk_left");

func update(delta) -> void:	
	if Input.is_action_pressed("ui_up"):
		finished.emit(WALK_UP);
	
	elif Input.is_action_pressed("ui_down"):
		finished.emit(WALK_DOWN);
	
	elif Input.is_action_pressed("ui_right"):
		finished.emit(WALK_RIGHT);
	
	elif not Input.is_action_pressed("ui_left"):
		finished.emit(IDLE);
	
