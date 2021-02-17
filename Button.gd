extends TextureButton

export var type = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = type


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
