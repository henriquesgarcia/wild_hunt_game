extends KinematicBody2D

onready var COLETOR = preload("res://COLETOR.gd").new()

var chao = Vector2(300,476)
var mato_pos = Vector2(1059,448)
var velocidade_pulo = -700
var gravidade = 3500
var velocidade= Vector2(650,0)
var modificador_gravidade = 0.88
var tempo = 0.0
var tempo1 = 0.0
var tempo2 =0.0
var intervalo1 = 0.8
var intervalo2 = 0.5
var intervalo3 = 10.0
var moedas = [preload("res://Coin.tscn"),
preload("res://Coin2.tscn"),
preload("res://Coin3.tscn"),
]
var obstaculos = [preload("res://jacare.tscn"),
preload("res://snake.tscn"),
preload("res://monkey.tscn"),
preload("res://arm1.tscn"),
preload("res://mato2.tscn"),
preload("res://mato1.tscn"),
preload("res://mato3.tscn"),
preload("res://mato3.tscn"),
preload("res://arm2.tscn"),
preload("res://placa1.tscn"),
preload("res://obs4.tscn"),
preload("res://bomba.tscn")

]

var life = 3
var leoa =preload("res://leoa.tscn")	
var intervalo_min_obs = 1.0
var intervalo_max_obs = 2.0
var intervalo_min_c = 1.0
var intervalo_max_c = 1.5
var intervalo_min_b = 50.0
var intervalo_max_b = 100.0
var tempo_dv = 0.0
var intervalo_dv = 0.5 
onready var mask = collision_mask
onready var layer = collision_layer
enum{IDLE,RUNNING,DEAD}
var status = RUNNING
var chao_d = Vector2(200,476)
onready var world = get_node("//root//world")
var bonus = [preload("res://bonus.tscn"),preload("res://bonus2.tscn"),preload("res://bonus3.tscn")]

func _ready():
	
	set_position(chao)
	set_position(mato_pos)
	
	randomize()
	$Sprite.play("idle")
	pass
	

func _physics_process(delta):
	
	if status == RUNNING:
		running(delta)
		
	elif status == DEAD:
		
		dead(delta)
	elif status != DEAD:
		#if position.y > ProjectSettings.get_setting("display/window/size/height"):
		killed()
			
	
	tempo += delta
	tempo1 +=delta
	tempo_dv += delta
	tempo2 +=delta
	
	if tempo >= intervalo1:
		tempo = 0
		
		#decide obstaculos

		var c = rand_range(0,obstaculos.size())
		get_parent().add_child(obstaculos[c].instance())
		
		
		
		#decide novo intervalo
		var t = rand_range(intervalo_min_obs,intervalo_max_obs)
		
	if tempo1 >= intervalo2:
		tempo1 = 0
		
		var mo = rand_range(0,moedas.size())
		get_parent().add_child(moedas[mo].instance())
		
		var t2 = rand_range(intervalo_min_c,intervalo_max_c)
	
	if tempo2 >= intervalo3:
			tempo2 = 0
			print(intervalo3)
		

			var b = rand_range(0,bonus.size())
			get_parent().add_child(bonus[b].instance())
			var t3 = rand_range(intervalo_min_b,intervalo_max_b)

		
func running(delta):
	move_and_slide(velocidade,chao)	
		
	if Input.is_action_pressed("pular"):
		$Sprite.play("jump")
		velocidade.y += gravidade*delta

	else:
		velocidade.y += gravidade * delta * modificador_gravidade
		$Sprite.play("run")
	if Input.is_action_just_pressed("pular") and position == chao:
		$Sprite.play("jump")
		velocidade.y = velocidade_pulo
		
	position += velocidade * delta
	
	if get_position().y > chao.y:

		set_position(chao)
		velocidade = Vector2()


func dead(delta):
	$Sprite.play("dead")
	
	
func killed():
	if status != DEAD:
		life -=1
		if life == 2:
			get_parent().get_node("CanvasLayer/pata").hide()
		elif life == 1:
			get_parent().get_node("CanvasLayer/pata2").hide()
		elif life == 0:
			get_parent().get_node("CanvasLayer/pata3").hide()
			status = DEAD
			
			#save_data.last_score = COLETOR.pick_coin()
			#if COLETOR.pick_coin() > save_data.best_score:
			#	save_data.best_score = COLETOR.pick_coin()
			
			get_parent().get_node("musica").stop()
			get_parent().add_child(leoa.instance())
			set_position(chao_d)
			get_parent().get_node("CanvasLayer/pata").hide()
			get_parent().get_node("CanvasLayer/pata2").hide()
			get_parent().get_node("CanvasLayer/pata3").hide()
			
			collision_mask = 0
			collision_layer = 0
			save_data.last_score = get_parent().get_node("CanvasLayer/COLETOR").coins
			if get_parent().get_node("CanvasLayer/COLETOR").coins > save_data.best_score:
				save_data.best_score = get_parent().get_node("CanvasLayer/COLETOR").coins
		if tempo_dv >= intervalo_dv:
			tempo_dv = 0.0
			intervalo_dv -= 0.5
			get_node("/root/world").velocidade = Vector2(-300,0)
			
			if intervalo_dv <= 0:
				get_node("/root/world").velocidade = Vector2(-700,0) 
	
		



func _on_Sprite_animation_finished() -> void:
	
	if status == DEAD:
		get_tree().change_scene("res://menu_game_over.tscn")

