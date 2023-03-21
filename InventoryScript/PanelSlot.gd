extends Panel

#Script do Slot

@onready var texture=get_node("item")
@onready var Inv=get_parent().get_parent()


#Pode Dropar em cima apenas Itens, 
func _can_drop_data(position, data):
	#(texture.id==-1 or texture.id==data.id) Condição nesseraria para impedir que coloquemos 
	#um item diferente de outro no mesmo slot
	var can_drop:bool = data is itemTexture and (texture.id==-1 or texture.id==data.id)
	return can_drop


func _drop_data(position, data):
	
	EqualsItens(data)
	
	#Verificar se é um item fisico fora do inv, se for
	#ele morre, se for de inv ele apenas apaga a textura
	if !data.itemInSLot:
		data.queue_free()
	else:
		data.texture=null
		data.id=-1
	
	Inv.VerifyItens()
	
	return self

func EqualsItens(data)->void:
	#Verificar se o item no grab é o mesmo no slot
	if texture.id == data.id:
		texture.quantidade+=(data.quantidade)
		change(texture.quantidade)
		return
	#Se o item não existir, então vai colocar o item no slot
	texture.id=data.id
	texture.texture=data.texture
	texture.quantidade=(data.quantidade)
	change(texture.quantidade)


#Muda Valor da Label
func change(new):
	if new!=0:
		$Label.text=str(new) +"   "+ str(Dados.item.find_key(texture.id))
	else:
		$Label.text=" "
	

	




