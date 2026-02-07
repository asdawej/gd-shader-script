@tool class_name GDSSLexer extends RefCounted
## GDSS词法解析器类型。


#region token定义。

# 注解式关键字(后可接括号)。
const TK_SHADER_TYPE := &'@shader_type'
const TK_RENDER_MODE := &'@render_mode'
const TK_UNIFORM := &'@uniform'
const TK_PRECISION := &'@precision'
const TK_MACRO := &'@macro'
const TK_GROUP_UNIFORMS := &'@group_uniforms'

# 注解式关键字(无后接括号)。
const TK_END_GROUP_UNIFORMS := &'@end_group_uniforms'
const TK_FLAT := &'@flat'
const TK_SMOOTH := &'@smooth'
const TK_GLOBAL := &'@global'
const TK_VARYING := &'@varying'
const TK_INSTANCE := &'@instance'

# 关键字。
const TK_CONST := &'const'
const TK_VAR := &'var'
const TK_STRUCT := &'struct'
const TK_FUNC := &'func'
const TK_IF := &'if'
const TK_ELIF := &'elif'
const TK_ELSE := &'else'
const TK_MATCH := &'match'
const TK_CASE := &'case'
const TK_DEFAULT := &'default'
const TK_BREAK := &'break'
const TK_RETURN := &'return'
const TK_FOR := &'for'
const TK_WHILE := &'while'
const TK_DO := &'do'

# 需要单独处理的标点符号。
const TK_COLON := &':'
const TK_RARROW := &'->'
const TK_ASSIGN := &'='
const TK_LPAREN := &'('
const TK_RPAREN := &')'
const TK_LBRACKET := &'['
const TK_RBRACKET := &']'
const TK_LBRACE := &'{'
const TK_RBRACE := &'}'

## 原始代码文本占位符。
const TK_RAW_CODE := &'RAW CODE'

#endregion

## 待解析GDSS代码。
var code: String

## 当前解析位置。
var ptr: int = 0

## [method GDSSLexer.lex]返回体类型。
class GDSSLexRet extends RefCounted:
    ## 解析token序列。
    var tokens: Array[StringName]
    ## 占位符的原始代码字符串序列。
    var raw_codes: Array[String]
    func _init(_tokens: Array[StringName], _raw_codes: Array[String]) -> void:
        tokens = _tokens
        raw_codes = _raw_codes

## GDSS代码词法解析。
func lex() -> GDSSLexRet:
    return GDSSLexRet.new([], [])

func _init(gdss_code: String) -> void:
    code = gdss_code
