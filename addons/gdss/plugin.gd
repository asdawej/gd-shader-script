@tool extends EditorPlugin


const dock_scn := preload('res://addons/gdss/dock.tscn')
var dock: EditorDock

const gdss_importer_gds := preload('res://addons/gdss/gdss_import_plugin.gd')
var gdss_importer: EditorImportPlugin

func _enter_tree() -> void:
	gdss_importer = gdss_importer_gds.new()
	add_import_plugin(gdss_importer)
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
	remove_import_plugin(gdss_importer)
	gdss_importer = null
