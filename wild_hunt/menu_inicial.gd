extends Node


func _on_Button_pressed() -> void:
	get_tree().quit()


func _on_btn_iniciar_pressed() -> void:
	get_tree().change_scene("res://world.tscn")
