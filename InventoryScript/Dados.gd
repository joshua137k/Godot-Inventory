extends Node

#Script aonde guardo os ids
enum item {Preto, Vermelho, Verde}
var items=[]

func _ready():
	
	for i in item:
		items.append(load("res://ItensSprite/"+str(i)+".png"))



func ClenSlotData(data)->void:
	data[0].texture=null
	data[0].id=-1
	data[0].id=-1
	data[0].quantidade=0
	data[1].Text.text=""
	data[1].Inv.VerifyItens()
