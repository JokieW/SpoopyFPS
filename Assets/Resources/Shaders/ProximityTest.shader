﻿Shader "Custom/ProximityTest" {
    Properties {
        _MainTex ("Base (RGB)", 2D) = "white" {} // Regular object texture
        _PlayerPosition ("Player Position", vector) = (0,0,0,0) // The location of the player - will be set by script
        _VisibilityIndex ("Invisibility Index", int) = 0 // The color it reacts to
        _VisibleDistance ("Visibility Distance", float) = 10.0 // How close does the player have to be to make object visible
        _OutlineWidth ("Outline Width", float) = 3.0 // Used to add an outline around visible area a la Mario Galaxy
        _OutlineColour ("Outline Colour", color) = (1.0,1.0,0.0,1.0) // Colour of the outline
    }
    SubShader {
        Tags { "RenderType"="Transparent" "Queue"="Transparent" }
        Pass {
        Blend SrcAlpha OneMinusSrcAlpha
         
        CGPROGRAM
        #pragma vertex vert
        #pragma fragment frag
 
        // Access the shaderlab properties
        uniform sampler2D _MainTex;
        uniform float4 _PlayerPosition;
        uniform int _VisibilityIndex;
        uniform float _VisibleDistance;
        uniform float _OutlineWidth;
        uniform fixed4 _OutlineColour;
         
        // Input to vertex shader
        struct vertexInput {
            float4 vertex : POSITION;
            float4 texcoord : TEXCOORD0;
        };
        // Input to fragment shader
        struct vertexOutput {
            float4 pos : SV_POSITION;
            float4 position_in_world_space : TEXCOORD0;
            float4 tex : TEXCOORD1;
        };
          
        // VERTEX SHADER
        vertexOutput vert(vertexInput input)
        {
            vertexOutput output;
            output.pos =  mul(UNITY_MATRIX_MVP, input.vertex);
            output.position_in_world_space = mul(_Object2World, input.vertex);
            output.tex = input.texcoord;
            return output;
        }
  
        // FRAGMENT SHADER
        float4 frag(vertexOutput input) : COLOR
        {
            // Calculate distance to player position
            float dist = distance(input.position_in_world_space, _PlayerPosition);
  
            // Return appropriate colour
            if (dist < _VisibleDistance) {
                return tex2D(_MainTex, float2(input.tex.xy)); // Visible
            }
            else if (dist < _VisibleDistance + _OutlineWidth) {
                return _OutlineColour; // Edge of visible range
            }
            else {
                float4 tex = tex2D(_MainTex, float2(input.tex.xy)); // Outside visible range
                tex.a = 0;
                return tex;
            }
        }
 
        ENDCG
        } // End Pass
    } // End Subshader
    FallBack "Diffuse"
} // End Shader