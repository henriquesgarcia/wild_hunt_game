extends Node2D
var loaded_stage
var world = preload("res://world.tscn" )	
enum {MENU,LOADING,LOADED}
var status = MENU
var current_stage = world.get_state()
func _ready():
	add_to_group("game")




func load_stage():
	if loaded_stage != null:
		loaded_stage.queue_free()
	loaded_stage = load(current_stage).instance()
	add_child(loaded_stage) 
	
func player_died():
	load_stage()		
		
