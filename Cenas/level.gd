extends Node2D

@onready var player = $Player

func _ready():
	player.morreu.connect(resetGame)
	
	
	
func resetGame():
	Global.pontos = 0
	print("reiniciar")
	get_tree().change_scene_to_file("res://Cenas/level.tscn")
	#get_tree().reload_current_scene()
	
