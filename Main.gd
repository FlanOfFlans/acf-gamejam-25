extends Node2D


func _on_button_pressed():
	get_tree().change_scene_to_file("res:game.tscn") #REPLACE THIS WITH THE ACTUAL GAME WORLD SCENE PATH
