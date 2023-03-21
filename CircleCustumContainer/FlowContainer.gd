
extends Container
var TileSize=16
var points = []

func _ready():
	for i in range(0,225,45):
		var x = -cos(deg_to_rad(i))*2
		var y = -sin(deg_to_rad(i))*2
		points.append(Vector2(x, y)*TileSize)
	RePosition()

func _notification(what):
	if what==NOTIFICATION_SORT_CHILDREN:
		RePosition()

func RePosition():
	var x = 0
	for child in get_children():
		# Fit to own size*
		#x"2 + Y"2 = 1
		if child.visible==true:
			fit_child_in_rect(child, Rect2(points[x], child.size))
			x+=1
		



func set_some_setting():
	# Some setting changed, ask for children re-sort.
	queue_sort()
