//Simple per-pixel light shader.

const vec4 light0_position = vec4(20000., 20000., 20000., 1.0);
const vec4 light1_position = vec4(0., 0., 0., 1.);

uniform sampler2D baseMap;
uniform sampler2D illuminationMap;
uniform sampler2D specularMap;

varying vec3 normal;
varying vec3 position;

void main()
{
	vec3 lightDir = normalize(vec3(light0_position) - position);
	vec3 lightDir2 = normalize(vec3(light1_position) - position);
	vec3 n = normalize(normal);
	float intensity = max(0.1, dot(lightDir, n));
	float specularIntensity = min(1.0, pow(max(0.0, dot(lightDir2, n)) * 1.2, 20.0));
	
	vec3 base = texture2D(baseMap, gl_TexCoord[0].st).rgb;
	vec3 illumination = texture2D(illuminationMap, gl_TexCoord[0].st).rgb;
	vec3 specular = texture2D(specularMap, gl_TexCoord[0].st).rgb;
	
	gl_FragColor = vec4(((base - illumination) * intensity) + (specular * specularIntensity) + illumination, gl_Color.a);
	//gl_FragColor = vec4(base, gl_Color.a);
	//gl_FragColor = vec4(specular * specularIntensity, gl_Color.a);
}
