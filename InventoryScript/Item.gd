extends TextureRect
class_name itemTexture


@export var get_inv:NodePath
var GetedInv:Panel 
var itemInSLot=true
var quantidade=0
var id=-1



func _ready():
	if !itemInSLot:
		scale=Vector2(5,5)
		texture_filter=CanvasItem.TEXTURE_FILTER_NEAREST




func _get_drag_data(position):
	set_drag_preview(duplicate())
	if !itemInSLot:
		return [self,null]
	return [self,get_node(get_inv)]





