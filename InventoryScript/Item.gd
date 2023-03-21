extends TextureRect
class_name itemTexture



var itemInSLot=true
var quantidade=0
var id=-1



func _ready():
	if !itemInSLot:
		scale=Vector2(5,5)
		texture_filter=CanvasItem.TEXTURE_FILTER_NEAREST




func _get_drag_data(position):
	set_drag_preview(_get_preview_control())
	return self

func _get_preview_control()->Control:
	var preview = duplicate()
	return preview



