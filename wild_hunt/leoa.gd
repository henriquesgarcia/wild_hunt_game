extends Area2D
var tempo = 0.0
var intervalo = 5
var velocidade = Vector2(620,0)
var chao = Vector2(100,460)


func _ready():
		set_position(chao)
		$leoa.play("run")
		$rugido.play()
		

	
func _process(delta):
	tempo += delta
	
	if tempo >= intervalo:
		$leoa.hide()
		

	
