extends Control


func _ready() -> void:
	$ColorRect/Resume.grab_focus()


func _physics_process(delta: float) -> void:
	
	if $ColorRect/Resume.is_hovered() == true:
		$ColorRect/Resume.grab_focus()
	
	if $ColorRect/Quit.is_hovered() == true:
		$ColorRect/Quit.grab_focus()


func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("ui_cancel"):
		$ColorRect/Resume.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible


func _on_Resume_pressed() -> void:
	get_tree().paused = not get_tree().paused
	visible = not visible


func _on_Quit_pressed() -> void:
	get_tree().change_scene("res://menu_game_over.tscn")
