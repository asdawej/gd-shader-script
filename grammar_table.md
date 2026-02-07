Here lists the grammar correspondences between Godot Shading Language (abbr. as GSL) and GDSS:

## Comments

GSL:

```glsl
// Single-line comment.
int a = 0; // Another single-line comment.

/*
Multi-line
comment.
*/

/**
 * Multi-line
 * documentation comment.
 */
unifrom int b = 0;

/** Single-line documentation comment. */
uniform int c = 0;
```

GDSS:

```gdscript
# Single-line comment.
var a: int = 0 # Another single-line comment.

# Multi-line
# comment.

## Multi-line
## documentation comment.
@uniform var b: int = 0

## Single-line documentation comment.
@uniform var c: int = 0
```

## Precision

GSL:

```glsl
lowp vec4 a = vec4(0.0, 1.0, 2.0, 3.0);
mediump vec4 a = vec4(0.0, 1.0, 2.0, 3.0);
highp vec4 a = vec4(0.0, 1.0, 2.0, 3.0);
```

GDSS:

```gdscript
@precision(low) var a: vec4 = vec4(0.0, 1.0, 2.0, 3.0)
@precision(medium) var a: vec4 = vec4(0.0, 1.0, 2.0, 3.0)
@precision(high) var a: vec4 = vec4(0.0, 1.0, 2.0, 3.0)
```

## Arrays

GSL:

```glsl
int arr1[3] = int[3] (0, 1, 2);
bool arr2[] = { true, true, false };
const lowp vec3 arr3[1] = lowp vec3[1] (vec3(0, 0, 1));

float arr4[3];
arr4[0] = 1.0;
COLOR.r = arr4[0];
```

GDSS:

```gdscript
var arr1: int[3] = { 1.0, 0.5, 0.0 }
var arr2: bool[] = { true, true, false }
@precision(low) const arr3: vec3[1] = { vec3(0, 0, 1) }

var arr4: float[3]
arr4[0] = 1.0
COLOR.r = arr4[0]
```

## Structs

GSL:

```glsl
struct PointLight {
    int field1;
};
```

GDSS:

```gdscript
struct PointLight:
    var field1: int
```

## Operators

GSL:

```glsl
// Only display the difference.
&&
||
```

GDSS:

```gdscript
# Only display the difference.
and
or
```

## Flow control

GSL:

```glsl
if (cond) {
    something1;
} else if (other_cond) {
    something2;
} else {
    something3;
}

int result = cond ? 1 : 2;

switch (i) {
    case -1:
        break;
    case 0:
        return;
    case 1:
    default:
        break;
}

for (int i = 0; i < 10; i++) {
    something;
}

while (cond) {
    something
}

do {
    something
} while (cond);
```

GDSS:

```gdscript
if cond:
    something1
elif other_cond:
    something2
else:
    something3

var result: int = cond ? 1 : 2

match i:
    case -1:
        break
    case 0:
        return
    case 1:
    default:
        break

for (i: int = 0; i < 10; i++):
    something

while cond:
    something

do:
    something
while cond
```

## Functions

GSL:

```glsl
int sum(int a, int b) {
    return a + b;
}
```

GDSS:

```gdscript
func sum(a: int, b: int) -> int:
    return a + b
```

## Varyings

GSL:

```glsl
varying vec3 color;
```

GDSS:

```gdscript
@varying var color: vec3
```

## Interpolation qualifiers

GSL:

```glsl
flat
smooth
```

GDSS:

```gdscript
@flat
@smooth
```

## Uniforms

GSL:

```glsl
uniform vec4 color : source_color;
uniform float amount : hint_range(0, 1);
uniform int noise_type : hint_enum("OpenSimplex2", "Cellular", "Perlin", "Value") = 0;
uniform int character_speed: hint_enum("Slow:30", "Average:60", "Very Fast:200") = 60;
```

GDSS:

```gdscript
@uniform(source_color) var color: vec4
@uniform(hint_range(0, 1)) var amount: float
@uniform(hint_enum("OpenSimplex2", "Cellular", "Perlin", "Value"))
var noise_type: int = 0
@uniform(hint_enum("Slow:30", "Average:60", "Very Fast:200"))
var character_speed: int = 60
```

## Uniform groups

GSL:

```glsl
group_uniforms MyGroup.MySubgroup;
uniform sampler2D test;
group_uniforms; // Close uniform group.
```

GDSS:

```gdscript
@group_uniforms(MyGroup.MySubgroup)
@uniform var test: sampler2D
@end_group_uniforms # Close uniform group.
```

## Global uniforms

GSL:

```glsl
global uniform vec4 my_color;
```

GDSS:

```gdscript
@global @uniform var my_color: vec4
```

## Per-instance uniforms

GSL:

```glsl
instance uniform vec4 my_color : source_color = vec4(1.0, 0.5, 0.0, 1.0);
```

GDSS:

```gdscript
@instance @uniform(source_color)
var my_color: vec4 = vec4(1.0, 0.5, 0.0, 1.0)
```

## Pre-processing Directives

GSL:

```glsl
#define SAMPLE(param1, param2, param3, param4) long_function_call( \
        param1, \
        param2, \
        param3, \
        param4 \
)
```

GDSS:

```gdscript
@macro(define SAMPLE(param1, param2, param3, param4) long_function_call( \
        param1, \
        param2, \
        param3, \
        param4 \
)) # Attention! In @macro you should use GSL code.
```
