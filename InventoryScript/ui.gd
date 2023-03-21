extends Panel


#Basicamente a tela aonde os nosso inventario podem se movimentar
#Se for inventario pode aqui ser dropado

@onready var InvsOpened={}
@onready var InvSceane=preload("res://InventorySceane/inv.tscn")


func _ready():
	createInv("Player")


func _can_drop_data(position, data):
	var can_drop:bool = data is Inventory
	return can_drop


#Muda a pos do inv
func _drop_data(position, data):
	data.position=get_viewport().get_mouse_position()
	return self


func _on_player_pressed():
	InvsOpened["Player"][0].visible=true


func _on_chest_pressed():
	createInv("Chest")
	$VBoxContainer/HBoxContainer/Chest.disabled=true


func _on_open_chest_pressed():
	InvsOpened["Chest"][0].visible=true


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


func _on_save_pressed():
	var file = FileAccess.open(Dados.filePath, FileAccess.WRITE)
	file.store_var(InvsOpened)



func _on_load_pressed():
	if FileAccess.file_exists(Dados.filePath):
		var file = FileAccess.open(Dados.filePath, FileAccess.READ)
		var test=file.get_var()
		for i in test:
			if not(i in InvsOpened):
				createInv(i)
			InvsOpened[i][1]=test[i][1]

		for i in InvsOpened:
			InvsOpened[i][0].Inv=InvsOpened[i][1]
			InvsOpened[i][0].DrawLoaded()
	else:
		print("file not found")

func createInv(Name:String)->void:
	var NewInv = InvSceane.instantiate()
	NewInv.get_node("Title").text="Player"
	add_child(NewInv)
	InvsOpened[Name]=[NewInv,NewInv.Inv]
