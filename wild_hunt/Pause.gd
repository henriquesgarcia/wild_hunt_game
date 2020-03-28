extends Node


func _ready() -> void:
	$Label.visible = false


func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == false:
			get_tree().paused = true
			$Label.visible = true
		else:
			get_tree().paused = false
			$Label.visible = false
	
