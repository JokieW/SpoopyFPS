// Shader created with Shader Forge v1.12 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.12;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:0,nrsp:0,limd:1,spmd:0,grmd:0,uamb:False,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:1,ufog:False,aust:True,igpj:False,qofs:1,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1223,x:33645,y:32553,varname:node_1223,prsc:2|diff-5149-RGB,clip-657-OUT;n:type:ShaderForge.SFN_Tex2d,id:5149,x:33023,y:32329,ptovrint:False,ptlb:node_5149,ptin:_node_5149,varname:_node_5149,prsc:2,tex:6dde856877c82b4478b445dbfcf24276,ntxv:0,isnm:False;n:type:ShaderForge.SFN_NormalVector,id:730,x:32676,y:33075,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:290,x:32898,y:32940,varname:node_290,prsc:2,dt:0|A-4205-OUT,B-730-OUT;n:type:ShaderForge.SFN_Vector1,id:5168,x:33009,y:33029,varname:node_5168,prsc:2,v1:1;n:type:ShaderForge.SFN_LightPosition,id:5039,x:32035,y:32931,varname:node_5039,prsc:2;n:type:ShaderForge.SFN_Normalize,id:4205,x:32676,y:32940,varname:node_4205,prsc:2|IN-5113-OUT;n:type:ShaderForge.SFN_Lerp,id:5113,x:32477,y:32940,cmnt:Gives Light direction,varname:node_5113,prsc:2|A-5039-XYZ,B-4031-OUT,T-5039-PNT;n:type:ShaderForge.SFN_Subtract,id:4031,x:32275,y:32965,varname:node_4031,prsc:2|A-5039-XYZ,B-5837-XYZ;n:type:ShaderForge.SFN_FragmentPosition,id:5837,x:32035,y:33072,varname:node_5837,prsc:2;n:type:ShaderForge.SFN_LightColor,id:1533,x:32477,y:32644,varname:node_1533,prsc:2;n:type:ShaderForge.SFN_Vector3,id:2259,x:32477,y:32782,varname:node_2259,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Subtract,id:6486,x:32671,y:32644,varname:node_6486,prsc:2|A-1533-RGB,B-2259-OUT;n:type:ShaderForge.SFN_Vector3,id:1889,x:32671,y:32794,varname:node_1889,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Multiply,id:3466,x:33200,y:32995,varname:node_3466,prsc:2|A-290-OUT,B-5281-OUT,C-5168-OUT;n:type:ShaderForge.SFN_Multiply,id:7322,x:33107,y:32729,varname:node_7322,prsc:2|A-1331-OUT,B-3466-OUT;n:type:ShaderForge.SFN_Clamp,id:1331,x:32936,y:32675,varname:node_1331,prsc:2|IN-6486-OUT,MIN-1889-OUT,MAX-335-OUT;n:type:ShaderForge.SFN_Vector3,id:335,x:32849,y:32818,varname:node_335,prsc:2,v1:999,v2:999,v3:999;n:type:ShaderForge.SFN_ComponentMask,id:1375,x:33321,y:32729,varname:node_1375,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-7322-OUT;n:type:ShaderForge.SFN_Vector1,id:6755,x:32736,y:33298,varname:node_6755,prsc:2,v1:1;n:type:ShaderForge.SFN_Divide,id:5281,x:32927,y:33298,varname:node_5281,prsc:2|A-6755-OUT,B-9603-OUT;n:type:ShaderForge.SFN_Vector1,id:8773,x:32515,y:33665,varname:node_8773,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:5069,x:32187,y:33373,ptovrint:False,ptlb:node_5069,ptin:_node_5069,varname:_node_5069,prsc:2,min:0,cur:0.1004169,max:1;n:type:ShaderForge.SFN_Multiply,id:2793,x:32515,y:33373,varname:node_2793,prsc:2|A-5069-OUT,B-1855-OUT;n:type:ShaderForge.SFN_Abs,id:1855,x:32477,y:33127,varname:node_1855,prsc:2|IN-2794-OUT;n:type:ShaderForge.SFN_Subtract,id:2794,x:32265,y:33127,varname:node_2794,prsc:2|A-5837-XYZ,B-5039-XYZ;n:type:ShaderForge.SFN_Add,id:9603,x:32736,y:33373,varname:node_9603,prsc:2|A-2793-OUT,B-1447-OUT,C-8773-OUT;n:type:ShaderForge.SFN_Multiply,id:1447,x:32515,y:33529,varname:node_1447,prsc:2|A-3070-OUT,B-1855-OUT,C-1855-OUT;n:type:ShaderForge.SFN_Slider,id:3070,x:32187,y:33529,ptovrint:False,ptlb:node_3070,ptin:_node_3070,varname:_node_3070,prsc:2,min:0,cur:0.01,max:1;n:type:ShaderForge.SFN_ComponentMask,id:3079,x:33397,y:33233,varname:node_3079,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-4748-OUT;n:type:ShaderForge.SFN_Multiply,id:5478,x:33599,y:33222,varname:node_5478,prsc:2|A-3079-R,B-3079-G,C-3079-B;n:type:ShaderForge.SFN_Vector1,id:2674,x:33303,y:33431,varname:node_2674,prsc:2,v1:10;n:type:ShaderForge.SFN_OneMinus,id:4748,x:33208,y:33273,varname:node_4748,prsc:2|IN-3466-OUT;n:type:ShaderForge.SFN_OneMinus,id:657,x:33674,y:33082,varname:node_657,prsc:2|IN-5478-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:2008,x:32996,y:33640,varname:node_2008,prsc:2;proporder:5149-5069-3070;pass:END;sub:END;*/

