extends TextureRect
class_name itemTexture


@export var get_inv:NodePath
@onready var GetedInv:Panel = get_node(get_inv)
var itemInSLot=true
var quantidade=0
var id=-1



func _ready():
	if !itemInSLot:
		scale=Vector2(5,5)
		texture_filter=CanvasItem.TEXTURE_FILTER_NEAREST




func _get_drag_data(position):
	set_drag_preview(duplicate())
	return [self,GetedInv]





