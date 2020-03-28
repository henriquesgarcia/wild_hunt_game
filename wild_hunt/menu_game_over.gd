extends Control

onready var COLETOR = preload("res://COLETOR.gd")

func _ready() -> void:
	
	#get_node("moeda/qtd_moedas").set_script(COLETOR.pick_coin())
	
	$gameover_music.play(1.0)
	#$moeda/qtd_moedas.text = "" + str(COLETOR._ready())
	
	#exibir as pontuações best e last
	$last_score.text = "LAST: " + str(save_data.last_score)
	$best_score.text = "BEST: " + str(save_data.best_score)


func _on_btn_sair_pressed() -> void:
	get_tree().change_scene("res://menu_inicial.tscn")


func _on_btn_reiniciar_pressed() -> void:
	get_tree().change_scene("res://world.tscn")

