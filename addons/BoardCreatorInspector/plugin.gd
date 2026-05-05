@tool
extends EditorPlugin
var plugin

func _enable_plugin():
	# Add autoloads here.
	pass


func _disable_plugin():
	# Remove autoloads here.
	pass


func _enter_tree():
	# Initialization of the plugin goes here.
	plugin = preload("res://addons/BoardCreatorInspector/BoardCreatorInspector.gd").new().add_inspector_plugin(plugin)


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_inspector_plugin(plugin)
