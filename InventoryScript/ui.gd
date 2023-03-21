extends Panel


#Basicamente a tela aonde os nosso inventario podem se movimentar
#Se for inventario pode aqui ser dropado

@onready var InvsOpened={"Player":get_node("Inv")}





func _can_drop_data(position, data):
	var can_drop:bool = data is Inventory
	return can_drop


#Muda a pos do inv
func _drop_data(position, data):
	data.position=get_viewport().get_mouse_position()
	return self


#New itens create
func _on_chest_2_pressed():
	var new = itemTexture.new()
	new.itemInSLot=false
	new.quantidade=1
	new.position=get_viewport().get_mouse_position()
	var rand=randi() % Dados.items.size()
	new.texture=Dados.items[rand]
	new.id=rand
	add_child(new)


func _on_player_pressed():
	InvsOpened["Player"].visible=true
