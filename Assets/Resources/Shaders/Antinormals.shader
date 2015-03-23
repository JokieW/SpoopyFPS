// Shader created with Shader Forge v1.12 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.12;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:1,spmd:1,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:2,bsrc:0,bdst:0,culm:1,dpts:2,wrdp:False,dith:0,ufog:False,aust:False,igpj:False,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:5162,x:33035,y:32717,varname:node_5162,prsc:2|diff-6-OUT,alpha-8637-OUT,clip-4228-OUT;n:type:ShaderForge.SFN_Tex2d,id:6631,x:32350,y:32699,ptovrint:False,ptlb:TileTexture,ptin:_TileTexture,varname:_TileTexture,prsc:2,tex:8b905862ad67c094d94555296e19a910,ntxv:0,isnm:False|UVIN-1686-OUT;n:type:ShaderForge.SFN_ScreenPos,id:9814,x:31906,y:32387,varname:node_9814,prsc:2,sctp:1;n:type:ShaderForge.SFN_ScreenParameters,id:9389,x:31713,y:32765,varname:node_9389,prsc:2;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:1686,x:32176,y:32699,varname:uvRemap,prsc:2|IN-9814-UVOUT,IMIN-908-OUT,IMAX-5100-OUT,OMIN-2986-OUT,OMAX-3086-OUT;n:type:ShaderForge.SFN_Vector1,id:908,x:31906,y:32551,varname:screenImin,prsc:2,v1:-1;n:type:ShaderForge.SFN_Vector1,id:2986,x:31906,y:32727,varname:screenOmin,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:5100,x:31906,y:32657,varname:node_5100,prsc:2,v1:1;n:type:ShaderForge.SFN_Divide,id:3086,x:31906,y:32826,varname:node_3086,prsc:2|A-9389-PXH,B-7658-OUT;n:type:ShaderForge.SFN_Vector1,id:7658,x:31713,y:32898,varname:node_7658,prsc:2,v1:4;n:type:ShaderForge.SFN_LightAttenuation,id:763,x:32743,y:32644,varname:node_763,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6,x:32831,y:32843,varname:node_6,prsc:2|A-763-OUT,B-1579-RGB,C-6631-RGB;n:type:ShaderForge.SFN_NormalVector,id:5869,x:32202,y:33286,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:6517,x:32388,y:33146,varname:localNdotL,prsc:2,dt:1|A-7563-OUT,B-5869-OUT;n:type:ShaderForge.SFN_Step,id:3077,x:32582,y:33146,varname:directionCutoff,prsc:2|A-6517-OUT,B-574-OUT;n:type:ShaderForge.SFN_Vector1,id:574,x:32582,y:33268,varname:node_574,prsc:2,v1:0;n:type:ShaderForge.SFN_FragmentPosition,id:9742,x:31825,y:33146,varname:node_9742,prsc:2;n:type:ShaderForge.SFN_LightPosition,id:3467,x:31825,y:33005,varname:node_3467,prsc:2;n:type:ShaderForge.SFN_Lerp,id:8731,x:32202,y:33006,varname:node_8731,prsc:2|A-3467-XYZ,B-257-OUT,T-3467-PNT;n:type:ShaderForge.SFN_Normalize,id:7563,x:32202,y:33146,varname:node_7563,prsc:2|IN-8731-OUT;n:type:ShaderForge.SFN_Multiply,id:5685,x:32633,y:32996,varname:node_5685,prsc:2|A-6631-A,B-3077-OUT;n:type:ShaderForge.SFN_Slider,id:8637,x:32283,y:32926,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:_Opacity,prsc:2,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Color,id:1579,x:32350,y:32483,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,c1:0.8,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Subtract,id:257,x:32009,y:33146,varname:node_257,prsc:2|A-3467-XYZ,B-9742-XYZ;n:type:ShaderForge.SFN_If,id:4228,x:32831,y:32996,varname:node_4228,prsc:2|A-763-OUT,B-6355-OUT,GT-5685-OUT,EQ-574-OUT,LT-574-OUT;n:type:ShaderForge.SFN_Vector1,id:6355,x:32735,y:33302,varname:node_6355,prsc:2,v1:0.9;proporder:6631-8637-1579;pass:END;sub:END;*/

