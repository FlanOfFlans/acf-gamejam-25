extends PlayerState 

func enter(previous_state_path: String, data: Dictionary = {}) -> void:
	player.velocity.y = player.speed
	player.animation_player.play("walk_down");

func update(delta) -> void:	
	if Input.is_action_pressed("ui_up"):
		finished.emit(WALK_UP);
	
	elif Input.is_action_pressed("ui_right"):
		finished.emit(WALK_RIGHT);
	
	elif Input.is_action_pressed("ui_left"):
		finished.emit(WALK_LEFT);
	
	elif not Input.is_action_pressed("ui_down"):
		finished.emit(IDLE);
	
