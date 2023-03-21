extends Panel
class_name InvDraw

func _get_drag_data(position):
	set_drag_preview(_get_preview_control())
	return get_parent()

func _get_preview_control()->Control:
	var preview = get_parent().duplicate()
	return preview




