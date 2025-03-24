extends PlayerState 

func enter(_previous_state_path: String, _data: Dictionary = {}) -> void:
	player.velocity.y = 0;
	player.velocity.x = -player.speed;
	player.animation_player.play("walk_left");

func update(_delta) -> void:	
	if not Input.is_action_pressed("ui_left"):
		finished.emit(IDLE);
	
	elif Input.is_action_just_pressed("ui_up"):
		finished.emit(WALK_UP);
	
	elif Input.is_action_just_pressed("ui_right"):
		finished.emit(WALK_RIGHT);
	
	elif Input.is_action_just_pressed("ui_down"):
		finished.emit(WALK_DOWN);

	if Input.is_action_just_pressed("interact"):
		player.interact();
