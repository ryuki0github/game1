extends Area2D

@onready var player = $"../Player"


func _on_body_entered(body): #colidir com armadilha
	if body.name == "Player":#somente se o player
		print("Levou dano?")
		player._levouDano(1)
