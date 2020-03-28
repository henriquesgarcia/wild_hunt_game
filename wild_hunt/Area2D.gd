extends Area2D


var chao = Vector2(1059,518)
var velocidade = Vector2(-500,0)
onready var player = get_parent().get_node("player")



func _ready():
	set_position(chao)
	#$Sprite.play("walk")
	connect("area_entered",player,"colidiu")
	
	
func _physics_process(delta):
	set_position(get_position() + velocidade * delta )
	

#func _on_body_tree_entered():
#	pass # Replace with function body.
