Here lists the grammar correspondences between Godot Shading Language (abbr. as GSL) and GDSS:

## Comments

GSL:

```
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

```
# Single-line comment.
a: int = 0 # Another single-line comment.

# Multi-line
# comment.

## Multi-line
## documentation comment.
@uniform b: int = 0

## Single-line documentation comment.
@uniform c: int = 0
```

## Casting

GSL:

```
float a = float(1);
uint b = uint(2);
```

GDSS:

```
a: float = 1
b: uint = 2
```

## Precision

GSL:

```
lowp vec4 a = vec4(0.0, 1.0, 2.0, 3.0);
mediump vec4 a = vec4(0.0, 1.0, 2.0, 3.0);
highp vec4 a = vec4(0.0, 1.0, 2.0, 3.0);
```

GDSS:

```
@precision(low) a: vec4 = vec4(0.0, 1.0, 2.0, 3.0)
@precision(medium) a: vec4 = vec4(0.0, 1.0, 2.0, 3.0)
@precision(high) a: vec4 = vec4(0.0, 1.0, 2.0, 3.0)
```

## Arrays

GSL:

```
int arr1[3] = int[3] (0, 1, 2);
bool arr2[] = { true, true, false };
const lowp vec3 arr3[1] = lowp vec3[1] (vec3(0, 0, 1));

float arr4[3];
arr4[0] = 1.0;
COLOR.r = arr4[0];
```

GDSS:

```
arr1: int[3] = { 1.0, 0.5, 0.0 }
arr2: bool[] = { true, true, false }
@const @precision(low) arr3: vec3[1] = { vec3(0, 0, 1) }

arr4: float[3]
arr4[0] = 1.0
COLOR.r = arr4[0]
```

## Constants

GSL:

```
const int a = 0;
```

GDSS:

```
@const a: int = 0
```

## Structs

GSL:

```
struct PointLight {
    int field1;
};
```

GDSS:

```
struct PointLight:
    field1: int
```

## Operators

GSL:

```
// Only display the difference.
&&
||
```

GDSS:

```
# Only display the difference.
and
or
```

## Flow control

GSL:

```
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

```
if cond:
    something1
elif other_cond:
    something2
else:
    something3

result: int = cond ? 1 : 2

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

```
int sum(int a, int b) {
    return a + b;
}
```

GDSS:

```
func sum(a: int, b: int) -> int:
    return a + b
```

## Varyings

GSL:

```
varying vec3 color;
```

GDSS:

```
@varying color: vec3
```

## Interpolation qualifiers

GSL:

```
flat
smooth
```

GDSS:

```
@flat
@smooth
```

## Uniforms

GSL:

```
uniform vec4 color : source_color;
uniform float amount : hint_range(0, 1);
uniform int noise_type : hint_enum("OpenSimplex2", "Cellular", "Perlin", "Value") = 0;
uniform int character_speed: hint_enum("Slow:30", "Average:60", "Very Fast:200") = 60;
```

GDSS:

```
@uniform(source_color) color: vec4
@uniform(hint_range(0, 1)) amount: float
@uniform(hint_enum("OpenSimplex2", "Cellular", "Perlin", "Value"))
noise_type: int = 0
@uniform(hint_enum("Slow:30", "Average:60", "Very Fast:200"))
character_speed: int = 60
```

## Uniform groups

GSL:

```
group_uniforms MyGroup.MySubgroup;
uniform sampler2D test;
group_uniforms; // Close uniform group.
```

GDSS:

```
@group_uniforms(MyGroup.MySubgroup)
uniform sampler2D test
@end_group_uniforms # Close uniform group.
```

## Global uniforms

GSL:

```
global uniform vec4 my_color;
```

GDSS:

```
@global @uniform my_color: vec4
```

## Per-instance uniforms

GSL:

```
instance uniform vec4 my_color : source_color = vec4(1.0, 0.5, 0.0, 1.0);
```

GDSS:

```
@instance @uniform(source_color)
my_color: vec4 = vec4(1.0, 0.5, 0.0, 1.0)
```