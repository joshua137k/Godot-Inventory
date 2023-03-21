extends Panel

#Script do Slot
@export var get_inv:NodePath
@onready var Inv:Control = get_node(get_inv)
@onready var texture=get_node("item")
@onready var Text=get_node("Label")


#Pode Dropar em cima apenas Itens, 
func _can_drop_data(position, data):
	#(texture.id==-1 or texture.id==data.id) Condição nesseraria para impedir que coloquemos 
	#um item diferente de outro no mesmo slot
	var can_drop:bool = data[0] is itemTexture and (texture.id==-1 or texture.id==data[0].id)
	return can_drop


func _drop_data(position, data):
	
	EqualsItens(data)
	Inv.VerifyItens()
	#Verificar se é um item fisico fora do inv, se for
	#ele morre, se for de inv ele apenas apaga a textura
	if !data[0].itemInSLot:
		data[0].queue_free()
	else:
		Dados.ClenSlotData(data)
	
	return self

func EqualsItens(data)->void:
	#Verificar se o item no grab é o mesmo no slot
	if texture.id == data[0].id:
		texture.quantidade+=(data[0].quantidade)
		change(texture.quantidade)
		return
	#Se o item não existir, então vai colocar o item no slot
	texture.id=data[0].id
	texture.texture=data[0].texture
	texture.quantidade=(data[0].quantidade)
	change(texture.quantidade)


#Muda Valor da Label
func change(new):
	if new!=0:
		Text.text=str(new) +"   "+ str(Dados.item.find_key(texture.id))
	else:
		Text.text=" "
	

	




