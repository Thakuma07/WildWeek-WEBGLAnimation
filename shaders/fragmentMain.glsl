float d = distance(vWPos, uHitPoint);
float reveal = 1.0 - smoothstep(uRadius, uRadius + uSoftness, d);
float mask = reveal * uActive;
roughnessFactor = mix(roughnessFactor, 0.45, mask);
diffuseColor.rgb *= mix(1.0, 0.1, mask);
