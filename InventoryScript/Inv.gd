
extends Control
class_name Inventory

#Codigo que comanda o inv

#DRAW INV
@export var Colum=4
@export var ItemInColum=5
@onready var PanelSlot:Panel=get_node("InvDraw/Panel")
@onready var Draw:GridContainer = get_node("InvDraw")
var slots={}
#END

#Aonde são guardados os intens
var Inv = {}

#Um ready para desenhar o inv
func _ready():
	PanelSlot.visible=true
	Draw.columns=Colum
	var k=0
	for i in ItemInColum:
		for j in Colum:
			var newSlot = PanelSlot.duplicate()
			slots[k]=newSlot
			k+=1
			Draw.add_child(newSlot)
	PanelSlot.visible=false
	Draw.size=Vector2(Colum*ItemInColum*16,Colum*ItemInColum*16)
	$Grab.size.x=Colum*ItemInColum*16
	$Close.position.x=Colum*ItemInColum*16-$Close.size.x

#O mais importante, ele verifica quais slots tem item
#se tiver ele guarda no Inv.
func VerifyItens():
	#Cada verificação limpamos o Inv, e add o novo inv....
	Inv={}
	for i in slots:
		if slots[i].texture.texture==null:
			slots[i].texture.quantidade=0
			slots[i].change(0)
		else:
			if slots[i].texture.id in Inv:
				Inv[slots[i].texture.id]+=slots[i].texture.quantidade
			else:
				Inv[slots[i].texture.id]=slots[i].texture.quantidade




func _on_close_pressed():
	visible=false
