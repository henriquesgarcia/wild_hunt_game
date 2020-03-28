extends Node2D

var velocidade = Vector2(-700,0)


func _ready():
	$musica.play()

func _process(delta):
	
	velocidade.x -= delta/2
	
 
func mudar_velocidade():
	velocidade.x = 0
	
	
