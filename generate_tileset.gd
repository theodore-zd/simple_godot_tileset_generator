extends Node
tool

export(String) var Name = "Test" 
export(int) var Size = 16
export(int) var Horizontal_Tile_Count = 32 
export(int) var Vertical_Tile_Count = 40
export(String, FILE) var Tileset_Image_Path = "res://Full.png"

var output = """[gd_resource type="TileSet" load_steps=2 format=2]

[ext_resource path="{#path}" type="Texture" id=1]
	
[resource]
"""

var chunk = """{#ID}/name = "{#ID} . {#name}"
{#ID}/texture = ExtResource( 1 )
{#ID}/tex_offset = Vector2( 0, 0 )
{#ID}/modulate = Color( 1, 1, 1, 1 )
{#ID}/region = Rect2( {#x}, {#y}, {#size}, {#size})
{#ID}/tile_mode = 0
{#ID}/occluder_offset = Vector2( 0, 0 )
{#ID}/navigation_offset = Vector2( 0, 0 )
{#ID}/shape_offset = Vector2( 0, 0 )
{#ID}/shape_transform = Transform2D( 1, 0, 0, 1, 0, 0 )
{#ID}/shape_one_way = false
{#ID}/shape_one_way_margin = 0.0
{#ID}/shapes = []
{#ID}/z_index = 0
"""


func save(content):
	var file = File.new()
	file.open("user://"+Name+".tres", File.WRITE)
	file.store_string(content)
	file.close()

func _ready():
	var msg
	
	##  Error Handling -----------------
	#assert( Tileset_Image_Path,  "ERROR: Please set script variables, image path not set")
	#assert( Name != null or Name != "",  "ERROR: Please set script variables, name not set")
	#assert( Horizontal_Tile_Count != 0,  "ERROR: Please set script variables, horizontal tile count must be greater than 0")
	#assert( Vertical_Tile_Count != 0,  "ERROR: Please set script variables, vertical tile count must be greater than 0")
	#assert( Size != 0,                   "ERROR: size must be greater than 0")
	
	## Show Error
	if(Tileset_Image_Path == null):
		msg = "ERROR: Please set script variables, image path not set"
	elif(Name == null or Name == ""):
		msg = "ERROR: Please set script variables, name not set"
	elif(Horizontal_Tile_Count == 0):
		msg = "ERROR: Please set script variables, horizontal tile count must be greater than 0"
	elif(Vertical_Tile_Count == 0):
		msg = "ERROR: Please set script variables, vertical tile count must be greater than 0"
	elif(Size == 0):
		msg = "ERROR: size must be greater than 0"
	
	msg = """All DONE!
	
	WHERE TO FIND EXPORTED TILE SET
	
	"""
	msg = msg+ProjectSettings.globalize_path("res://")+Name+".tres"+"""
	
	unfortunelty I can't get godot to export outside of the user:// namespace
	
	"""
	print(Tileset_Image_Path)
	
	## Set Image Path -----------------
	print(output)
	print("output---------")
	output=output.replace("{#path}",Tileset_Image_Path)
	print(output)
	## Compose Tile Data -----------------
	var tileId = 0
	
	for yIndex in Horizontal_Tile_Count:
		for xIndex in Vertical_Tile_Count:
			var data = chunk
			data=data.replace("{#ID}",String(tileId))
			data=data.replace("{#name}",Name)
			data=data.replace("{#size}",Size)
			data=data.replace("{#y}",yIndex*Size)
			data=data.replace("{#x}",xIndex*Size)
			output = output+data
			tileId=tileId+1
	save(output)
	$TEXT.text = msg
