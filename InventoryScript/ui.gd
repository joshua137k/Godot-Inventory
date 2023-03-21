extends Panel


#Basicamente a tela aonde os nosso inventario podem se movimentar
#Se for inventario pode aqui ser dropado

@onready var InvsOpened={}
@onready var InvSceane=preload("res://inv.tscn")


func _ready():
	var NewInv = InvSceane.instantiate()
	NewInv.get_node("Title").text="Player"
	add_child(NewInv)
	InvsOpened["Player"]=NewInv


func _can_drop_data(position, data):
	var can_drop:bool = data is Inventory
	return can_drop


#Muda a pos do inv
func _drop_data(position, data):
	data.position=get_viewport().get_mouse_position()
	return self





func _on_player_pressed():
	InvsOpened["Player"].visible=true


func _on_chest_pressed():
	var NewInv = InvSceane.instantiate()
	NewInv.get_node("Title").text="Chest"
	add_child(NewInv)
	InvsOpened["Chest"]=NewInv
	$VBoxContainer/HBoxContainer/Chest.disabled=true


func _on_open_chest_pressed():
	InvsOpened["Chest"].visible=true

#New itens create
func _on_new_item_pressed():
	var new = itemTexture.new()
	new.itemInSLot=false
	new.quantidade=1
	new.position=get_viewport().get_mouse_position()
	var rand=randi() % Dados.items.size()
	new.texture=Dados.items[rand]
	new.id=rand
	add_child(new)
