extends Control

@onready var item_cont = $MarginContainer/HBoxContainer/item_contador as Label
@onready var timer_count = $MarginContainer/HBoxContainer2/timer_count as Label
@onready var timer = $"../Timer" as Timer

var segundos = 0 
var minutos = 0

@export_range(0,2) var minuto_padrao = 1
@export_range(0,59) var segundo_padrao = 0

func _ready():
	item_cont.text = str("%03d" % Global.pontos)
	timer_count.text = str("%02d" % minuto_padrao + ":" + "%02d" % segundo_padrao)#start
	
	segundos = segundo_padrao
	minutos = minuto_padrao

func _process(delta): #roda sempre
	item_cont.text = str("%03d" % Global.pontos)
	
	#if Global.relogio != 0:
	#	segundos +=  Global.relogio
	#	Global.relogio -= Global.relogio # zerar
		 

func _on_timer_timeout():
	if segundos == 0:
		if minutos > 0:
			minutos -= 1
			segundos = 60
	
	segundos -=1
	
	
	timer_count.text = str("%02d" % minutos + ":" + "%02d" % segundos)
