extends Area2D

var chao = Vector2(900,462.600)
var velocidade = Vector2(-400,0)
onready var player = get_parent().get_node("player")
var tempo_vida = 5



func _ready():
	set_position(chao)
	

func _physics_process(delta):
	
	set_position(get_position() + get_node("/root/world").velocidade * delta )
	
	tempo_vida= tempo_vida - delta
	if tempo_vida <= 0:
		
		#get_tree().change_scene("res://menu_inicial.tscn")
		queue_free()
