    Shader "Test/Shader" {
        Properties {
            //diffuse
            _Color ("BaseColor", Color) = (1, 1, 1, 1)
            //specular
            _SpecColor ("Specular color", Color) = (.5, .5, .5, 1)
            _Shininess ("Shininess", float) = 10
            //rim
            _RimColor ("Rim color", Color) = (1, 1, 1, 1)
            _RimPower ("Rim power", Range(.1, 10)) = 5
     
        }
        SubShader {
            /*Pass{
                Tags {
                    "LightMode" = "ForwardBase"
                }
                CGPROGRAM
                //pragmas
                #pragma vertex vert
                #pragma fragment frag
           
                //users variables
                ////diffuse
                uniform float4 _Color;
                ////specular
                uniform float4 _SpecColor;
                uniform float _Shininess;
                ////rim
                uniform float4 _RimColor;
                uniform float _RimPower;
     
                //unity variables
                uniform float4 _LightColor0;
     
                //input structs
                struct vertexInput{
                    float4 vertex : POSITION;
                    float3 normal : NORMAL;
                };
                struct vertexOutput{
                    float4 pos : SV_POSITION;
                    float4 posWorld : TEXCOORD0;
                    float3 normalDir : TEXCOORD1;
                    float4 col : COLOR;
                };
     
                //vertex function
                vertexOutput vert(vertexInput v){
                    vertexOutput o;
                   
                    o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                    o.posWorld = mul(_Object2World, v.vertex);
                    o.normalDir = normalize(mul(float4(v.normal, 0),_World2Object).xyz);
                   
                    o.col = _Color;
                   
                    return o;
                   
                }
     
                //fragment function
                float4 frag(vertexOutput i) : COLOR{
                    float3 normalDirection = i.normalDir;
                    float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                    float3 lightDirection;
                    float atten;
                   
                    //check light type
                    if(_WorldSpaceLightPos0.w == 0){ // this is directional light
                        lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                        atten = 1;
                    }else{
                        float3 fragmentToLightSource = _WorldSpaceLightPos0.xyz - i.posWorld.xyz;
                        float distance = length(fragmentToLightSource);
                        lightDirection = normalize(fragmentToLightSource);
                        atten = 1/distance;
                    }
                   
                    //diffuse
                    float3 diffuseReflection = atten * _LightColor0.xyz * _Color * saturate(dot(normalDirection, lightDirection));
                   
                    //specular
                    float3 specularReflection = atten * _LightColor0.xyz * _SpecColor * saturate(dot(normalDirection, lightDirection)) * pow(max(0, dot(reflect(-lightDirection, normalDirection), viewDirection)), _Shininess);
                   
                    //rim
                    float rim = 1 - saturate(dot(viewDirection, normalDirection));
                    float3 rimLight = atten * _LightColor0.xyz * saturate(dot(normalDirection, lightDirection)) * pow(rim, _RimPower);
                   
                    //final color
                    //float4 finalColor = float4(diffuseReflection + specularReflection + rimLight + UNITY_LIGHTMODEL_AMBIENT, 1);
                    float4 finalColor = float4(diffuseReflection+specularReflection, 1);
                    return finalColor;
                }
                ENDCG
            }//pass*/
           
        Pass {
		Tags { "RenderType"="Transparent" "Queue"="Transparent" "LightMode" = "ForwardAdd"}
        Blend SrcAlpha OneMinusSrcAlpha
                Blend One One
                CGPROGRAM
                //pragmas
                #pragma vertex vert
                #pragma fragment frag
           
                //users variables
                ////diffuse
                uniform float4 _Color;
                ////specular
                uniform float4 _SpecColor;
                uniform float _Shininess;
                ////rim
                uniform float4 _RimColor;
                uniform float _RimPower;
     
                //unity variables
                uniform float4 _LightColor0;
     
                //input structs
                struct vertexInput{
                    float4 vertex : POSITION;
                    float3 normal : NORMAL;
                };
                struct vertexOutput{
                    float4 pos : SV_POSITION;
                    float4 posWorld : TEXCOORD0;
                    float3 normalDir : TEXCOORD1;
                    float4 col : COLOR;
                };
     
                //vertex function
                vertexOutput vert(vertexInput v){
                    vertexOutput o;
                   
                    o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                    o.posWorld = mul(_Object2World, v.vertex);
                    //o.normalDir = normalize(mul(float4(v.normal, 0), _World2Object).xyz);
                    o.normalDir = normalize(mul(float4(v.normal, 0),_World2Object).xyz);
                   
                    o.col = _Color;
                   
                    return o;
                   
                }
     
                //fragment function
                float4 frag(vertexOutput i) : COLOR{
                    float3 normalDirection = i.normalDir;
                    float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                    float3 lightDirection;
                    float atten;
                   
                    //check light type
                    if(_WorldSpaceLightPos0.w == 0){ // this is directional light
                        lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                        atten = 1;
                    }else{
                        float3 fragmentToLightSource = _WorldSpaceLightPos0.xyz - i.posWorld.xyz;
                        float distance = length(fragmentToLightSource);
                        lightDirection = normalize(fragmentToLightSource);
                        atten = 1/distance;
                    }
                   
                    //diffuse
                    float3 diffuseReflection = atten * _LightColor0.xyz * _Color * saturate(dot(normalDirection, lightDirection));
                   
                    //specular
                    float3 specularReflection = atten * _LightColor0.xyz * _SpecColor * saturate(dot(normalDirection, lightDirection)) * pow(max(0, dot(reflect(-lightDirection, normalDirection), viewDirection)), _Shininess);
                   
                    //rim
                    float rim = 1 - saturate(dot(viewDirection, normalDirection));
                    float3 rimLight = atten * _LightColor0.xyz * saturate(dot(normalDirection, lightDirection)) * pow(rim, _RimPower);
                   
                    //final color
                    float4 finalColor = float4(diffuseReflection + specularReflection , 1);
                    return finalColor;
                }
                ENDCG
            }//pass
        }//SubShader
        FallBack "Diffuse"
    }//Shader
     
