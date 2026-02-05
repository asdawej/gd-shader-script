@tool extends EditorImportPlugin


func _get_importer_name() -> String:
	return 'godotshaderscript'

func _get_visible_name() -> String:
	return 'Godot Shader Script'

func _get_recognized_extensions() -> PackedStringArray:
	return ['gdss']

func _get_save_extension() -> String:
	return 'gdshader'

func _get_resource_type() -> String:
	return 'Shader'

func _import(
	source_file: String,
	save_path: String,
	options: Dictionary,
	platform_variants: Array[String],
	gen_files: Array[String]
) -> Error:
	var file = FileAccess.open(source_file, FileAccess.READ)
	if not file:
		return FileAccess.get_open_error()
	var gdss_code := file.get_as_text()
	var gdshader_code := GDSSTranslator.translate(gdss_code)
	var shader := Shader.new()
	shader.code = gdshader_code
	return ResourceSaver.save(shader, save_path + '.' + _get_save_extension())
