extends Control


func _on_button_pressed():
	GameDataManager.paused = false
	queue_free()
