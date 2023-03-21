extends Button

func _can_drop_data(position, data):
	#(texture.id==-1 or texture.id==data.id) Condição nesseraria para impedir que coloquemos 
	#um item diferente de outro no mesmo slot
	var can_drop:bool = data is itemTexture
	return can_drop


func _drop_data(position, data):
	if !data.itemInSLot:
		data.queue_free()
	else:
		Dados.ClenSlotData(data)

	return self