Shader "Shader Forge/NewShader" {
    Properties {
        _node_5149 ("node_5149", 2D) = "white" {}
        _node_5069 ("node_5069", Range(0, 1)) = 0.1004169
        _node_3070 ("node_3070", Range(0, 1)) = 0.01
		_HighCutoff ("HighCutoff", Range(0, 1)) = 0.7
        _LowCutoff ("LowCutoff", Range(0, 1)) = 0.4
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest+1"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            // Dithering function, to use with scene UVs (screen pixel coords)
            // 2x2 Bayer matrix, based on https://en.wikipedia.org/wiki/Ordered_dithering
            float BinaryDither2x2( float value, float2 sceneUVs ) {
                float2x2 mtx = float2x2(
                    float2( 1, 3 )/5.0,
                    float2( 4, 2 )/5.0
                );
                float2 px = floor(_ScreenParams.xy * sceneUVs);
                int xSmp = fmod(px.x,2);
                int ySmp = fmod(px.y,2);
                float2 xVec = 1-saturate(abs(float2(0,1) - xSmp));
                float2 yVec = 1-saturate(abs(float2(0,1) - ySmp));
                float2 pxMult = float2( dot(mtx[0],yVec), dot(mtx[1],yVec) );
                return round(value + dot(pxMult, xVec));
            }
            uniform float4 _LightColor0;
            uniform sampler2D _node_5149; uniform float4 _node_5149_ST;
            uniform float _node_5069;
            uniform float _node_3070;
			uniform float _HighCutoff;
            uniform float _LowCutoff;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 screenPos : TEXCOORD3;
                LIGHTING_COORDS(4,5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
/////// Vectors:
                float3 normalDirection = i.normalDir;
                float node_290 = dot(normalize(lerp(_WorldSpaceLightPos0.rgb,(_WorldSpaceLightPos0.rgb-i.posWorld.rgb),_WorldSpaceLightPos0.a)),i.normalDir);
                float3 node_1855 = abs((i.posWorld.rgb-_WorldSpaceLightPos0.rgb));
                float node_8773 = 1.0;
                float node_5168 = 1.0;
                float3 node_3466 = (node_290*(1.0/((_node_5069*node_1855)+(_node_3070*node_1855*node_1855)+node_8773))*node_5168);
                float3 node_3079 = (1.0 - node_3466).rgb;
				float attenuation = LIGHT_ATTENUATION(i);
				if(attenuation > _HighCutoff)
				{}
				else if(attenuation > _LowCutoff)
				{
					clip( BinaryDither2x2(LIGHT_ATTENUATION(i) - 1.5, sceneUVs) );
				}
                else
				{
					clip(-1.0);
				}
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _node_5149_var = tex2D(_node_5149,TRANSFORM_TEX(i.uv0, _node_5149));
                float3 diffuseColor = _node_5149_var.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