Shader "Shader Forge/Antinormals" {
    Properties {
        _TileTexture ("TileTexture", 2D) = "white" {}
        _Opacity ("Opacity", Range(0, 1)) = 1
		_Cutoff ("Cutoff", Range(0, 1)) = 0.4
        _Color ("Color", Color) = (0.8,0,0,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
   SubShader {
        Tags {
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        /*Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            Cull Front
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _TileTexture; uniform float4 _TileTexture_ST;
            uniform float _Opacity;
            uniform float4 _Color;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 screenPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(-v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
/////// Vectors:
                float3 normalDirection = i.normalDir;
                float node_4228_if_leA = step(LIGHT_ATTENUATION(i),0.9);
                float node_4228_if_leB = step(0.9,LIGHT_ATTENUATION(i));
                float node_574 = 0.0;
                float screenImin = (-1.0);
                float screenOmin = 0.0;
                float2 uvRemap = (screenOmin + ( (float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg - screenImin) * ((_ScreenParams.g/4.0) - screenOmin) ) / (1.0 - screenImin));
                float4 _TileTexture_var = tex2D(_TileTexture,TRANSFORM_TEX(uvRemap, _TileTexture));
                clip(lerp((node_4228_if_leA*node_574)+(node_4228_if_leB*(_TileTexture_var.a*step(max(0,dot(normalize(lerp(_WorldSpaceLightPos0.rgb,(_WorldSpaceLightPos0.rgb-i.posWorld.rgb),_WorldSpaceLightPos0.a)),i.normalDir)),node_574))),node_574,node_4228_if_leA*node_4228_if_leB) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = (attenuation*_Color.rgb*_TileTexture_var.rgb);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor,_Opacity);
            }
            ENDCG
        }*/
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            //Blend One One
			//BlendOp Add
            Cull Front
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _TileTexture; uniform float4 _TileTexture_ST;
            uniform float _Opacity;
			uniform float _Cutoff;
            uniform float4 _Color;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 screenPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(-v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
/////// Vectors:
                float3 normalDirection = i.normalDir;
                float node_4228_if_leA = step(LIGHT_ATTENUATION(i),_Cutoff);
                float node_4228_if_leB = step(_Cutoff,LIGHT_ATTENUATION(i));
                float node_574 = 0.0;
                float screenImin = (-1.0);
                float screenOmin = 0.0;
                float2 uvRemap = (screenOmin + ( (float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg - screenImin) * ((_ScreenParams.g/4.0) - screenOmin) ) / (1.0 - screenImin));
                float4 _TileTexture_var = tex2D(_TileTexture,TRANSFORM_TEX(uvRemap, _TileTexture));
                clip(lerp((node_4228_if_leA*node_574)+(node_4228_if_leB*(_TileTexture_var.a*step(max(0,dot(normalize(lerp(_WorldSpaceLightPos0.rgb,(_WorldSpaceLightPos0.rgb-i.posWorld.rgb),_WorldSpaceLightPos0.a)),i.normalDir)),node_574))),node_574,node_4228_if_leA*node_4228_if_leB) - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/// Final Color:
                float3 finalColor = _LightColor0.rgb*_TileTexture_var.rgb;
                return fixed4(finalColor ,_Opacity);
            }
            ENDCG
        }
        /*Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _TileTexture; uniform float4 _TileTexture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 screenPos : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(-v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
/////// Vectors:
                float3 normalDirection = i.normalDir;
                float node_4228_if_leA = step(attenuation,0.9);
                float node_4228_if_leB = step(0.9,attenuation);
                float node_574 = 0.0;
                float screenImin = (-1.0);
                float screenOmin = 0.0;
                float2 uvRemap = (screenOmin + ( (float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg - screenImin) * ((_ScreenParams.g/4.0) - screenOmin) ) / (1.0 - screenImin));
                float4 _TileTexture_var = tex2D(_TileTexture,TRANSFORM_TEX(uvRemap, _TileTexture));
                clip(lerp((node_4228_if_leA*node_574)+(node_4228_if_leB*(_TileTexture_var.a*step(max(0,dot(normalize(lerp(_WorldSpaceLightPos0.rgb,(_WorldSpaceLightPos0.rgb-i.posWorld.rgb),_WorldSpaceLightPos0.a)),i.normalDir)),node_574))),node_574,node_4228_if_leA*node_4228_if_leB) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }*/
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
