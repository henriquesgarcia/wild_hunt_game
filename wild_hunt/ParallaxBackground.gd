extends ParallaxBackground

var parallax_offset = Vector2()

func _ready():
	#get_node("ParallaxLayer/Sprite").set_position(Vector2(0,549))
	pass

func _process(delta):
	parallax_offset -=  get_node("/root/world").velocidade * -delta
	set_scroll_offset(parallax_offset)
