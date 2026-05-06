@tool
class_name BoardCreator
extends Node

@export var width: int = 10
@export var depth: int = 10
@export var height: int = 8
@export var pos: Vector2i
var _oldPos: Vector2i
var tiles = {}

var tileViewPrefab = preload("res://Prefabs/Tile.tscn")
var tileSelectionIndicatorPrefab = preload("res://Prefabs/TileSelector.tscn")
var marker

func _init():
	if tiles == null:
		tiles = {}

func _ready():
	marker = tileSelectionIndicatorPrefab.instantiate()
	add_child(marker)
	
	pos = Vector2i(0,0)
	_oldPos = pos

func _process(delta):
	if pos != _oldPos:
		_oldPos = pos
		_UpdateMarker()

func _UpdateMarker():
	if tiles.has(pos):
		var t: Tile = tiles[pos]
		marker.position = t.Center()
	else:
		marker.position = Vector3(pos.x, 0, pos.y)


func Clear():
	for key in tiles:
		tiles[key].free()
	tiles.clear()
	print("Clear Pressed")

func Grow():
	_GrowSingle(pos)
	print("Grow Pressed")

func Shrink():
#	_ShrinkSingle(pos)
	print("Shrink Pressed")

func _GrowSingle(p: Vector2i):
	var t: Tile = _GetOrCreate(p)
	if t.height < height:
		t.Grow()
		_UpdateMarker()
		#why is this look recursive?

func _GetOrCreate(p: Vector2i):
	if tiles.has(p):
		return tiles[p]
	var t: Tile = _Create()
	t.Load(p, 0)
	tiles[p] = t
	
	return t

func _Create():
	var instance = tileViewPrefab.instantiate()
	add_child(instance)
	return instance


func GrowArea():
	print("GrowArea Pressed")
func ShrinkArea():
	print("ShrinkArea Pressed")
func Save():
	print("Save Pressed")
func Load():
	print("Load Pressed")
func SaveJSON():
	print("SaveJSON Pressed")
func LoadJSON():
	print("LoadJSON Pressed")
