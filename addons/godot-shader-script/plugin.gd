@tool extends EditorPlugin


const dock_scn := preload('res://addons/godot-shader-script/dock.tscn')

var dock: EditorDock

func _enter_tree() -> void:
	dock = EditorDock.new()
	dock.title = 'GDSS Translator'
	dock.default_slot = EditorDock.DOCK_SLOT_BOTTOM
	dock.available_layouts = \
		EditorDock.DOCK_LAYOUT_HORIZONTAL | \
		EditorDock.DOCK_LAYOUT_FLOATING
	dock.add_child(dock_scn.instantiate())
	add_dock(dock)

func _exit_tree() -> void:
	remove_dock(dock)
	dock.queue_free()
