// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Effect/niuqu"
{
	Properties
	{
		_Main("主贴图", 2D) = "white" {}
		_Vector0("主贴图速度", Vector) = (0,0,0,0)
		_Float0("扭曲强度", Range( 0 , 1)) = 0.4587207
		_Mask("遮罩", 2D) = "white" {}
		_Float1("角度", Range( 0 , 360)) = 0
		[Toggle]_Float2("Custom控制遮罩", Float) = 0

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" "Queue"="Transparent" }
	LOD 100

		CGINCLUDE
		#pragma target 4.5
		ENDCG
		Blend Off
		AlphaToMask Off
		Cull Back
		ColorMask RGBA
		ZWrite Off
		ZTest LEqual
		Offset 0 , 0
		
		
		GrabPass{ }

		Pass
		{
			Name "Unlit"
			Tags { "LightMode"="ForwardBase" }
			CGPROGRAM

			#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
			#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
			#else
			#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
			#endif


			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
			uniform sampler2D _Main;
			uniform float2 _Vector0;
			uniform float4 _Main_ST;
			uniform sampler2D _Mask;
			uniform float4 _Mask_ST;
			uniform float _Float2;
			uniform float _Float1;
			uniform float _Float0;

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord1 = screenPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_texcoord2.zw = v.ase_texcoord1.xy;
				o.ase_color = v.color;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float4 screenPos = i.ase_texcoord1;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 appendResult14 = (float2(_Vector0.x , _Vector0.y));
				float2 uv_Main = i.ase_texcoord2.xy * _Main_ST.xy + _Main_ST.zw;
				float2 panner8 = ( 1.0 * _Time.y * appendResult14 + uv_Main);
				float2 temp_cast_0 = (tex2D( _Main, panner8 ).r).xx;
				float2 uv_Mask = i.ase_texcoord2.xy * _Mask_ST.xy + _Mask_ST.zw;
				float2 texCoord24 = i.ase_texcoord2.zw * float2( 1,1 ) + float2( 0,0 );
				float2 break25 = texCoord24;
				float2 appendResult28 = (float2(( uv_Mask.x + break25.x ) , ( uv_Mask.y + break25.y )));
				float2 lerpResult29 = lerp( uv_Mask , appendResult28 , _Float2);
				float cos20 = cos( radians( _Float1 ) );
				float sin20 = sin( radians( _Float1 ) );
				float2 rotator20 = mul( lerpResult29 - float2( 0.5,0.5 ) , float2x2( cos20 , -sin20 , sin20 , cos20 )) + float2( 0.5,0.5 );
				float2 lerpResult16 = lerp( (ase_screenPosNorm).xy , temp_cast_0 , ( tex2D( _Mask, rotator20 ).r * _Float0 * i.ase_color.a ));
				float4 screenColor4 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,lerpResult16);
				
				
				finalColor = float4( (screenColor4).rgb , 0.0 );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=18935
6;102;1524;735;1952.325;-16.0004;1.6;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;24;-2086.393,247.375;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;25;-1823.245,294.1371;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.TextureCoordinatesNode;21;-1903.253,84.66512;Inherit;False;0;18;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;27;-1619.252,425.9574;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;26;-1610.498,319.0664;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-1588.238,565.7242;Inherit;False;Property;_Float2;Custom控制遮罩;5;1;[Toggle];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;28;-1453.037,466.2932;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-1675.446,681.1517;Inherit;False;Property;_Float1;角度;4;0;Create;False;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;15;-1092.86,341.9686;Inherit;False;Property;_Vector0;主贴图速度;1;0;Create;False;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.LerpOp;29;-1268.047,451.1286;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RadiansOpNode;23;-1368.92,677.8768;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;14;-936.4669,365.068;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;20;-1048.827,499.1792;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-1090.76,156.7863;Inherit;False;0;7;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;8;-786.2499,228.264;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;18;-831.3041,468.3961;Inherit;True;Property;_Mask;遮罩;3;0;Create;False;0;0;0;False;0;False;-1;ca9ac653a9c8d3847a0fe5911695750a;ca9ac653a9c8d3847a0fe5911695750a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenPosInputsNode;3;-1081.259,-75.91345;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;17;-906.8419,694.7205;Inherit;False;Property;_Float0;扭曲强度;2;0;Create;False;0;0;0;False;0;False;0.4587207;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;31;-841.9989,808.2216;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;5;-833.0038,-52.22302;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;7;-576.7756,201.7281;Inherit;True;Property;_Main;主贴图;0;0;Create;False;0;0;0;False;0;False;-1;3584f2bf4afb5284d91edb6a29126e62;3584f2bf4afb5284d91edb6a29126e62;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-479.8034,452.1715;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;16;-209.1428,193.9365;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScreenColorNode;4;17.91987,186.5727;Inherit;False;Global;_GrabScreen0;Grab Screen 0;0;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;6;199.9843,186.5485;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;425.7029,194.8697;Float;False;True;-1;2;ASEMaterialInspector;100;1;Effect/niuqu;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;0;1;False;-1;1;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;2;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;2;RenderType=Opaque=RenderType;Queue=Transparent=Queue=0;True;5;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
WireConnection;25;0;24;0
WireConnection;27;0;21;2
WireConnection;27;1;25;1
WireConnection;26;0;21;1
WireConnection;26;1;25;0
WireConnection;28;0;26;0
WireConnection;28;1;27;0
WireConnection;29;0;21;0
WireConnection;29;1;28;0
WireConnection;29;2;30;0
WireConnection;23;0;22;0
WireConnection;14;0;15;1
WireConnection;14;1;15;2
WireConnection;20;0;29;0
WireConnection;20;2;23;0
WireConnection;8;0;9;0
WireConnection;8;2;14;0
WireConnection;18;1;20;0
WireConnection;5;0;3;0
WireConnection;7;1;8;0
WireConnection;19;0;18;1
WireConnection;19;1;17;0
WireConnection;19;2;31;4
WireConnection;16;0;5;0
WireConnection;16;1;7;1
WireConnection;16;2;19;0
WireConnection;4;0;16;0
WireConnection;6;0;4;0
WireConnection;2;0;6;0
ASEEND*/
//CHKSM=87F1F3467C1C5B118CC350A4ED3F13AD0F0BBCC1