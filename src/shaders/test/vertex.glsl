// #define M_PI 3.1415926535897932384626433832795

// uniform mat4 projectionMatrix;
// uniform mat4 viewMatrix;
// uniform mat4 modelMatrix;

// uniform float uFrequncy;
// uniform float uTime;

// uniform float uDisplacementStrngth;
// uniform float uDisplacementFrequency;
// uniform float uDistortionFrequency;
// uniform float uDistortionStrngth;

// uniform vec3 uLightColor;
// uniform vec3 uLightAPosition;
// uniform vec3 uLightBPosition;
// uniform vec2 uSubdivision;

// uniform vec3 uOffset;
// uniform vec3 cameraPosition;

// uniform float uFresnelOffset;
// uniform float uFresnelMultiplier;
// uniform float uFresnelPower;

// attribute vec3 position;
// attribute vec3 normal;
// attribute float aRandom;
// attribute vec4 tangent;

// varying float vRandom;
// varying vec3 vNormal;
// varying float vPerlinStrength;
// varying vec3 vColor;

// #pragma glslify: perlin4d = require('./shaders/partials/perlin4d.glsl');
// #pragma glslify: perlin3d = require('./shaders/partials/perlin3d.glsl');

// vec3 getDisplacedPosition(vec3 _position) {
//      vec3 displacementPosition = _position;
//     displacementPosition += perlin4d(vec4(displacementPosition * uDistortionFrequency, uTime * 0.4)) * uDisplacementStrngth;

//     float perlinStrength = perlin4d(vec4(displacementPosition * uDisplacementFrequency, uTime * 0.4)) * uDisplacementStrngth;
    
//     vec3 displacedPosition = _position;
//     displacedPosition += perlinStrength * normalize(_position) * uDisplacementStrngth;

//     vPerlinStrength = perlinStrength;

//     return displacedPosition;
// }

// void main() {

//     //position
//     vec3 displacedPosition = getDisplacedPosition(position);
//     vec4 viewPosition = viewMatrix * vec4(displacedPosition, 1.0);
//     vec4 projectedPosition = projectionMatrix * viewPosition;
//     gl_Position = projectedPosition;

//     // Bi tangents
//     float distanceA = (M_PI * 2.0) / uSubdivision.x;
//     float distanceB = M_PI / uSubdivision.x;

//     vec3 biTangent = cross(normal, tangent.xyz);

//     vec3 positionA = position + tangent.xyz * distanceA;
//     vec3 displacedPositionA = getDisplacedPosition(positionA);

//     vec3 positionB = position + biTangent.xyz * distanceB;
//     vec3 displacedPositionB = getDisplacedPosition(positionB);

//     vec3 computedNormal = cross(displacedPositionA - displacedPosition.xyz, displacedPositionB - displacedPosition.xyz);
//     computedNormal = normalize(computedNormal);

//     // Fresnel
//     vec3 viewDirection = normalize(displacedPosition.xyz - cameraPosition);
//     float fresnel = uFresnelOffset + (1.0 + dot(viewDirection, computedNormal)) * uFresnelMultiplier;
//     fresnel = pow(max(0.0, fresnel), uFresnelPower);

//     //Color

//     float lightAIntensity = max(0.0, dot(computedNormal.xyz, normalize(- uLightAPosition)));
//     float lightBIntensity = max(0.0, dot(computedNormal.xyz, normalize(- uLightBPosition)));
    
//     vec3 color = vec3(0.0);
//     color = mix(color, uLightColor, lightAIntensity * fresnel);
//     color = mix(color, uLightColor, lightBIntensity * fresnel);
//     color = mix(color, vec3(1.0), clamp(pow(max(0.0, fresnel - 0.8), 3.0), 0.0, 1.0));


//     vNormal = normal;
//     vColor = color;
// }