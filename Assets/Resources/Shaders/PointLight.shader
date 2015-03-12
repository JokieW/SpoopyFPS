    Shader "Test/Shader" {
        Properties {
            //diffuse
            _Color ("BaseColor", Color) = (1, 1, 1, 1)
			_MainTex ("Base (RGB)", 2D) = "white" {} // Regular object texture
			_AlphaTex ("Alpha (R)", 2D) = "white" {} // Regular object texture
     
        }
        SubShader {
        Pass {
		Tags { "RenderType"="Transparent" "Queue"="Transparent" "LightMode" = "ForwardAdd"}
		ZWrite Off
        Blend SrcAlpha OneMinusSrcAlpha
                
                CGPROGRAM
                //pragmas
                #pragma vertex vert
                #pragma fragment frag
				#include "UnityCG.cginc"
           
                //users variables
                ////diffuse
                uniform float4 _Color;
     
                //unity variables
                uniform float4 _LightColor0;

				sampler2D _MainTex;
				sampler2D _AlphaTex;

				float4 _MainTex_ST;
     
                //input structs
                struct vertexInput{
                    float4 vertex : POSITION;
                    float3 normal : NORMAL;
					float2 texcoord : TEXCOORD0;
                };
                struct vertexOutput{
                    float4 pos : SV_POSITION;
                    float4 posWorld : TEXCOORD0;
                    float3 normalDir : TEXCOORD1;
					float2 texcoord : TEXCOORD2;
                    float4 col : COLOR;
                };
     
                //vertex function
                vertexOutput vert(vertexInput v){
                    vertexOutput o;
                   
                    o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                    o.posWorld = mul(_Object2World, v.vertex);
                    o.normalDir = normalize(mul(float4(v.normal, 0),_World2Object).xyz);
                    o.texcoord = TRANSFORM_TEX(v.texcoord, _MainTex);
                    o.col = _Color;
                   
                    return o;
                   
                }
     
                //fragment function
                float4 frag(vertexOutput i) : COLOR/*SV_Target*/{
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
                    float3 diffuseReflection = atten  *tex2D(_MainTex, i.texcoord) * _LightColor0.xyz  * saturate(dot(normalDirection, lightDirection));
                   
                    //final color
					float batten = clamp(atten+0.5, 0.0, 1.0);
                    float4 finalColor = float4(diffuseReflection, saturate(dot(normalDirection, lightDirection)).r);
                    return finalColor ;
                }
                ENDCG
            }//pass
        }//SubShader
        FallBack "Diffuse"
    }//Shader
     
