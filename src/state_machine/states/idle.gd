extends PlayerState

func enter(_previous_state_path: String, _data: Dictionary = {}) -> void:
	player.velocity.x = 0;
	player.velocity.y = 0;

func update(_delta) -> void:
	if not player.can_move: return;
	
	if Input.is_action_pressed("ui_up"):
		finished.emit(WALK_UP);

	elif Input.is_action_pressed("ui_right"):
		finished.emit(WALK_RIGHT);
	
	elif Input.is_action_pressed("ui_down"):
		finished.emit(WALK_DOWN);
			
	elif Input.is_action_pressed("ui_left"):
		finished.emit(WALK_LEFT);
		
	if Input.is_action_just_pressed("interact"):
		player.interact();
