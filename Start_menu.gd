extends Control

# Start_menu



func _on_Start_pressed():
	get_tree().change_scene("res://World1.tscn")


func _on_Exit_pressed():
	get_tree().quit()
