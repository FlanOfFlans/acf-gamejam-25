extends Control


func _on_button_pressed():
	GameDataManager.paused = false
	get_parent().get_parent().can_move = true;
	queue_free()


func _on_button_2_pressed() -> void:
	get_tree().quit();
