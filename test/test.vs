attribute vec4 position;
attribute vec3 normal;
attribute vec2 texcoord;

uniform mat4 viewProjMat;
uniform mat4 worldMat;
uniform vec3 lightDir;

varying vec4 v_colorVarying;
varying vec2 v_texcoord;

void main()
{
	float nDotVP = max(0.1, dot(normalize(worldMat * vec4(normal,1.0)), lightDir));
	v_colorVarying = vec4(1.0,1.0,1.0,1.0) * nDotVP;
	gl_Position = viewProjMat * worldMat * position;
	v_texcoord = texcoord;
}
