extends PlayerState 

func enter(_previous_state_path: String, _data: Dictionary = {}) -> void:
	player.velocity.x = 0;
	player.velocity.y = -player.speed;
	player.animation_player.play("walk_up");

func exit() -> void:
	player.animation_player.play("idle_up");

func update(_delta) -> void:	
	if not Input.is_action_pressed("ui_up"):
		finished.emit(IDLE);
	
	elif Input.is_action_just_pressed("ui_left"):
		finished.emit(WALK_LEFT);
	
	elif Input.is_action_just_pressed("ui_right"):
		finished.emit(WALK_RIGHT);
	
	elif Input.is_action_just_pressed("ui_down"):
		finished.emit(WALK_DOWN);
	
	if Input.is_action_just_pressed("interact"):
		player.interact();
