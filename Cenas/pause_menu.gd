extends CanvasLayer

@onready var level = $".."

var game_paused = false

func _ready():
	visible = false

func _on_quit_bt_pressed():
	get_tree().quit()

func _on_reiniciar_bt_pressed():
	get_tree().paused = false
	level.resetG4ame()

func _on_voltar_bt_pressed():
	get_tree().paused = false
	visible = false	

func _unhandled_input(event): #quando pausar
	if event.is_action_pressed("pause"):
		game_paused = !game_paused
		get_tree().paused = game_paused #pausar o jogo
		visible = game_paused
