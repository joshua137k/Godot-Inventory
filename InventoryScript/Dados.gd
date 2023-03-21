extends Node

#Script aonde guardo os ids
enum item {Preto, Vermelho, Verde}
var items=[]

func _ready():
	
	for i in item:
		items.append(load("res://ItensSprite/"+str(i)+".png"))



