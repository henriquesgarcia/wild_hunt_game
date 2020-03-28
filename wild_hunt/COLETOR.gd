extends Node2D


var coins = 0

var pontuacao = 5


func _ready():
	
	update_label()
	add_to_group("coin_counter")
	
	pass


func pick_coin():
	coins += pontuacao
	update_label()
	

func update_label():
	$coins.text = str(coins)


