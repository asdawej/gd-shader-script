@tool class_name GDSSParser extends RefCounted
## GDSS语法解析器类型。


## token序列。
var tokens: Array[StringName]

## 占位符的原始代码字符串序列。
var raw_codes: Array[String]

## GDSS token语法解析。
func parse() -> Array[GDSSASTNode]:
    return []

func _init(lexer_ret: GDSSLexer.GDSSLexRet) -> void:
    tokens = lexer_ret.tokens
    raw_codes = lexer_ret.raw_codes
