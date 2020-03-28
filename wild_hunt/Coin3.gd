extends Area2D



var chao = Vector2(1059,330)

var velocidade = Vector2(-500,0)
onready var player = get_parent().get_node("player")
var tempo_vida = 5


func _ready():
	set_position(chao)
	
	
	pass
	
func _process(delta):
	
	set_position(get_position() + get_node("/root/world").velocidade * delta )
	
	tempo_vida= tempo_vida - delta
	if tempo_vida <= 0:
		
		#get_tree().change_scene("res://menu_inicial.tscn")
		queue_free()

	
func _on_Coin_body_entered(body):
	$fx.play()
	$AnimatedSprite.visible = false
	collision_mask = 0
	$Timer.start()
	$Particles2D.emitting = true
	get_tree().call_group("coin_counter","pick_coin")
	
func _on_Timer_timeout():
	queue_free()
	

