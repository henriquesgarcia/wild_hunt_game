extends Area2D

var chao = Vector2(1000,290)

var velocidade = Vector2(-400,0)
onready var player = get_parent().get_node("player")
var tempo_vida = 5
var tempo_int = 0.0
var intervalo = 3


func _ready():
	set_position(chao)
	
	
	pass
	
func _process(delta):
	
	set_position(get_position() + get_node("/root/world").velocidade * delta )
	tempo_vida= tempo_vida - delta
	if tempo_vida <= 0:
		
		#get_tree().change_scene("res://menu_inicial.tscn")
		queue_free()
	tempo_int+=delta
	
		
	
func _on_bonus2_body_entered(body):
	$mus.play()
	collision_mask = 0
	queue_free()
	if  get_parent().get_node("player").life == 3:
		#get_parent().get_node("player").life += 1
		
		
		if tempo_int >= intervalo:
			tempo_int = 0.0
			intervalo -= 0.5
			get_node("/root/world").velocidade = Vector2(-800,0) 
			
			
			if intervalo == 0 :
			 
				get_node("/root/world").velocidade = Vector2(-700,0) 
		
	
	
	elif get_parent().get_node("player").life == 2:
		get_parent().get_node("player").life += 1
		get_parent().get_node("CanvasLayer/pata").show()

		
				
	elif get_parent().get_node("player").life == 1:
		get_parent().get_node("player").life += 1
		get_parent().get_node("CanvasLayer/pata2").show()
	
	var life = get_parent().get_node("player").life
	print(life)
	
	
	queue_free()	
