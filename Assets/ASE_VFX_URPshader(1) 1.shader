// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VFX/URPShader"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][Enum(UnityEngine.Rendering.CullMode)]_Float1("双面", Float) = 0
		[Toggle]_Float2("深度写入", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_Float4("渲染顺序", Float) = 0
		[Enum(UnityEngine.Rendering.BlendMode)]_Src("Src", Float) = 0
		[Enum(UnityEngine.Rendering.BlendMode)]_Dst("Dst", Float) = 0
		[HDR]_Color0("颜色", Color) = (1,1,1,1)
		_Float14("整体颜色强度", Float) = 1
		[Toggle]_Float35("启用第二面颜色", Float) = 0
		[HDR]_Color3("颜色2", Color) = (1,1,1,1)
		_Float15("alpha强度", Range( 0 , 10)) = 1
		[Header(depthfade)]_Float16("软粒子（羽化边缘）", Float) = 0
		[Toggle]_Float5("反向软粒子(强化边缘）", Float) = 0
		_Float28("边缘强度", Float) = 1
		_Float30("边缘收窄", Float) = 1
		[Toggle][Header(Fresnel)]_Float33("菲尼尔开关", Float) = 0
		_power3("菲尼尔强度", Float) = 1
		_Float19("菲尼尔范围", Float) = 1
		[Toggle]_Float20("反向菲尼尔（虚化边缘）", Float) = 0
		[Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Header(Main)]_maintex("主贴图", 2D) = "white" {}
		[Toggle]_Float10("custom1xy控制主贴图偏移", Float) = 0
		_Float39("主贴图旋转", Float) = 0
		[KeywordEnum(A,R)] _Keyword1("主贴图通道", Float) = 0
		_Float34("主贴图细节对比度", Float) = 1
		_Float37("主贴图细节提亮", Float) = 1
		_Float36("细节平滑过渡", Range( 0 , 1)) = 1
		_Gradienttex("混合颜色贴图", 2D) = "white" {}
		_Float40("颜色混合贴图旋转", Float) = 0
		_Float29("颜色混合", Range( 0 , 1)) = 0
		_Vector0("主贴图流动", Vector) = (0,0,0,0)
		_Vector7("混合图流动", Vector) = (0,0,0,0)
		[Toggle(_KEYWORD6_ON)] _Keyword6("是否开启附加图", Float) = 0
		[KeywordEnum(ADD,Alpha)] _Keyword8("附加图模式", Float) = 0
		_Float47("融合度", Range( 0 , 1)) = 0
		[HDR]_Color2("附加图颜色", Color) = (0,0,0,0)
		_FujiaTex("附加贴图", 2D) = "white" {}
		[KeywordEnum(R,A)] _Keyword4("附加图通道", Float) = 0
		_Float38("附加图速度U", Float) = 0
		_Float46("附加图速度V", Float) = 0
		[Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Header(Mask)]_Mask("遮罩01", 2D) = "white" {}
		[Toggle]_Float12("custom1zw控制mask01偏移", Float) = 0
		_Float43("遮罩01旋转", Float) = 0
		[KeywordEnum(R,A)] _Keyword0("遮罩01通道", Float) = 1
		_Vector3("遮罩01流动", Vector) = (0,0,0,0)
		_Mask1("遮罩02", 2D) = "white" {}
		_Float42("遮罩02旋转", Float) = 0
		[KeywordEnum(R,A)] _Keyword2("遮罩02通道", Float) = 1
		_Vector6("遮罩02流动", Vector) = (0,0,0,0)
		[Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Header(dissolove)]_dissolvetex("溶解贴图", 2D) = "white" {}
		[Toggle]_Float11("custom2x控制溶解", Float) = 0
		_Float41("溶解贴图旋转", Float) = 0
		_Vector2("溶解流动", Vector) = (0,0,0,0)
		[KeywordEnum(up,down,left,right,off)] _Keyword7("溶解方向", Float) = 4
		_Float18("溶解方向强度", Float) = 1
		_Float6("溶解", Range( 0 , 1)) = 0
		_Float8("软硬", Range( 0.5 , 1)) = 0.5
		[KeywordEnum(off,on)] _Keyword5("亮边溶解", Float) = 0
		_Float17("亮边宽度", Range( 0 , 0.1)) = 0
		[HDR]_Color1("亮边颜色", Color) = (1,1,1,1)
		[Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Header(Noise)]_noise("扰动贴图", 2D) = "white" {}
		[Toggle]_Float31("custom2y控制flowmap扭曲", Float) = 0
		_Float44("扰动贴图旋转", Float) = 0
		_flowmaptex("flowmaptex", 2D) = "white" {}
		_Vector1("扰动速度", Vector) = (0,0,0,0)
		_Float9("扰动强度", Float) = 0
		_Float32("flowmap扰动", Range( 0 , 1)) = 0
		[Toggle]_Float0("扰动影响mask", Float) = 0
		[Toggle]_Float13("扰动影响溶解", Float) = 0
		[Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Header(Vertex_offset)]_vertextex("顶点偏移贴图", 2D) = "white" {}
		[Toggle]_Float22("custom2w控制顶点偏移强度", Float) = 0
		_Float45("顶点贴图旋转", Float) = 0
		_Vector5("顶点偏移强度", Vector) = (0,0,0,0)
		_Vector4("顶点偏移速度", Vector) = (0,0,0,0)
		[Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Header(Ref)]_reftex(" 折射（热扭曲）贴图", 2D) = "white" {}
		[Toggle]_Float24("custom2z控制折射（热扭曲）", Float) = 0
		[KeywordEnum(off,on)] _Keyword3("折射（热扭曲）开关", Float) = 0
		_speed1("折射（热扭曲）流动", Vector) = (0,0,0,0)
		[ASEEnd]_Float23("折射（热扭曲）强度", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		[HideInInspector]_QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector]_QueueControl("_QueueControl", Float) = -1
        [HideInInspector][NoScaleOffset]unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		
		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" }
		
		Cull [_Float1]
		AlphaToMask Off
		
		HLSLINCLUDE
		#pragma target 3.0

		#pragma prefer_hlslcc gles
		#pragma exclude_renderers d3d11_9x 

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS

		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }
			
			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM
			
			#pragma multi_compile_instancing
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1

			
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma shader_feature _ _SAMPLE_GI
			#pragma multi_compile _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ DEBUG_DISPLAY
			#define SHADERPASS SHADERPASS_UNLIT


			#pragma vertex vert
			#pragma fragment frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging3D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceData.hlsl"


			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _KEYWORD3_OFF _KEYWORD3_ON
			#pragma shader_feature_local _KEYWORD6_ON
			#pragma shader_feature_local _KEYWORD8_ADD _KEYWORD8_ALPHA
			#pragma shader_feature_local _KEYWORD4_R _KEYWORD4_A
			#pragma shader_feature_local _KEYWORD7_UP _KEYWORD7_DOWN _KEYWORD7_LEFT _KEYWORD7_RIGHT _KEYWORD7_OFF
			#pragma shader_feature_local _KEYWORD1_A _KEYWORD1_R
			#pragma shader_feature_local _KEYWORD5_OFF _KEYWORD5_ON
			#pragma shader_feature_local _KEYWORD0_R _KEYWORD0_A
			#pragma shader_feature_local _KEYWORD2_R _KEYWORD2_A


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef ASE_FOG
				float fogFactor : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color0;
			float4 _Color1;
			float4 _noise_ST;
			float4 _Gradienttex_ST;
			float4 _maintex_ST;
			float4 _FujiaTex_ST;
			float4 _Mask1_ST;
			float4 _flowmaptex_ST;
			float4 _Color3;
			float4 _reftex_ST;
			float4 _Mask_ST;
			float4 _vertextex_ST;
			float4 _dissolvetex_ST;
			float4 _Color2;
			float3 _Vector5;
			float2 _Vector4;
			float2 _Vector0;
			float2 _speed1;
			float2 _Vector1;
			float2 _Vector7;
			float2 _Vector6;
			float2 _Vector3;
			float2 _Vector2;
			float _Float4;
			float _Float11;
			float _Float6;
			float _Float18;
			float _Float13;
			float _Float23;
			float _Float17;
			float _Float24;
			float _Float34;
			float _Float37;
			float _Float36;
			float _Float8;
			float _Float15;
			float _Float12;
			float _Float0;
			float _Float43;
			float _Float41;
			float _Float33;
			float _Float29;
			float _Float19;
			float _Src;
			float _Float1;
			float _Float2;
			float _Dst;
			float _Float45;
			float _Float22;
			float _Float28;
			float _Float16;
			float _Float5;
			float _Float30;
			float _Float10;
			float _Float44;
			float _Float9;
			float _Float32;
			float _Float31;
			float _Float39;
			float _Float38;
			float _Float46;
			float _Float47;
			float _Float40;
			float _Float35;
			float _Float14;
			float _power3;
			float _Float20;
			float _Float42;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _vertextex;
			uniform float4 _CameraDepthTexture_TexelSize1;
			sampler2D _maintex;
			sampler2D _noise;
			sampler2D _flowmaptex;
			sampler2D _FujiaTex;
			sampler2D _Gradienttex;
			sampler2D _dissolvetex;
			sampler2D _reftex;
			sampler2D _Mask;
			sampler2D _Mask1;


			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			
			VertexOutput VertexFunction ( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_vertextex = v.ase_texcoord.xy * _vertextex_ST.xy + _vertextex_ST.zw;
				float2 panner168 = ( 1.0 * _Time.y * _Vector4 + uv_vertextex);
				float cos398 = cos( ( _Float45 * PI ) );
				float sin398 = sin( ( _Float45 * PI ) );
				float2 rotator398 = mul( panner168 - float2( 0.5,0.5 ) , float2x2( cos398 , -sin398 , sin398 , cos398 )) + float2( 0.5,0.5 );
				float4 texCoord167 = v.ase_texcoord2;
				texCoord167.xy = v.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult176 = lerp( 1.0 , texCoord167.w , _Float22);
				float3 vertexoffset181 = ( tex2Dlod( _vertextex, float4( rotator398, 0, 0.0) ).r * v.ase_normal * _Vector5 * lerpResult176 );
				
				float3 vertexPos97 = v.vertex.xyz;
				float4 ase_clipPos97 = TransformObjectToHClip((vertexPos97).xyz);
				float4 screenPos97 = ComputeScreenPos(ase_clipPos97);
				o.ase_texcoord3 = screenPos97;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord7.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord8 = screenPos;
				
				o.ase_texcoord4.xy = v.ase_texcoord.xy;
				o.ase_texcoord5 = v.ase_texcoord1;
				o.ase_texcoord6 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;
				o.ase_texcoord7.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = vertexoffset181;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				#ifdef ASE_FOG
				o.fogFactor = ComputeFogFactor( positionCS.z );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif
				float4 screenPos97 = IN.ase_texcoord3;
				float4 ase_screenPosNorm97 = screenPos97 / screenPos97.w;
				ase_screenPosNorm97.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm97.z : ase_screenPosNorm97.z * 0.5 + 0.5;
				float screenDepth97 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm97.xy ),_ZBufferParams);
				float distanceDepth97 = saturate( abs( ( screenDepth97 - LinearEyeDepth( ase_screenPosNorm97.z,_ZBufferParams ) ) / ( _Float16 ) ) );
				float depthfade_switch334 = _Float5;
				float lerpResult336 = lerp( distanceDepth97 , ( 1.0 - distanceDepth97 ) , depthfade_switch334);
				float depthfade126 = lerpResult336;
				float lerpResult330 = lerp( 0.0 , depthfade126 , depthfade_switch334);
				float2 uv_maintex = IN.ase_texcoord4.xy * _maintex_ST.xy + _maintex_ST.zw;
				float2 panner36 = ( 1.0 * _Time.y * _Vector0 + uv_maintex);
				float4 texCoord39 = IN.ase_texcoord5;
				texCoord39.xy = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult42 = (float2(texCoord39.x , texCoord39.y));
				float2 lerpResult59 = lerp( panner36 , ( uv_maintex + appendResult42 ) , _Float10);
				float2 maintexUV161 = lerpResult59;
				float2 uv_noise = IN.ase_texcoord4.xy * _noise_ST.xy + _noise_ST.zw;
				float2 panner53 = ( 1.0 * _Time.y * _Vector1 + uv_noise);
				float cos395 = cos( ( _Float44 * PI ) );
				float sin395 = sin( ( _Float44 * PI ) );
				float2 rotator395 = mul( panner53 - float2( 0.5,0.5 ) , float2x2( cos395 , -sin395 , sin395 , cos395 )) + float2( 0.5,0.5 );
				float noise70 = tex2D( _noise, rotator395 ).r;
				float noise_intensity67 = ( _Float9 * 0.1 );
				float2 uv_flowmaptex = IN.ase_texcoord4.xy * _flowmaptex_ST.xy + _flowmaptex_ST.zw;
				float4 tex2DNode241 = tex2D( _flowmaptex, uv_flowmaptex );
				float2 appendResult242 = (float2(tex2DNode241.r , tex2DNode241.g));
				float2 flowmap285 = appendResult242;
				float flowmap_intensity311 = _Float32;
				float4 texCoord100 = IN.ase_texcoord6;
				texCoord100.xy = IN.ase_texcoord6.xy * float2( 1,1 ) + float2( 0,0 );
				float flpwmap_custom_switch316 = _Float31;
				float lerpResult99 = lerp( flowmap_intensity311 , texCoord100.y , flpwmap_custom_switch316);
				float2 lerpResult283 = lerp( ( maintexUV161 + ( noise70 * noise_intensity67 ) ) , flowmap285 , lerpResult99);
				float cos377 = cos( ( _Float39 * PI ) );
				float sin377 = sin( ( _Float39 * PI ) );
				float2 rotator377 = mul( lerpResult283 - float2( 0.5,0.5 ) , float2x2( cos377 , -sin377 , sin377 , cos377 )) + float2( 0.5,0.5 );
				float4 tex2DNode1 = tex2D( _maintex, rotator377 );
				float2 uv_FujiaTex = IN.ase_texcoord4.xy * _FujiaTex_ST.xy + _FujiaTex_ST.zw;
				float2 appendResult449 = (float2(( _Float38 * _TimeParameters.x ) , ( _TimeParameters.x * _Float46 )));
				float4 tex2DNode437 = tex2D( _FujiaTex, (uv_FujiaTex*1.0 + appendResult449) );
				#if defined(_KEYWORD4_R)
				float staticSwitch453 = tex2DNode437.r;
				#elif defined(_KEYWORD4_A)
				float staticSwitch453 = tex2DNode437.a;
				#else
				float staticSwitch453 = tex2DNode437.r;
				#endif
				float4 fujiaTex439 = ( _Color2 * staticSwitch453 );
				float4 temp_output_457_0 = ( fujiaTex439 + tex2DNode1 );
				float4 lerpResult460 = lerp( temp_output_457_0 , tex2DNode1 , _Float47);
				#if defined(_KEYWORD8_ADD)
				float4 staticSwitch459 = temp_output_457_0;
				#elif defined(_KEYWORD8_ALPHA)
				float4 staticSwitch459 = lerpResult460;
				#else
				float4 staticSwitch459 = temp_output_457_0;
				#endif
				#ifdef _KEYWORD6_ON
				float4 staticSwitch456 = staticSwitch459;
				#else
				float4 staticSwitch456 = tex2DNode1;
				#endif
				float2 uv_Gradienttex = IN.ase_texcoord4.xy * _Gradienttex_ST.xy + _Gradienttex_ST.zw;
				float2 panner229 = ( 1.0 * _Time.y * _Vector7 + uv_Gradienttex);
				float2 Gradienttex231 = panner229;
				float2 temp_cast_0 = (noise70).xx;
				float2 lerpResult235 = lerp( Gradienttex231 , temp_cast_0 , noise_intensity67);
				float cos383 = cos( ( _Float40 * PI ) );
				float sin383 = sin( ( _Float40 * PI ) );
				float2 rotator383 = mul( lerpResult235 - float2( 0.5,0.5 ) , float2x2( cos383 , -sin383 , sin383 , cos383 )) + float2( 0.5,0.5 );
				float4 lerpResult211 = lerp( staticSwitch456 , tex2D( _Gradienttex, rotator383 ) , _Float29);
				float4 lerpResult359 = lerp( _Color0 , _Color3 , _Float35);
				float4 switchResult356 = (((ase_vface>0)?(_Color0):(lerpResult359)));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord7.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float fresnelNdotV139 = dot( normalize( ( normalizedWorldNormal * ase_vface ) ), ase_worldViewDir );
				float fresnelNode139 = ( 0.0 + _power3 * pow( max( 1.0 - fresnelNdotV139 , 0.0001 ), _Float19 ) );
				float temp_output_140_0 = saturate( fresnelNode139 );
				float lerpResult144 = lerp( temp_output_140_0 , ( 1.0 - temp_output_140_0 ) , _Float20);
				float fresnel147 = lerpResult144;
				float lerpResult347 = lerp( 1.0 , fresnel147 , _Float33);
				float4 texCoord49 = IN.ase_texcoord6;
				texCoord49.xy = IN.ase_texcoord6.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult62 = lerp( _Float6 , texCoord49.x , _Float11);
				float2 texCoord263 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord264 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord266 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord262 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_KEYWORD7_UP)
				float staticSwitch272 = ( 1.0 - saturate( texCoord263.y ) );
				#elif defined(_KEYWORD7_DOWN)
				float staticSwitch272 = saturate( texCoord264.y );
				#elif defined(_KEYWORD7_LEFT)
				float staticSwitch272 = saturate( texCoord266.x );
				#elif defined(_KEYWORD7_RIGHT)
				float staticSwitch272 = ( 1.0 - saturate( texCoord262.x ) );
				#elif defined(_KEYWORD7_OFF)
				float staticSwitch272 = 1.0;
				#else
				float staticSwitch272 = 1.0;
				#endif
				float dis_direction277 = pow( staticSwitch272 , _Float18 );
				float2 uv_dissolvetex = IN.ase_texcoord4.xy * _dissolvetex_ST.xy + _dissolvetex_ST.zw;
				float2 panner58 = ( 1.0 * _Time.y * _Vector2 + uv_dissolvetex);
				float2 temp_cast_1 = (noise70).xx;
				float2 lerpResult308 = lerp( panner58 , temp_cast_1 , noise_intensity67);
				float4 texCoord303 = IN.ase_texcoord6;
				texCoord303.xy = IN.ase_texcoord6.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult307 = lerp( flowmap_intensity311 , texCoord303.y , flpwmap_custom_switch316);
				float2 lerpResult309 = lerp( lerpResult308 , flowmap285 , lerpResult307);
				float2 lerpResult89 = lerp( panner58 , lerpResult309 , _Float13);
				float2 dissolveUV92 = lerpResult89;
				float cos386 = cos( ( _Float41 * PI ) );
				float sin386 = sin( ( _Float41 * PI ) );
				float2 rotator386 = mul( dissolveUV92 - float2( 0.5,0.5 ) , float2x2( cos386 , -sin386 , sin386 , cos386 )) + float2( 0.5,0.5 );
				float temp_output_280_0 = ( dis_direction277 * tex2D( _dissolvetex, rotator386 ).r );
				float temp_output_130_0 = (0.0 + (temp_output_280_0 - -0.5) * (1.0 - 0.0) / (1.5 - -0.5));
				float temp_output_105_0 = step( lerpResult62 , temp_output_130_0 );
				float dis_edge133 = ( temp_output_105_0 - step( ( lerpResult62 + _Float17 ) , temp_output_130_0 ) );
				float4 lerpResult131 = lerp( ( ( ( _Float28 * pow( lerpResult330 , _Float30 ) ) + lerpResult211 ) * IN.ase_color * switchResult356 * _Float14 * lerpResult347 ) , _Color1 , dis_edge133);
				float4 screenPos = IN.ase_texcoord8;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 uv_reftex = IN.ase_texcoord4.xy * _reftex_ST.xy + _reftex_ST.zw;
				float2 panner188 = ( 1.0 * _Time.y * _speed1 + uv_reftex);
				float4 texCoord194 = IN.ase_texcoord6;
				texCoord194.xy = IN.ase_texcoord6.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult193 = lerp( _Float23 , texCoord194.z , _Float24);
				float4 fetchOpaqueVal183 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( ase_grabScreenPosNorm + ( tex2D( _reftex, panner188 ).r * ( 0.1 * lerpResult193 ) ) ).xy ), 1.0 );
				float4 ref196 = fetchOpaqueVal183;
				#if defined(_KEYWORD3_OFF)
				float4 staticSwitch237 = lerpResult131;
				#elif defined(_KEYWORD3_ON)
				float4 staticSwitch237 = ref196;
				#else
				float4 staticSwitch237 = lerpResult131;
				#endif
				
				#if defined(_KEYWORD1_A)
				float staticSwitch14 = tex2DNode1.a;
				#elif defined(_KEYWORD1_R)
				float staticSwitch14 = tex2DNode1.r;
				#else
				float staticSwitch14 = tex2DNode1.a;
				#endif
				float lerpResult374 = lerp( staticSwitch14 , ( pow( staticSwitch14 , _Float34 ) * _Float37 ) , _Float36);
				float smoothstepResult32 = smoothstep( ( 1.0 - _Float8 ) , _Float8 , saturate( ( ( temp_output_280_0 + 1.0 ) - ( lerpResult62 * 2.0 ) ) ));
				float dis_soft122 = smoothstepResult32;
				float dis_bright124 = temp_output_105_0;
				#if defined(_KEYWORD5_OFF)
				float staticSwitch239 = dis_soft122;
				#elif defined(_KEYWORD5_ON)
				float staticSwitch239 = dis_bright124;
				#else
				float staticSwitch239 = dis_soft122;
				#endif
				float lerpResult338 = lerp( depthfade126 , 1.0 , depthfade_switch334);
				float2 uv_Mask = IN.ase_texcoord4.xy * _Mask_ST.xy + _Mask_ST.zw;
				float2 panner79 = ( 1.0 * _Time.y * _Vector3 + uv_Mask);
				float4 texCoord74 = IN.ase_texcoord5;
				texCoord74.xy = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult75 = (float2(texCoord74.z , texCoord74.w));
				float2 lerpResult80 = lerp( panner79 , ( uv_Mask + appendResult75 ) , _Float12);
				float lerpResult325 = lerp( 0.0 , ( noise70 * noise_intensity67 ) , _Float0);
				float cos392 = cos( ( _Float43 * PI ) );
				float sin392 = sin( ( _Float43 * PI ) );
				float2 rotator392 = mul( ( lerpResult80 + lerpResult325 ) - float2( 0.5,0.5 ) , float2x2( cos392 , -sin392 , sin392 , cos392 )) + float2( 0.5,0.5 );
				float4 tex2DNode8 = tex2D( _Mask, rotator392 );
				#if defined(_KEYWORD0_R)
				float staticSwitch11 = tex2DNode8.r;
				#elif defined(_KEYWORD0_A)
				float staticSwitch11 = tex2DNode8.a;
				#else
				float staticSwitch11 = tex2DNode8.a;
				#endif
				float2 uv_Mask1 = IN.ase_texcoord4.xy * _Mask1_ST.xy + _Mask1_ST.zw;
				float2 panner216 = ( 1.0 * _Time.y * _Vector6 + uv_Mask1);
				float cos389 = cos( ( _Float42 * PI ) );
				float sin389 = sin( ( _Float42 * PI ) );
				float2 rotator389 = mul( ( lerpResult325 + panner216 ) - float2( 0.5,0.5 ) , float2x2( cos389 , -sin389 , sin389 , cos389 )) + float2( 0.5,0.5 );
				float4 tex2DNode218 = tex2D( _Mask1, rotator389 );
				#if defined(_KEYWORD2_R)
				float staticSwitch219 = tex2DNode218.r;
				#elif defined(_KEYWORD2_A)
				float staticSwitch219 = tex2DNode218.a;
				#else
				float staticSwitch219 = tex2DNode218.a;
				#endif
				float Mask82 = ( staticSwitch11 * staticSwitch219 );
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = staticSwitch237.rgb;
				float Alpha = ( lerpResult374 * IN.ase_color.a * _Color0.a * staticSwitch239 * _Float15 * lerpResult338 * Mask82 * lerpResult347 );
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#if defined(_DBUFFER)
					ApplyDecalToBaseColor(IN.clipPos, Color);
				#endif

				#if defined(_ALPHAPREMULTIPLY_ON)
				Color *= Alpha;
				#endif


				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				return half4( Color, Alpha );
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM
			
			#pragma multi_compile_instancing
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1

			
			#pragma vertex vert
			#pragma fragment frag

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _KEYWORD1_A _KEYWORD1_R
			#pragma shader_feature_local _KEYWORD5_OFF _KEYWORD5_ON
			#pragma shader_feature_local _KEYWORD7_UP _KEYWORD7_DOWN _KEYWORD7_LEFT _KEYWORD7_RIGHT _KEYWORD7_OFF
			#pragma shader_feature_local _KEYWORD0_R _KEYWORD0_A
			#pragma shader_feature_local _KEYWORD2_R _KEYWORD2_A


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color0;
			float4 _Color1;
			float4 _noise_ST;
			float4 _Gradienttex_ST;
			float4 _maintex_ST;
			float4 _FujiaTex_ST;
			float4 _Mask1_ST;
			float4 _flowmaptex_ST;
			float4 _Color3;
			float4 _reftex_ST;
			float4 _Mask_ST;
			float4 _vertextex_ST;
			float4 _dissolvetex_ST;
			float4 _Color2;
			float3 _Vector5;
			float2 _Vector4;
			float2 _Vector0;
			float2 _speed1;
			float2 _Vector1;
			float2 _Vector7;
			float2 _Vector6;
			float2 _Vector3;
			float2 _Vector2;
			float _Float4;
			float _Float11;
			float _Float6;
			float _Float18;
			float _Float13;
			float _Float23;
			float _Float17;
			float _Float24;
			float _Float34;
			float _Float37;
			float _Float36;
			float _Float8;
			float _Float15;
			float _Float12;
			float _Float0;
			float _Float43;
			float _Float41;
			float _Float33;
			float _Float29;
			float _Float19;
			float _Src;
			float _Float1;
			float _Float2;
			float _Dst;
			float _Float45;
			float _Float22;
			float _Float28;
			float _Float16;
			float _Float5;
			float _Float30;
			float _Float10;
			float _Float44;
			float _Float9;
			float _Float32;
			float _Float31;
			float _Float39;
			float _Float38;
			float _Float46;
			float _Float47;
			float _Float40;
			float _Float35;
			float _Float14;
			float _power3;
			float _Float20;
			float _Float42;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _vertextex;
			sampler2D _maintex;
			sampler2D _noise;
			sampler2D _flowmaptex;
			sampler2D _dissolvetex;
			uniform float4 _CameraDepthTexture_TexelSize1;
			sampler2D _Mask;
			sampler2D _Mask1;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_vertextex = v.ase_texcoord.xy * _vertextex_ST.xy + _vertextex_ST.zw;
				float2 panner168 = ( 1.0 * _Time.y * _Vector4 + uv_vertextex);
				float cos398 = cos( ( _Float45 * PI ) );
				float sin398 = sin( ( _Float45 * PI ) );
				float2 rotator398 = mul( panner168 - float2( 0.5,0.5 ) , float2x2( cos398 , -sin398 , sin398 , cos398 )) + float2( 0.5,0.5 );
				float4 texCoord167 = v.ase_texcoord2;
				texCoord167.xy = v.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult176 = lerp( 1.0 , texCoord167.w , _Float22);
				float3 vertexoffset181 = ( tex2Dlod( _vertextex, float4( rotator398, 0, 0.0) ).r * v.ase_normal * _Vector5 * lerpResult176 );
				
				float3 vertexPos97 = v.vertex.xyz;
				float4 ase_clipPos97 = TransformObjectToHClip((vertexPos97).xyz);
				float4 screenPos97 = ComputeScreenPos(ase_clipPos97);
				o.ase_texcoord5 = screenPos97;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord6.xyz = ase_worldNormal;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_texcoord3 = v.ase_texcoord1;
				o.ase_texcoord4 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord6.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = vertexoffset181;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.clipPos = TransformWorldToHClip( positionWS );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_maintex = IN.ase_texcoord2.xy * _maintex_ST.xy + _maintex_ST.zw;
				float2 panner36 = ( 1.0 * _Time.y * _Vector0 + uv_maintex);
				float4 texCoord39 = IN.ase_texcoord3;
				texCoord39.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult42 = (float2(texCoord39.x , texCoord39.y));
				float2 lerpResult59 = lerp( panner36 , ( uv_maintex + appendResult42 ) , _Float10);
				float2 maintexUV161 = lerpResult59;
				float2 uv_noise = IN.ase_texcoord2.xy * _noise_ST.xy + _noise_ST.zw;
				float2 panner53 = ( 1.0 * _Time.y * _Vector1 + uv_noise);
				float cos395 = cos( ( _Float44 * PI ) );
				float sin395 = sin( ( _Float44 * PI ) );
				float2 rotator395 = mul( panner53 - float2( 0.5,0.5 ) , float2x2( cos395 , -sin395 , sin395 , cos395 )) + float2( 0.5,0.5 );
				float noise70 = tex2D( _noise, rotator395 ).r;
				float noise_intensity67 = ( _Float9 * 0.1 );
				float2 uv_flowmaptex = IN.ase_texcoord2.xy * _flowmaptex_ST.xy + _flowmaptex_ST.zw;
				float4 tex2DNode241 = tex2D( _flowmaptex, uv_flowmaptex );
				float2 appendResult242 = (float2(tex2DNode241.r , tex2DNode241.g));
				float2 flowmap285 = appendResult242;
				float flowmap_intensity311 = _Float32;
				float4 texCoord100 = IN.ase_texcoord4;
				texCoord100.xy = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float flpwmap_custom_switch316 = _Float31;
				float lerpResult99 = lerp( flowmap_intensity311 , texCoord100.y , flpwmap_custom_switch316);
				float2 lerpResult283 = lerp( ( maintexUV161 + ( noise70 * noise_intensity67 ) ) , flowmap285 , lerpResult99);
				float cos377 = cos( ( _Float39 * PI ) );
				float sin377 = sin( ( _Float39 * PI ) );
				float2 rotator377 = mul( lerpResult283 - float2( 0.5,0.5 ) , float2x2( cos377 , -sin377 , sin377 , cos377 )) + float2( 0.5,0.5 );
				float4 tex2DNode1 = tex2D( _maintex, rotator377 );
				#if defined(_KEYWORD1_A)
				float staticSwitch14 = tex2DNode1.a;
				#elif defined(_KEYWORD1_R)
				float staticSwitch14 = tex2DNode1.r;
				#else
				float staticSwitch14 = tex2DNode1.a;
				#endif
				float lerpResult374 = lerp( staticSwitch14 , ( pow( staticSwitch14 , _Float34 ) * _Float37 ) , _Float36);
				float2 texCoord263 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord264 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord266 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord262 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_KEYWORD7_UP)
				float staticSwitch272 = ( 1.0 - saturate( texCoord263.y ) );
				#elif defined(_KEYWORD7_DOWN)
				float staticSwitch272 = saturate( texCoord264.y );
				#elif defined(_KEYWORD7_LEFT)
				float staticSwitch272 = saturate( texCoord266.x );
				#elif defined(_KEYWORD7_RIGHT)
				float staticSwitch272 = ( 1.0 - saturate( texCoord262.x ) );
				#elif defined(_KEYWORD7_OFF)
				float staticSwitch272 = 1.0;
				#else
				float staticSwitch272 = 1.0;
				#endif
				float dis_direction277 = pow( staticSwitch272 , _Float18 );
				float2 uv_dissolvetex = IN.ase_texcoord2.xy * _dissolvetex_ST.xy + _dissolvetex_ST.zw;
				float2 panner58 = ( 1.0 * _Time.y * _Vector2 + uv_dissolvetex);
				float2 temp_cast_0 = (noise70).xx;
				float2 lerpResult308 = lerp( panner58 , temp_cast_0 , noise_intensity67);
				float4 texCoord303 = IN.ase_texcoord4;
				texCoord303.xy = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult307 = lerp( flowmap_intensity311 , texCoord303.y , flpwmap_custom_switch316);
				float2 lerpResult309 = lerp( lerpResult308 , flowmap285 , lerpResult307);
				float2 lerpResult89 = lerp( panner58 , lerpResult309 , _Float13);
				float2 dissolveUV92 = lerpResult89;
				float cos386 = cos( ( _Float41 * PI ) );
				float sin386 = sin( ( _Float41 * PI ) );
				float2 rotator386 = mul( dissolveUV92 - float2( 0.5,0.5 ) , float2x2( cos386 , -sin386 , sin386 , cos386 )) + float2( 0.5,0.5 );
				float temp_output_280_0 = ( dis_direction277 * tex2D( _dissolvetex, rotator386 ).r );
				float4 texCoord49 = IN.ase_texcoord4;
				texCoord49.xy = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult62 = lerp( _Float6 , texCoord49.x , _Float11);
				float smoothstepResult32 = smoothstep( ( 1.0 - _Float8 ) , _Float8 , saturate( ( ( temp_output_280_0 + 1.0 ) - ( lerpResult62 * 2.0 ) ) ));
				float dis_soft122 = smoothstepResult32;
				float temp_output_130_0 = (0.0 + (temp_output_280_0 - -0.5) * (1.0 - 0.0) / (1.5 - -0.5));
				float temp_output_105_0 = step( lerpResult62 , temp_output_130_0 );
				float dis_bright124 = temp_output_105_0;
				#if defined(_KEYWORD5_OFF)
				float staticSwitch239 = dis_soft122;
				#elif defined(_KEYWORD5_ON)
				float staticSwitch239 = dis_bright124;
				#else
				float staticSwitch239 = dis_soft122;
				#endif
				float4 screenPos97 = IN.ase_texcoord5;
				float4 ase_screenPosNorm97 = screenPos97 / screenPos97.w;
				ase_screenPosNorm97.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm97.z : ase_screenPosNorm97.z * 0.5 + 0.5;
				float screenDepth97 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm97.xy ),_ZBufferParams);
				float distanceDepth97 = saturate( abs( ( screenDepth97 - LinearEyeDepth( ase_screenPosNorm97.z,_ZBufferParams ) ) / ( _Float16 ) ) );
				float depthfade_switch334 = _Float5;
				float lerpResult336 = lerp( distanceDepth97 , ( 1.0 - distanceDepth97 ) , depthfade_switch334);
				float depthfade126 = lerpResult336;
				float lerpResult338 = lerp( depthfade126 , 1.0 , depthfade_switch334);
				float2 uv_Mask = IN.ase_texcoord2.xy * _Mask_ST.xy + _Mask_ST.zw;
				float2 panner79 = ( 1.0 * _Time.y * _Vector3 + uv_Mask);
				float4 texCoord74 = IN.ase_texcoord3;
				texCoord74.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult75 = (float2(texCoord74.z , texCoord74.w));
				float2 lerpResult80 = lerp( panner79 , ( uv_Mask + appendResult75 ) , _Float12);
				float lerpResult325 = lerp( 0.0 , ( noise70 * noise_intensity67 ) , _Float0);
				float cos392 = cos( ( _Float43 * PI ) );
				float sin392 = sin( ( _Float43 * PI ) );
				float2 rotator392 = mul( ( lerpResult80 + lerpResult325 ) - float2( 0.5,0.5 ) , float2x2( cos392 , -sin392 , sin392 , cos392 )) + float2( 0.5,0.5 );
				float4 tex2DNode8 = tex2D( _Mask, rotator392 );
				#if defined(_KEYWORD0_R)
				float staticSwitch11 = tex2DNode8.r;
				#elif defined(_KEYWORD0_A)
				float staticSwitch11 = tex2DNode8.a;
				#else
				float staticSwitch11 = tex2DNode8.a;
				#endif
				float2 uv_Mask1 = IN.ase_texcoord2.xy * _Mask1_ST.xy + _Mask1_ST.zw;
				float2 panner216 = ( 1.0 * _Time.y * _Vector6 + uv_Mask1);
				float cos389 = cos( ( _Float42 * PI ) );
				float sin389 = sin( ( _Float42 * PI ) );
				float2 rotator389 = mul( ( lerpResult325 + panner216 ) - float2( 0.5,0.5 ) , float2x2( cos389 , -sin389 , sin389 , cos389 )) + float2( 0.5,0.5 );
				float4 tex2DNode218 = tex2D( _Mask1, rotator389 );
				#if defined(_KEYWORD2_R)
				float staticSwitch219 = tex2DNode218.r;
				#elif defined(_KEYWORD2_A)
				float staticSwitch219 = tex2DNode218.a;
				#else
				float staticSwitch219 = tex2DNode218.a;
				#endif
				float Mask82 = ( staticSwitch11 * staticSwitch219 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float fresnelNdotV139 = dot( normalize( ( normalizedWorldNormal * ase_vface ) ), ase_worldViewDir );
				float fresnelNode139 = ( 0.0 + _power3 * pow( max( 1.0 - fresnelNdotV139 , 0.0001 ), _Float19 ) );
				float temp_output_140_0 = saturate( fresnelNode139 );
				float lerpResult144 = lerp( temp_output_140_0 , ( 1.0 - temp_output_140_0 ) , _Float20);
				float fresnel147 = lerpResult144;
				float lerpResult347 = lerp( 1.0 , fresnel147 , _Float33);
				
				float Alpha = ( lerpResult374 * IN.ase_color.a * _Color0.a * staticSwitch239 * _Float15 * lerpResult338 * Mask82 * lerpResult347 );
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }
			
			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM
			
			#pragma multi_compile_instancing
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1

			
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma shader_feature _ _SAMPLE_GI
			#pragma multi_compile _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ DEBUG_DISPLAY
			#define SHADERPASS SHADERPASS_UNLIT


			#pragma vertex vert
			#pragma fragment frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging3D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceData.hlsl"


			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _KEYWORD3_OFF _KEYWORD3_ON
			#pragma shader_feature_local _KEYWORD6_ON
			#pragma shader_feature_local _KEYWORD8_ADD _KEYWORD8_ALPHA
			#pragma shader_feature_local _KEYWORD4_R _KEYWORD4_A
			#pragma shader_feature_local _KEYWORD7_UP _KEYWORD7_DOWN _KEYWORD7_LEFT _KEYWORD7_RIGHT _KEYWORD7_OFF
			#pragma shader_feature_local _KEYWORD1_A _KEYWORD1_R
			#pragma shader_feature_local _KEYWORD5_OFF _KEYWORD5_ON
			#pragma shader_feature_local _KEYWORD0_R _KEYWORD0_A
			#pragma shader_feature_local _KEYWORD2_R _KEYWORD2_A


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef ASE_FOG
				float fogFactor : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color0;
			float4 _Color1;
			float4 _noise_ST;
			float4 _Gradienttex_ST;
			float4 _maintex_ST;
			float4 _FujiaTex_ST;
			float4 _Mask1_ST;
			float4 _flowmaptex_ST;
			float4 _Color3;
			float4 _reftex_ST;
			float4 _Mask_ST;
			float4 _vertextex_ST;
			float4 _dissolvetex_ST;
			float4 _Color2;
			float3 _Vector5;
			float2 _Vector4;
			float2 _Vector0;
			float2 _speed1;
			float2 _Vector1;
			float2 _Vector7;
			float2 _Vector6;
			float2 _Vector3;
			float2 _Vector2;
			float _Float4;
			float _Float11;
			float _Float6;
			float _Float18;
			float _Float13;
			float _Float23;
			float _Float17;
			float _Float24;
			float _Float34;
			float _Float37;
			float _Float36;
			float _Float8;
			float _Float15;
			float _Float12;
			float _Float0;
			float _Float43;
			float _Float41;
			float _Float33;
			float _Float29;
			float _Float19;
			float _Src;
			float _Float1;
			float _Float2;
			float _Dst;
			float _Float45;
			float _Float22;
			float _Float28;
			float _Float16;
			float _Float5;
			float _Float30;
			float _Float10;
			float _Float44;
			float _Float9;
			float _Float32;
			float _Float31;
			float _Float39;
			float _Float38;
			float _Float46;
			float _Float47;
			float _Float40;
			float _Float35;
			float _Float14;
			float _power3;
			float _Float20;
			float _Float42;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _vertextex;
			uniform float4 _CameraDepthTexture_TexelSize1;
			sampler2D _maintex;
			sampler2D _noise;
			sampler2D _flowmaptex;
			sampler2D _FujiaTex;
			sampler2D _Gradienttex;
			sampler2D _dissolvetex;
			sampler2D _reftex;
			sampler2D _Mask;
			sampler2D _Mask1;


			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			
			VertexOutput VertexFunction ( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_vertextex = v.ase_texcoord.xy * _vertextex_ST.xy + _vertextex_ST.zw;
				float2 panner168 = ( 1.0 * _Time.y * _Vector4 + uv_vertextex);
				float cos398 = cos( ( _Float45 * PI ) );
				float sin398 = sin( ( _Float45 * PI ) );
				float2 rotator398 = mul( panner168 - float2( 0.5,0.5 ) , float2x2( cos398 , -sin398 , sin398 , cos398 )) + float2( 0.5,0.5 );
				float4 texCoord167 = v.ase_texcoord2;
				texCoord167.xy = v.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult176 = lerp( 1.0 , texCoord167.w , _Float22);
				float3 vertexoffset181 = ( tex2Dlod( _vertextex, float4( rotator398, 0, 0.0) ).r * v.ase_normal * _Vector5 * lerpResult176 );
				
				float3 vertexPos97 = v.vertex.xyz;
				float4 ase_clipPos97 = TransformObjectToHClip((vertexPos97).xyz);
				float4 screenPos97 = ComputeScreenPos(ase_clipPos97);
				o.ase_texcoord3 = screenPos97;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord7.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord8 = screenPos;
				
				o.ase_texcoord4.xy = v.ase_texcoord.xy;
				o.ase_texcoord5 = v.ase_texcoord1;
				o.ase_texcoord6 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;
				o.ase_texcoord7.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = vertexoffset181;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				#ifdef ASE_FOG
				o.fogFactor = ComputeFogFactor( positionCS.z );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif
				float4 screenPos97 = IN.ase_texcoord3;
				float4 ase_screenPosNorm97 = screenPos97 / screenPos97.w;
				ase_screenPosNorm97.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm97.z : ase_screenPosNorm97.z * 0.5 + 0.5;
				float screenDepth97 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm97.xy ),_ZBufferParams);
				float distanceDepth97 = saturate( abs( ( screenDepth97 - LinearEyeDepth( ase_screenPosNorm97.z,_ZBufferParams ) ) / ( _Float16 ) ) );
				float depthfade_switch334 = _Float5;
				float lerpResult336 = lerp( distanceDepth97 , ( 1.0 - distanceDepth97 ) , depthfade_switch334);
				float depthfade126 = lerpResult336;
				float lerpResult330 = lerp( 0.0 , depthfade126 , depthfade_switch334);
				float2 uv_maintex = IN.ase_texcoord4.xy * _maintex_ST.xy + _maintex_ST.zw;
				float2 panner36 = ( 1.0 * _Time.y * _Vector0 + uv_maintex);
				float4 texCoord39 = IN.ase_texcoord5;
				texCoord39.xy = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult42 = (float2(texCoord39.x , texCoord39.y));
				float2 lerpResult59 = lerp( panner36 , ( uv_maintex + appendResult42 ) , _Float10);
				float2 maintexUV161 = lerpResult59;
				float2 uv_noise = IN.ase_texcoord4.xy * _noise_ST.xy + _noise_ST.zw;
				float2 panner53 = ( 1.0 * _Time.y * _Vector1 + uv_noise);
				float cos395 = cos( ( _Float44 * PI ) );
				float sin395 = sin( ( _Float44 * PI ) );
				float2 rotator395 = mul( panner53 - float2( 0.5,0.5 ) , float2x2( cos395 , -sin395 , sin395 , cos395 )) + float2( 0.5,0.5 );
				float noise70 = tex2D( _noise, rotator395 ).r;
				float noise_intensity67 = ( _Float9 * 0.1 );
				float2 uv_flowmaptex = IN.ase_texcoord4.xy * _flowmaptex_ST.xy + _flowmaptex_ST.zw;
				float4 tex2DNode241 = tex2D( _flowmaptex, uv_flowmaptex );
				float2 appendResult242 = (float2(tex2DNode241.r , tex2DNode241.g));
				float2 flowmap285 = appendResult242;
				float flowmap_intensity311 = _Float32;
				float4 texCoord100 = IN.ase_texcoord6;
				texCoord100.xy = IN.ase_texcoord6.xy * float2( 1,1 ) + float2( 0,0 );
				float flpwmap_custom_switch316 = _Float31;
				float lerpResult99 = lerp( flowmap_intensity311 , texCoord100.y , flpwmap_custom_switch316);
				float2 lerpResult283 = lerp( ( maintexUV161 + ( noise70 * noise_intensity67 ) ) , flowmap285 , lerpResult99);
				float cos377 = cos( ( _Float39 * PI ) );
				float sin377 = sin( ( _Float39 * PI ) );
				float2 rotator377 = mul( lerpResult283 - float2( 0.5,0.5 ) , float2x2( cos377 , -sin377 , sin377 , cos377 )) + float2( 0.5,0.5 );
				float4 tex2DNode1 = tex2D( _maintex, rotator377 );
				float2 uv_FujiaTex = IN.ase_texcoord4.xy * _FujiaTex_ST.xy + _FujiaTex_ST.zw;
				float2 appendResult449 = (float2(( _Float38 * _TimeParameters.x ) , ( _TimeParameters.x * _Float46 )));
				float4 tex2DNode437 = tex2D( _FujiaTex, (uv_FujiaTex*1.0 + appendResult449) );
				#if defined(_KEYWORD4_R)
				float staticSwitch453 = tex2DNode437.r;
				#elif defined(_KEYWORD4_A)
				float staticSwitch453 = tex2DNode437.a;
				#else
				float staticSwitch453 = tex2DNode437.r;
				#endif
				float4 fujiaTex439 = ( _Color2 * staticSwitch453 );
				float4 temp_output_457_0 = ( fujiaTex439 + tex2DNode1 );
				float4 lerpResult460 = lerp( temp_output_457_0 , tex2DNode1 , _Float47);
				#if defined(_KEYWORD8_ADD)
				float4 staticSwitch459 = temp_output_457_0;
				#elif defined(_KEYWORD8_ALPHA)
				float4 staticSwitch459 = lerpResult460;
				#else
				float4 staticSwitch459 = temp_output_457_0;
				#endif
				#ifdef _KEYWORD6_ON
				float4 staticSwitch456 = staticSwitch459;
				#else
				float4 staticSwitch456 = tex2DNode1;
				#endif
				float2 uv_Gradienttex = IN.ase_texcoord4.xy * _Gradienttex_ST.xy + _Gradienttex_ST.zw;
				float2 panner229 = ( 1.0 * _Time.y * _Vector7 + uv_Gradienttex);
				float2 Gradienttex231 = panner229;
				float2 temp_cast_0 = (noise70).xx;
				float2 lerpResult235 = lerp( Gradienttex231 , temp_cast_0 , noise_intensity67);
				float cos383 = cos( ( _Float40 * PI ) );
				float sin383 = sin( ( _Float40 * PI ) );
				float2 rotator383 = mul( lerpResult235 - float2( 0.5,0.5 ) , float2x2( cos383 , -sin383 , sin383 , cos383 )) + float2( 0.5,0.5 );
				float4 lerpResult211 = lerp( staticSwitch456 , tex2D( _Gradienttex, rotator383 ) , _Float29);
				float4 lerpResult359 = lerp( _Color0 , _Color3 , _Float35);
				float4 switchResult356 = (((ase_vface>0)?(_Color0):(lerpResult359)));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord7.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float fresnelNdotV139 = dot( normalize( ( normalizedWorldNormal * ase_vface ) ), ase_worldViewDir );
				float fresnelNode139 = ( 0.0 + _power3 * pow( max( 1.0 - fresnelNdotV139 , 0.0001 ), _Float19 ) );
				float temp_output_140_0 = saturate( fresnelNode139 );
				float lerpResult144 = lerp( temp_output_140_0 , ( 1.0 - temp_output_140_0 ) , _Float20);
				float fresnel147 = lerpResult144;
				float lerpResult347 = lerp( 1.0 , fresnel147 , _Float33);
				float4 texCoord49 = IN.ase_texcoord6;
				texCoord49.xy = IN.ase_texcoord6.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult62 = lerp( _Float6 , texCoord49.x , _Float11);
				float2 texCoord263 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord264 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord266 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord262 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_KEYWORD7_UP)
				float staticSwitch272 = ( 1.0 - saturate( texCoord263.y ) );
				#elif defined(_KEYWORD7_DOWN)
				float staticSwitch272 = saturate( texCoord264.y );
				#elif defined(_KEYWORD7_LEFT)
				float staticSwitch272 = saturate( texCoord266.x );
				#elif defined(_KEYWORD7_RIGHT)
				float staticSwitch272 = ( 1.0 - saturate( texCoord262.x ) );
				#elif defined(_KEYWORD7_OFF)
				float staticSwitch272 = 1.0;
				#else
				float staticSwitch272 = 1.0;
				#endif
				float dis_direction277 = pow( staticSwitch272 , _Float18 );
				float2 uv_dissolvetex = IN.ase_texcoord4.xy * _dissolvetex_ST.xy + _dissolvetex_ST.zw;
				float2 panner58 = ( 1.0 * _Time.y * _Vector2 + uv_dissolvetex);
				float2 temp_cast_1 = (noise70).xx;
				float2 lerpResult308 = lerp( panner58 , temp_cast_1 , noise_intensity67);
				float4 texCoord303 = IN.ase_texcoord6;
				texCoord303.xy = IN.ase_texcoord6.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult307 = lerp( flowmap_intensity311 , texCoord303.y , flpwmap_custom_switch316);
				float2 lerpResult309 = lerp( lerpResult308 , flowmap285 , lerpResult307);
				float2 lerpResult89 = lerp( panner58 , lerpResult309 , _Float13);
				float2 dissolveUV92 = lerpResult89;
				float cos386 = cos( ( _Float41 * PI ) );
				float sin386 = sin( ( _Float41 * PI ) );
				float2 rotator386 = mul( dissolveUV92 - float2( 0.5,0.5 ) , float2x2( cos386 , -sin386 , sin386 , cos386 )) + float2( 0.5,0.5 );
				float temp_output_280_0 = ( dis_direction277 * tex2D( _dissolvetex, rotator386 ).r );
				float temp_output_130_0 = (0.0 + (temp_output_280_0 - -0.5) * (1.0 - 0.0) / (1.5 - -0.5));
				float temp_output_105_0 = step( lerpResult62 , temp_output_130_0 );
				float dis_edge133 = ( temp_output_105_0 - step( ( lerpResult62 + _Float17 ) , temp_output_130_0 ) );
				float4 lerpResult131 = lerp( ( ( ( _Float28 * pow( lerpResult330 , _Float30 ) ) + lerpResult211 ) * IN.ase_color * switchResult356 * _Float14 * lerpResult347 ) , _Color1 , dis_edge133);
				float4 screenPos = IN.ase_texcoord8;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 uv_reftex = IN.ase_texcoord4.xy * _reftex_ST.xy + _reftex_ST.zw;
				float2 panner188 = ( 1.0 * _Time.y * _speed1 + uv_reftex);
				float4 texCoord194 = IN.ase_texcoord6;
				texCoord194.xy = IN.ase_texcoord6.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult193 = lerp( _Float23 , texCoord194.z , _Float24);
				float4 fetchOpaqueVal183 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( ase_grabScreenPosNorm + ( tex2D( _reftex, panner188 ).r * ( 0.1 * lerpResult193 ) ) ).xy ), 1.0 );
				float4 ref196 = fetchOpaqueVal183;
				#if defined(_KEYWORD3_OFF)
				float4 staticSwitch237 = lerpResult131;
				#elif defined(_KEYWORD3_ON)
				float4 staticSwitch237 = ref196;
				#else
				float4 staticSwitch237 = lerpResult131;
				#endif
				
				#if defined(_KEYWORD1_A)
				float staticSwitch14 = tex2DNode1.a;
				#elif defined(_KEYWORD1_R)
				float staticSwitch14 = tex2DNode1.r;
				#else
				float staticSwitch14 = tex2DNode1.a;
				#endif
				float lerpResult374 = lerp( staticSwitch14 , ( pow( staticSwitch14 , _Float34 ) * _Float37 ) , _Float36);
				float smoothstepResult32 = smoothstep( ( 1.0 - _Float8 ) , _Float8 , saturate( ( ( temp_output_280_0 + 1.0 ) - ( lerpResult62 * 2.0 ) ) ));
				float dis_soft122 = smoothstepResult32;
				float dis_bright124 = temp_output_105_0;
				#if defined(_KEYWORD5_OFF)
				float staticSwitch239 = dis_soft122;
				#elif defined(_KEYWORD5_ON)
				float staticSwitch239 = dis_bright124;
				#else
				float staticSwitch239 = dis_soft122;
				#endif
				float lerpResult338 = lerp( depthfade126 , 1.0 , depthfade_switch334);
				float2 uv_Mask = IN.ase_texcoord4.xy * _Mask_ST.xy + _Mask_ST.zw;
				float2 panner79 = ( 1.0 * _Time.y * _Vector3 + uv_Mask);
				float4 texCoord74 = IN.ase_texcoord5;
				texCoord74.xy = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult75 = (float2(texCoord74.z , texCoord74.w));
				float2 lerpResult80 = lerp( panner79 , ( uv_Mask + appendResult75 ) , _Float12);
				float lerpResult325 = lerp( 0.0 , ( noise70 * noise_intensity67 ) , _Float0);
				float cos392 = cos( ( _Float43 * PI ) );
				float sin392 = sin( ( _Float43 * PI ) );
				float2 rotator392 = mul( ( lerpResult80 + lerpResult325 ) - float2( 0.5,0.5 ) , float2x2( cos392 , -sin392 , sin392 , cos392 )) + float2( 0.5,0.5 );
				float4 tex2DNode8 = tex2D( _Mask, rotator392 );
				#if defined(_KEYWORD0_R)
				float staticSwitch11 = tex2DNode8.r;
				#elif defined(_KEYWORD0_A)
				float staticSwitch11 = tex2DNode8.a;
				#else
				float staticSwitch11 = tex2DNode8.a;
				#endif
				float2 uv_Mask1 = IN.ase_texcoord4.xy * _Mask1_ST.xy + _Mask1_ST.zw;
				float2 panner216 = ( 1.0 * _Time.y * _Vector6 + uv_Mask1);
				float cos389 = cos( ( _Float42 * PI ) );
				float sin389 = sin( ( _Float42 * PI ) );
				float2 rotator389 = mul( ( lerpResult325 + panner216 ) - float2( 0.5,0.5 ) , float2x2( cos389 , -sin389 , sin389 , cos389 )) + float2( 0.5,0.5 );
				float4 tex2DNode218 = tex2D( _Mask1, rotator389 );
				#if defined(_KEYWORD2_R)
				float staticSwitch219 = tex2DNode218.r;
				#elif defined(_KEYWORD2_A)
				float staticSwitch219 = tex2DNode218.a;
				#else
				float staticSwitch219 = tex2DNode218.a;
				#endif
				float Mask82 = ( staticSwitch11 * staticSwitch219 );
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = staticSwitch237.rgb;
				float Alpha = ( lerpResult374 * IN.ase_color.a * _Color0.a * staticSwitch239 * _Float15 * lerpResult338 * Mask82 * lerpResult347 );
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#if defined(_DBUFFER)
					ApplyDecalToBaseColor(IN.clipPos, Color);
				#endif

				#if defined(_ALPHAPREMULTIPLY_ON)
				Color *= Alpha;
				#endif


				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				return half4( Color, Alpha );
			}

			ENDHLSL
		}


		
        Pass
        {
			
            Name "SceneSelectionPass"
            Tags { "LightMode"="SceneSelectionPass" }
        
			Cull Off

			HLSLPROGRAM
        
			#pragma multi_compile_instancing
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1

        
			#pragma only_renderers d3d11 glcore gles gles3 
			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _KEYWORD1_A _KEYWORD1_R
			#pragma shader_feature_local _KEYWORD5_OFF _KEYWORD5_ON
			#pragma shader_feature_local _KEYWORD7_UP _KEYWORD7_DOWN _KEYWORD7_LEFT _KEYWORD7_RIGHT _KEYWORD7_OFF
			#pragma shader_feature_local _KEYWORD0_R _KEYWORD0_A
			#pragma shader_feature_local _KEYWORD2_R _KEYWORD2_A


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
        
			CBUFFER_START(UnityPerMaterial)
			float4 _Color0;
			float4 _Color1;
			float4 _noise_ST;
			float4 _Gradienttex_ST;
			float4 _maintex_ST;
			float4 _FujiaTex_ST;
			float4 _Mask1_ST;
			float4 _flowmaptex_ST;
			float4 _Color3;
			float4 _reftex_ST;
			float4 _Mask_ST;
			float4 _vertextex_ST;
			float4 _dissolvetex_ST;
			float4 _Color2;
			float3 _Vector5;
			float2 _Vector4;
			float2 _Vector0;
			float2 _speed1;
			float2 _Vector1;
			float2 _Vector7;
			float2 _Vector6;
			float2 _Vector3;
			float2 _Vector2;
			float _Float4;
			float _Float11;
			float _Float6;
			float _Float18;
			float _Float13;
			float _Float23;
			float _Float17;
			float _Float24;
			float _Float34;
			float _Float37;
			float _Float36;
			float _Float8;
			float _Float15;
			float _Float12;
			float _Float0;
			float _Float43;
			float _Float41;
			float _Float33;
			float _Float29;
			float _Float19;
			float _Src;
			float _Float1;
			float _Float2;
			float _Dst;
			float _Float45;
			float _Float22;
			float _Float28;
			float _Float16;
			float _Float5;
			float _Float30;
			float _Float10;
			float _Float44;
			float _Float9;
			float _Float32;
			float _Float31;
			float _Float39;
			float _Float38;
			float _Float46;
			float _Float47;
			float _Float40;
			float _Float35;
			float _Float14;
			float _power3;
			float _Float20;
			float _Float42;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _vertextex;
			sampler2D _maintex;
			sampler2D _noise;
			sampler2D _flowmaptex;
			sampler2D _dissolvetex;
			uniform float4 _CameraDepthTexture_TexelSize1;
			sampler2D _Mask;
			sampler2D _Mask1;


			
			int _ObjectId;
			int _PassValue;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};
        
			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);


				float2 uv_vertextex = v.ase_texcoord.xy * _vertextex_ST.xy + _vertextex_ST.zw;
				float2 panner168 = ( 1.0 * _Time.y * _Vector4 + uv_vertextex);
				float cos398 = cos( ( _Float45 * PI ) );
				float sin398 = sin( ( _Float45 * PI ) );
				float2 rotator398 = mul( panner168 - float2( 0.5,0.5 ) , float2x2( cos398 , -sin398 , sin398 , cos398 )) + float2( 0.5,0.5 );
				float4 texCoord167 = v.ase_texcoord2;
				texCoord167.xy = v.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult176 = lerp( 1.0 , texCoord167.w , _Float22);
				float3 vertexoffset181 = ( tex2Dlod( _vertextex, float4( rotator398, 0, 0.0) ).r * v.ase_normal * _Vector5 * lerpResult176 );
				
				float3 vertexPos97 = v.vertex.xyz;
				float4 ase_clipPos97 = TransformObjectToHClip((vertexPos97).xyz);
				float4 screenPos97 = ComputeScreenPos(ase_clipPos97);
				o.ase_texcoord3 = screenPos97;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				o.ase_texcoord4.xyz = ase_worldPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = vertexoffset181;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif
			
			half4 frag(VertexOutput IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float2 uv_maintex = IN.ase_texcoord.xy * _maintex_ST.xy + _maintex_ST.zw;
				float2 panner36 = ( 1.0 * _Time.y * _Vector0 + uv_maintex);
				float4 texCoord39 = IN.ase_texcoord1;
				texCoord39.xy = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult42 = (float2(texCoord39.x , texCoord39.y));
				float2 lerpResult59 = lerp( panner36 , ( uv_maintex + appendResult42 ) , _Float10);
				float2 maintexUV161 = lerpResult59;
				float2 uv_noise = IN.ase_texcoord.xy * _noise_ST.xy + _noise_ST.zw;
				float2 panner53 = ( 1.0 * _Time.y * _Vector1 + uv_noise);
				float cos395 = cos( ( _Float44 * PI ) );
				float sin395 = sin( ( _Float44 * PI ) );
				float2 rotator395 = mul( panner53 - float2( 0.5,0.5 ) , float2x2( cos395 , -sin395 , sin395 , cos395 )) + float2( 0.5,0.5 );
				float noise70 = tex2D( _noise, rotator395 ).r;
				float noise_intensity67 = ( _Float9 * 0.1 );
				float2 uv_flowmaptex = IN.ase_texcoord.xy * _flowmaptex_ST.xy + _flowmaptex_ST.zw;
				float4 tex2DNode241 = tex2D( _flowmaptex, uv_flowmaptex );
				float2 appendResult242 = (float2(tex2DNode241.r , tex2DNode241.g));
				float2 flowmap285 = appendResult242;
				float flowmap_intensity311 = _Float32;
				float4 texCoord100 = IN.ase_texcoord2;
				texCoord100.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float flpwmap_custom_switch316 = _Float31;
				float lerpResult99 = lerp( flowmap_intensity311 , texCoord100.y , flpwmap_custom_switch316);
				float2 lerpResult283 = lerp( ( maintexUV161 + ( noise70 * noise_intensity67 ) ) , flowmap285 , lerpResult99);
				float cos377 = cos( ( _Float39 * PI ) );
				float sin377 = sin( ( _Float39 * PI ) );
				float2 rotator377 = mul( lerpResult283 - float2( 0.5,0.5 ) , float2x2( cos377 , -sin377 , sin377 , cos377 )) + float2( 0.5,0.5 );
				float4 tex2DNode1 = tex2D( _maintex, rotator377 );
				#if defined(_KEYWORD1_A)
				float staticSwitch14 = tex2DNode1.a;
				#elif defined(_KEYWORD1_R)
				float staticSwitch14 = tex2DNode1.r;
				#else
				float staticSwitch14 = tex2DNode1.a;
				#endif
				float lerpResult374 = lerp( staticSwitch14 , ( pow( staticSwitch14 , _Float34 ) * _Float37 ) , _Float36);
				float2 texCoord263 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord264 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord266 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord262 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_KEYWORD7_UP)
				float staticSwitch272 = ( 1.0 - saturate( texCoord263.y ) );
				#elif defined(_KEYWORD7_DOWN)
				float staticSwitch272 = saturate( texCoord264.y );
				#elif defined(_KEYWORD7_LEFT)
				float staticSwitch272 = saturate( texCoord266.x );
				#elif defined(_KEYWORD7_RIGHT)
				float staticSwitch272 = ( 1.0 - saturate( texCoord262.x ) );
				#elif defined(_KEYWORD7_OFF)
				float staticSwitch272 = 1.0;
				#else
				float staticSwitch272 = 1.0;
				#endif
				float dis_direction277 = pow( staticSwitch272 , _Float18 );
				float2 uv_dissolvetex = IN.ase_texcoord.xy * _dissolvetex_ST.xy + _dissolvetex_ST.zw;
				float2 panner58 = ( 1.0 * _Time.y * _Vector2 + uv_dissolvetex);
				float2 temp_cast_0 = (noise70).xx;
				float2 lerpResult308 = lerp( panner58 , temp_cast_0 , noise_intensity67);
				float4 texCoord303 = IN.ase_texcoord2;
				texCoord303.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult307 = lerp( flowmap_intensity311 , texCoord303.y , flpwmap_custom_switch316);
				float2 lerpResult309 = lerp( lerpResult308 , flowmap285 , lerpResult307);
				float2 lerpResult89 = lerp( panner58 , lerpResult309 , _Float13);
				float2 dissolveUV92 = lerpResult89;
				float cos386 = cos( ( _Float41 * PI ) );
				float sin386 = sin( ( _Float41 * PI ) );
				float2 rotator386 = mul( dissolveUV92 - float2( 0.5,0.5 ) , float2x2( cos386 , -sin386 , sin386 , cos386 )) + float2( 0.5,0.5 );
				float temp_output_280_0 = ( dis_direction277 * tex2D( _dissolvetex, rotator386 ).r );
				float4 texCoord49 = IN.ase_texcoord2;
				texCoord49.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult62 = lerp( _Float6 , texCoord49.x , _Float11);
				float smoothstepResult32 = smoothstep( ( 1.0 - _Float8 ) , _Float8 , saturate( ( ( temp_output_280_0 + 1.0 ) - ( lerpResult62 * 2.0 ) ) ));
				float dis_soft122 = smoothstepResult32;
				float temp_output_130_0 = (0.0 + (temp_output_280_0 - -0.5) * (1.0 - 0.0) / (1.5 - -0.5));
				float temp_output_105_0 = step( lerpResult62 , temp_output_130_0 );
				float dis_bright124 = temp_output_105_0;
				#if defined(_KEYWORD5_OFF)
				float staticSwitch239 = dis_soft122;
				#elif defined(_KEYWORD5_ON)
				float staticSwitch239 = dis_bright124;
				#else
				float staticSwitch239 = dis_soft122;
				#endif
				float4 screenPos97 = IN.ase_texcoord3;
				float4 ase_screenPosNorm97 = screenPos97 / screenPos97.w;
				ase_screenPosNorm97.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm97.z : ase_screenPosNorm97.z * 0.5 + 0.5;
				float screenDepth97 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm97.xy ),_ZBufferParams);
				float distanceDepth97 = saturate( abs( ( screenDepth97 - LinearEyeDepth( ase_screenPosNorm97.z,_ZBufferParams ) ) / ( _Float16 ) ) );
				float depthfade_switch334 = _Float5;
				float lerpResult336 = lerp( distanceDepth97 , ( 1.0 - distanceDepth97 ) , depthfade_switch334);
				float depthfade126 = lerpResult336;
				float lerpResult338 = lerp( depthfade126 , 1.0 , depthfade_switch334);
				float2 uv_Mask = IN.ase_texcoord.xy * _Mask_ST.xy + _Mask_ST.zw;
				float2 panner79 = ( 1.0 * _Time.y * _Vector3 + uv_Mask);
				float4 texCoord74 = IN.ase_texcoord1;
				texCoord74.xy = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult75 = (float2(texCoord74.z , texCoord74.w));
				float2 lerpResult80 = lerp( panner79 , ( uv_Mask + appendResult75 ) , _Float12);
				float lerpResult325 = lerp( 0.0 , ( noise70 * noise_intensity67 ) , _Float0);
				float cos392 = cos( ( _Float43 * PI ) );
				float sin392 = sin( ( _Float43 * PI ) );
				float2 rotator392 = mul( ( lerpResult80 + lerpResult325 ) - float2( 0.5,0.5 ) , float2x2( cos392 , -sin392 , sin392 , cos392 )) + float2( 0.5,0.5 );
				float4 tex2DNode8 = tex2D( _Mask, rotator392 );
				#if defined(_KEYWORD0_R)
				float staticSwitch11 = tex2DNode8.r;
				#elif defined(_KEYWORD0_A)
				float staticSwitch11 = tex2DNode8.a;
				#else
				float staticSwitch11 = tex2DNode8.a;
				#endif
				float2 uv_Mask1 = IN.ase_texcoord.xy * _Mask1_ST.xy + _Mask1_ST.zw;
				float2 panner216 = ( 1.0 * _Time.y * _Vector6 + uv_Mask1);
				float cos389 = cos( ( _Float42 * PI ) );
				float sin389 = sin( ( _Float42 * PI ) );
				float2 rotator389 = mul( ( lerpResult325 + panner216 ) - float2( 0.5,0.5 ) , float2x2( cos389 , -sin389 , sin389 , cos389 )) + float2( 0.5,0.5 );
				float4 tex2DNode218 = tex2D( _Mask1, rotator389 );
				#if defined(_KEYWORD2_R)
				float staticSwitch219 = tex2DNode218.r;
				#elif defined(_KEYWORD2_A)
				float staticSwitch219 = tex2DNode218.a;
				#else
				float staticSwitch219 = tex2DNode218.a;
				#endif
				float Mask82 = ( staticSwitch11 * staticSwitch219 );
				float3 ase_worldPos = IN.ase_texcoord4.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float fresnelNdotV139 = dot( normalize( ( normalizedWorldNormal * ase_vface ) ), ase_worldViewDir );
				float fresnelNode139 = ( 0.0 + _power3 * pow( max( 1.0 - fresnelNdotV139 , 0.0001 ), _Float19 ) );
				float temp_output_140_0 = saturate( fresnelNode139 );
				float lerpResult144 = lerp( temp_output_140_0 , ( 1.0 - temp_output_140_0 ) , _Float20);
				float fresnel147 = lerpResult144;
				float lerpResult347 = lerp( 1.0 , fresnel147 , _Float33);
				
				surfaceDescription.Alpha = ( lerpResult374 * IN.ase_color.a * _Color0.a * staticSwitch239 * _Float15 * lerpResult338 * Mask82 * lerpResult347 );
				surfaceDescription.AlphaClipThreshold = 0.5;


				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				return outColor;
			}

			ENDHLSL
        }

		
        Pass
        {
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }
        
			HLSLPROGRAM

			#pragma multi_compile_instancing
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma only_renderers d3d11 glcore gles gles3 
			#pragma vertex vert
			#pragma fragment frag

        
			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY
			

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _KEYWORD1_A _KEYWORD1_R
			#pragma shader_feature_local _KEYWORD5_OFF _KEYWORD5_ON
			#pragma shader_feature_local _KEYWORD7_UP _KEYWORD7_DOWN _KEYWORD7_LEFT _KEYWORD7_RIGHT _KEYWORD7_OFF
			#pragma shader_feature_local _KEYWORD0_R _KEYWORD0_A
			#pragma shader_feature_local _KEYWORD2_R _KEYWORD2_A


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
        
			CBUFFER_START(UnityPerMaterial)
			float4 _Color0;
			float4 _Color1;
			float4 _noise_ST;
			float4 _Gradienttex_ST;
			float4 _maintex_ST;
			float4 _FujiaTex_ST;
			float4 _Mask1_ST;
			float4 _flowmaptex_ST;
			float4 _Color3;
			float4 _reftex_ST;
			float4 _Mask_ST;
			float4 _vertextex_ST;
			float4 _dissolvetex_ST;
			float4 _Color2;
			float3 _Vector5;
			float2 _Vector4;
			float2 _Vector0;
			float2 _speed1;
			float2 _Vector1;
			float2 _Vector7;
			float2 _Vector6;
			float2 _Vector3;
			float2 _Vector2;
			float _Float4;
			float _Float11;
			float _Float6;
			float _Float18;
			float _Float13;
			float _Float23;
			float _Float17;
			float _Float24;
			float _Float34;
			float _Float37;
			float _Float36;
			float _Float8;
			float _Float15;
			float _Float12;
			float _Float0;
			float _Float43;
			float _Float41;
			float _Float33;
			float _Float29;
			float _Float19;
			float _Src;
			float _Float1;
			float _Float2;
			float _Dst;
			float _Float45;
			float _Float22;
			float _Float28;
			float _Float16;
			float _Float5;
			float _Float30;
			float _Float10;
			float _Float44;
			float _Float9;
			float _Float32;
			float _Float31;
			float _Float39;
			float _Float38;
			float _Float46;
			float _Float47;
			float _Float40;
			float _Float35;
			float _Float14;
			float _power3;
			float _Float20;
			float _Float42;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _vertextex;
			sampler2D _maintex;
			sampler2D _noise;
			sampler2D _flowmaptex;
			sampler2D _dissolvetex;
			uniform float4 _CameraDepthTexture_TexelSize1;
			sampler2D _Mask;
			sampler2D _Mask1;


			
        
			float4 _SelectionID;

        
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};
        
			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);


				float2 uv_vertextex = v.ase_texcoord.xy * _vertextex_ST.xy + _vertextex_ST.zw;
				float2 panner168 = ( 1.0 * _Time.y * _Vector4 + uv_vertextex);
				float cos398 = cos( ( _Float45 * PI ) );
				float sin398 = sin( ( _Float45 * PI ) );
				float2 rotator398 = mul( panner168 - float2( 0.5,0.5 ) , float2x2( cos398 , -sin398 , sin398 , cos398 )) + float2( 0.5,0.5 );
				float4 texCoord167 = v.ase_texcoord2;
				texCoord167.xy = v.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult176 = lerp( 1.0 , texCoord167.w , _Float22);
				float3 vertexoffset181 = ( tex2Dlod( _vertextex, float4( rotator398, 0, 0.0) ).r * v.ase_normal * _Vector5 * lerpResult176 );
				
				float3 vertexPos97 = v.vertex.xyz;
				float4 ase_clipPos97 = TransformObjectToHClip((vertexPos97).xyz);
				float4 screenPos97 = ComputeScreenPos(ase_clipPos97);
				o.ase_texcoord3 = screenPos97;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				o.ase_texcoord4.xyz = ase_worldPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = vertexoffset181;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float2 uv_maintex = IN.ase_texcoord.xy * _maintex_ST.xy + _maintex_ST.zw;
				float2 panner36 = ( 1.0 * _Time.y * _Vector0 + uv_maintex);
				float4 texCoord39 = IN.ase_texcoord1;
				texCoord39.xy = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult42 = (float2(texCoord39.x , texCoord39.y));
				float2 lerpResult59 = lerp( panner36 , ( uv_maintex + appendResult42 ) , _Float10);
				float2 maintexUV161 = lerpResult59;
				float2 uv_noise = IN.ase_texcoord.xy * _noise_ST.xy + _noise_ST.zw;
				float2 panner53 = ( 1.0 * _Time.y * _Vector1 + uv_noise);
				float cos395 = cos( ( _Float44 * PI ) );
				float sin395 = sin( ( _Float44 * PI ) );
				float2 rotator395 = mul( panner53 - float2( 0.5,0.5 ) , float2x2( cos395 , -sin395 , sin395 , cos395 )) + float2( 0.5,0.5 );
				float noise70 = tex2D( _noise, rotator395 ).r;
				float noise_intensity67 = ( _Float9 * 0.1 );
				float2 uv_flowmaptex = IN.ase_texcoord.xy * _flowmaptex_ST.xy + _flowmaptex_ST.zw;
				float4 tex2DNode241 = tex2D( _flowmaptex, uv_flowmaptex );
				float2 appendResult242 = (float2(tex2DNode241.r , tex2DNode241.g));
				float2 flowmap285 = appendResult242;
				float flowmap_intensity311 = _Float32;
				float4 texCoord100 = IN.ase_texcoord2;
				texCoord100.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float flpwmap_custom_switch316 = _Float31;
				float lerpResult99 = lerp( flowmap_intensity311 , texCoord100.y , flpwmap_custom_switch316);
				float2 lerpResult283 = lerp( ( maintexUV161 + ( noise70 * noise_intensity67 ) ) , flowmap285 , lerpResult99);
				float cos377 = cos( ( _Float39 * PI ) );
				float sin377 = sin( ( _Float39 * PI ) );
				float2 rotator377 = mul( lerpResult283 - float2( 0.5,0.5 ) , float2x2( cos377 , -sin377 , sin377 , cos377 )) + float2( 0.5,0.5 );
				float4 tex2DNode1 = tex2D( _maintex, rotator377 );
				#if defined(_KEYWORD1_A)
				float staticSwitch14 = tex2DNode1.a;
				#elif defined(_KEYWORD1_R)
				float staticSwitch14 = tex2DNode1.r;
				#else
				float staticSwitch14 = tex2DNode1.a;
				#endif
				float lerpResult374 = lerp( staticSwitch14 , ( pow( staticSwitch14 , _Float34 ) * _Float37 ) , _Float36);
				float2 texCoord263 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord264 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord266 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord262 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_KEYWORD7_UP)
				float staticSwitch272 = ( 1.0 - saturate( texCoord263.y ) );
				#elif defined(_KEYWORD7_DOWN)
				float staticSwitch272 = saturate( texCoord264.y );
				#elif defined(_KEYWORD7_LEFT)
				float staticSwitch272 = saturate( texCoord266.x );
				#elif defined(_KEYWORD7_RIGHT)
				float staticSwitch272 = ( 1.0 - saturate( texCoord262.x ) );
				#elif defined(_KEYWORD7_OFF)
				float staticSwitch272 = 1.0;
				#else
				float staticSwitch272 = 1.0;
				#endif
				float dis_direction277 = pow( staticSwitch272 , _Float18 );
				float2 uv_dissolvetex = IN.ase_texcoord.xy * _dissolvetex_ST.xy + _dissolvetex_ST.zw;
				float2 panner58 = ( 1.0 * _Time.y * _Vector2 + uv_dissolvetex);
				float2 temp_cast_0 = (noise70).xx;
				float2 lerpResult308 = lerp( panner58 , temp_cast_0 , noise_intensity67);
				float4 texCoord303 = IN.ase_texcoord2;
				texCoord303.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult307 = lerp( flowmap_intensity311 , texCoord303.y , flpwmap_custom_switch316);
				float2 lerpResult309 = lerp( lerpResult308 , flowmap285 , lerpResult307);
				float2 lerpResult89 = lerp( panner58 , lerpResult309 , _Float13);
				float2 dissolveUV92 = lerpResult89;
				float cos386 = cos( ( _Float41 * PI ) );
				float sin386 = sin( ( _Float41 * PI ) );
				float2 rotator386 = mul( dissolveUV92 - float2( 0.5,0.5 ) , float2x2( cos386 , -sin386 , sin386 , cos386 )) + float2( 0.5,0.5 );
				float temp_output_280_0 = ( dis_direction277 * tex2D( _dissolvetex, rotator386 ).r );
				float4 texCoord49 = IN.ase_texcoord2;
				texCoord49.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult62 = lerp( _Float6 , texCoord49.x , _Float11);
				float smoothstepResult32 = smoothstep( ( 1.0 - _Float8 ) , _Float8 , saturate( ( ( temp_output_280_0 + 1.0 ) - ( lerpResult62 * 2.0 ) ) ));
				float dis_soft122 = smoothstepResult32;
				float temp_output_130_0 = (0.0 + (temp_output_280_0 - -0.5) * (1.0 - 0.0) / (1.5 - -0.5));
				float temp_output_105_0 = step( lerpResult62 , temp_output_130_0 );
				float dis_bright124 = temp_output_105_0;
				#if defined(_KEYWORD5_OFF)
				float staticSwitch239 = dis_soft122;
				#elif defined(_KEYWORD5_ON)
				float staticSwitch239 = dis_bright124;
				#else
				float staticSwitch239 = dis_soft122;
				#endif
				float4 screenPos97 = IN.ase_texcoord3;
				float4 ase_screenPosNorm97 = screenPos97 / screenPos97.w;
				ase_screenPosNorm97.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm97.z : ase_screenPosNorm97.z * 0.5 + 0.5;
				float screenDepth97 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm97.xy ),_ZBufferParams);
				float distanceDepth97 = saturate( abs( ( screenDepth97 - LinearEyeDepth( ase_screenPosNorm97.z,_ZBufferParams ) ) / ( _Float16 ) ) );
				float depthfade_switch334 = _Float5;
				float lerpResult336 = lerp( distanceDepth97 , ( 1.0 - distanceDepth97 ) , depthfade_switch334);
				float depthfade126 = lerpResult336;
				float lerpResult338 = lerp( depthfade126 , 1.0 , depthfade_switch334);
				float2 uv_Mask = IN.ase_texcoord.xy * _Mask_ST.xy + _Mask_ST.zw;
				float2 panner79 = ( 1.0 * _Time.y * _Vector3 + uv_Mask);
				float4 texCoord74 = IN.ase_texcoord1;
				texCoord74.xy = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult75 = (float2(texCoord74.z , texCoord74.w));
				float2 lerpResult80 = lerp( panner79 , ( uv_Mask + appendResult75 ) , _Float12);
				float lerpResult325 = lerp( 0.0 , ( noise70 * noise_intensity67 ) , _Float0);
				float cos392 = cos( ( _Float43 * PI ) );
				float sin392 = sin( ( _Float43 * PI ) );
				float2 rotator392 = mul( ( lerpResult80 + lerpResult325 ) - float2( 0.5,0.5 ) , float2x2( cos392 , -sin392 , sin392 , cos392 )) + float2( 0.5,0.5 );
				float4 tex2DNode8 = tex2D( _Mask, rotator392 );
				#if defined(_KEYWORD0_R)
				float staticSwitch11 = tex2DNode8.r;
				#elif defined(_KEYWORD0_A)
				float staticSwitch11 = tex2DNode8.a;
				#else
				float staticSwitch11 = tex2DNode8.a;
				#endif
				float2 uv_Mask1 = IN.ase_texcoord.xy * _Mask1_ST.xy + _Mask1_ST.zw;
				float2 panner216 = ( 1.0 * _Time.y * _Vector6 + uv_Mask1);
				float cos389 = cos( ( _Float42 * PI ) );
				float sin389 = sin( ( _Float42 * PI ) );
				float2 rotator389 = mul( ( lerpResult325 + panner216 ) - float2( 0.5,0.5 ) , float2x2( cos389 , -sin389 , sin389 , cos389 )) + float2( 0.5,0.5 );
				float4 tex2DNode218 = tex2D( _Mask1, rotator389 );
				#if defined(_KEYWORD2_R)
				float staticSwitch219 = tex2DNode218.r;
				#elif defined(_KEYWORD2_A)
				float staticSwitch219 = tex2DNode218.a;
				#else
				float staticSwitch219 = tex2DNode218.a;
				#endif
				float Mask82 = ( staticSwitch11 * staticSwitch219 );
				float3 ase_worldPos = IN.ase_texcoord4.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float fresnelNdotV139 = dot( normalize( ( normalizedWorldNormal * ase_vface ) ), ase_worldViewDir );
				float fresnelNode139 = ( 0.0 + _power3 * pow( max( 1.0 - fresnelNdotV139 , 0.0001 ), _Float19 ) );
				float temp_output_140_0 = saturate( fresnelNode139 );
				float lerpResult144 = lerp( temp_output_140_0 , ( 1.0 - temp_output_140_0 ) , _Float20);
				float fresnel147 = lerpResult144;
				float lerpResult347 = lerp( 1.0 , fresnel147 , _Float33);
				
				surfaceDescription.Alpha = ( lerpResult374 * IN.ase_color.a * _Color0.a * staticSwitch239 * _Float15 * lerpResult338 * Mask82 * lerpResult347 );
				surfaceDescription.AlphaClipThreshold = 0.5;


				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;
				outColor = _SelectionID;
				
				return outColor;
			}
        
			ENDHLSL
        }
		
		
        Pass
        {
			
            Name "DepthNormals"
            Tags { "LightMode"="DepthNormalsOnly" }

			ZTest LEqual
			ZWrite On

        
			HLSLPROGRAM
			
			#pragma multi_compile_instancing
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1

			
			#pragma only_renderers d3d11 glcore gles gles3 
			#pragma multi_compile_fog
			#pragma instancing_options renderinglayer
			#pragma vertex vert
			#pragma fragment frag

        
			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_NORMAL_WS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _KEYWORD1_A _KEYWORD1_R
			#pragma shader_feature_local _KEYWORD5_OFF _KEYWORD5_ON
			#pragma shader_feature_local _KEYWORD7_UP _KEYWORD7_DOWN _KEYWORD7_LEFT _KEYWORD7_RIGHT _KEYWORD7_OFF
			#pragma shader_feature_local _KEYWORD0_R _KEYWORD0_A
			#pragma shader_feature_local _KEYWORD2_R _KEYWORD2_A


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
        
			CBUFFER_START(UnityPerMaterial)
			float4 _Color0;
			float4 _Color1;
			float4 _noise_ST;
			float4 _Gradienttex_ST;
			float4 _maintex_ST;
			float4 _FujiaTex_ST;
			float4 _Mask1_ST;
			float4 _flowmaptex_ST;
			float4 _Color3;
			float4 _reftex_ST;
			float4 _Mask_ST;
			float4 _vertextex_ST;
			float4 _dissolvetex_ST;
			float4 _Color2;
			float3 _Vector5;
			float2 _Vector4;
			float2 _Vector0;
			float2 _speed1;
			float2 _Vector1;
			float2 _Vector7;
			float2 _Vector6;
			float2 _Vector3;
			float2 _Vector2;
			float _Float4;
			float _Float11;
			float _Float6;
			float _Float18;
			float _Float13;
			float _Float23;
			float _Float17;
			float _Float24;
			float _Float34;
			float _Float37;
			float _Float36;
			float _Float8;
			float _Float15;
			float _Float12;
			float _Float0;
			float _Float43;
			float _Float41;
			float _Float33;
			float _Float29;
			float _Float19;
			float _Src;
			float _Float1;
			float _Float2;
			float _Dst;
			float _Float45;
			float _Float22;
			float _Float28;
			float _Float16;
			float _Float5;
			float _Float30;
			float _Float10;
			float _Float44;
			float _Float9;
			float _Float32;
			float _Float31;
			float _Float39;
			float _Float38;
			float _Float46;
			float _Float47;
			float _Float40;
			float _Float35;
			float _Float14;
			float _power3;
			float _Float20;
			float _Float42;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _vertextex;
			sampler2D _maintex;
			sampler2D _noise;
			sampler2D _flowmaptex;
			sampler2D _dissolvetex;
			uniform float4 _CameraDepthTexture_TexelSize1;
			sampler2D _Mask;
			sampler2D _Mask1;


			      
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};
        
			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_vertextex = v.ase_texcoord.xy * _vertextex_ST.xy + _vertextex_ST.zw;
				float2 panner168 = ( 1.0 * _Time.y * _Vector4 + uv_vertextex);
				float cos398 = cos( ( _Float45 * PI ) );
				float sin398 = sin( ( _Float45 * PI ) );
				float2 rotator398 = mul( panner168 - float2( 0.5,0.5 ) , float2x2( cos398 , -sin398 , sin398 , cos398 )) + float2( 0.5,0.5 );
				float4 texCoord167 = v.ase_texcoord2;
				texCoord167.xy = v.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult176 = lerp( 1.0 , texCoord167.w , _Float22);
				float3 vertexoffset181 = ( tex2Dlod( _vertextex, float4( rotator398, 0, 0.0) ).r * v.ase_normal * _Vector5 * lerpResult176 );
				
				float3 vertexPos97 = v.vertex.xyz;
				float4 ase_clipPos97 = TransformObjectToHClip((vertexPos97).xyz);
				float4 screenPos97 = ComputeScreenPos(ase_clipPos97);
				o.ase_texcoord4 = screenPos97;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				o.ase_texcoord5.xyz = ase_worldPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_texcoord2 = v.ase_texcoord1;
				o.ase_texcoord3 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord5.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = vertexoffset181;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal(v.ase_normal);

				o.clipPos = TransformWorldToHClip(positionWS);
				o.normalWS.xyz =  normalWS;

				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float2 uv_maintex = IN.ase_texcoord1.xy * _maintex_ST.xy + _maintex_ST.zw;
				float2 panner36 = ( 1.0 * _Time.y * _Vector0 + uv_maintex);
				float4 texCoord39 = IN.ase_texcoord2;
				texCoord39.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult42 = (float2(texCoord39.x , texCoord39.y));
				float2 lerpResult59 = lerp( panner36 , ( uv_maintex + appendResult42 ) , _Float10);
				float2 maintexUV161 = lerpResult59;
				float2 uv_noise = IN.ase_texcoord1.xy * _noise_ST.xy + _noise_ST.zw;
				float2 panner53 = ( 1.0 * _Time.y * _Vector1 + uv_noise);
				float cos395 = cos( ( _Float44 * PI ) );
				float sin395 = sin( ( _Float44 * PI ) );
				float2 rotator395 = mul( panner53 - float2( 0.5,0.5 ) , float2x2( cos395 , -sin395 , sin395 , cos395 )) + float2( 0.5,0.5 );
				float noise70 = tex2D( _noise, rotator395 ).r;
				float noise_intensity67 = ( _Float9 * 0.1 );
				float2 uv_flowmaptex = IN.ase_texcoord1.xy * _flowmaptex_ST.xy + _flowmaptex_ST.zw;
				float4 tex2DNode241 = tex2D( _flowmaptex, uv_flowmaptex );
				float2 appendResult242 = (float2(tex2DNode241.r , tex2DNode241.g));
				float2 flowmap285 = appendResult242;
				float flowmap_intensity311 = _Float32;
				float4 texCoord100 = IN.ase_texcoord3;
				texCoord100.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float flpwmap_custom_switch316 = _Float31;
				float lerpResult99 = lerp( flowmap_intensity311 , texCoord100.y , flpwmap_custom_switch316);
				float2 lerpResult283 = lerp( ( maintexUV161 + ( noise70 * noise_intensity67 ) ) , flowmap285 , lerpResult99);
				float cos377 = cos( ( _Float39 * PI ) );
				float sin377 = sin( ( _Float39 * PI ) );
				float2 rotator377 = mul( lerpResult283 - float2( 0.5,0.5 ) , float2x2( cos377 , -sin377 , sin377 , cos377 )) + float2( 0.5,0.5 );
				float4 tex2DNode1 = tex2D( _maintex, rotator377 );
				#if defined(_KEYWORD1_A)
				float staticSwitch14 = tex2DNode1.a;
				#elif defined(_KEYWORD1_R)
				float staticSwitch14 = tex2DNode1.r;
				#else
				float staticSwitch14 = tex2DNode1.a;
				#endif
				float lerpResult374 = lerp( staticSwitch14 , ( pow( staticSwitch14 , _Float34 ) * _Float37 ) , _Float36);
				float2 texCoord263 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord264 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord266 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord262 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_KEYWORD7_UP)
				float staticSwitch272 = ( 1.0 - saturate( texCoord263.y ) );
				#elif defined(_KEYWORD7_DOWN)
				float staticSwitch272 = saturate( texCoord264.y );
				#elif defined(_KEYWORD7_LEFT)
				float staticSwitch272 = saturate( texCoord266.x );
				#elif defined(_KEYWORD7_RIGHT)
				float staticSwitch272 = ( 1.0 - saturate( texCoord262.x ) );
				#elif defined(_KEYWORD7_OFF)
				float staticSwitch272 = 1.0;
				#else
				float staticSwitch272 = 1.0;
				#endif
				float dis_direction277 = pow( staticSwitch272 , _Float18 );
				float2 uv_dissolvetex = IN.ase_texcoord1.xy * _dissolvetex_ST.xy + _dissolvetex_ST.zw;
				float2 panner58 = ( 1.0 * _Time.y * _Vector2 + uv_dissolvetex);
				float2 temp_cast_0 = (noise70).xx;
				float2 lerpResult308 = lerp( panner58 , temp_cast_0 , noise_intensity67);
				float4 texCoord303 = IN.ase_texcoord3;
				texCoord303.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult307 = lerp( flowmap_intensity311 , texCoord303.y , flpwmap_custom_switch316);
				float2 lerpResult309 = lerp( lerpResult308 , flowmap285 , lerpResult307);
				float2 lerpResult89 = lerp( panner58 , lerpResult309 , _Float13);
				float2 dissolveUV92 = lerpResult89;
				float cos386 = cos( ( _Float41 * PI ) );
				float sin386 = sin( ( _Float41 * PI ) );
				float2 rotator386 = mul( dissolveUV92 - float2( 0.5,0.5 ) , float2x2( cos386 , -sin386 , sin386 , cos386 )) + float2( 0.5,0.5 );
				float temp_output_280_0 = ( dis_direction277 * tex2D( _dissolvetex, rotator386 ).r );
				float4 texCoord49 = IN.ase_texcoord3;
				texCoord49.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult62 = lerp( _Float6 , texCoord49.x , _Float11);
				float smoothstepResult32 = smoothstep( ( 1.0 - _Float8 ) , _Float8 , saturate( ( ( temp_output_280_0 + 1.0 ) - ( lerpResult62 * 2.0 ) ) ));
				float dis_soft122 = smoothstepResult32;
				float temp_output_130_0 = (0.0 + (temp_output_280_0 - -0.5) * (1.0 - 0.0) / (1.5 - -0.5));
				float temp_output_105_0 = step( lerpResult62 , temp_output_130_0 );
				float dis_bright124 = temp_output_105_0;
				#if defined(_KEYWORD5_OFF)
				float staticSwitch239 = dis_soft122;
				#elif defined(_KEYWORD5_ON)
				float staticSwitch239 = dis_bright124;
				#else
				float staticSwitch239 = dis_soft122;
				#endif
				float4 screenPos97 = IN.ase_texcoord4;
				float4 ase_screenPosNorm97 = screenPos97 / screenPos97.w;
				ase_screenPosNorm97.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm97.z : ase_screenPosNorm97.z * 0.5 + 0.5;
				float screenDepth97 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm97.xy ),_ZBufferParams);
				float distanceDepth97 = saturate( abs( ( screenDepth97 - LinearEyeDepth( ase_screenPosNorm97.z,_ZBufferParams ) ) / ( _Float16 ) ) );
				float depthfade_switch334 = _Float5;
				float lerpResult336 = lerp( distanceDepth97 , ( 1.0 - distanceDepth97 ) , depthfade_switch334);
				float depthfade126 = lerpResult336;
				float lerpResult338 = lerp( depthfade126 , 1.0 , depthfade_switch334);
				float2 uv_Mask = IN.ase_texcoord1.xy * _Mask_ST.xy + _Mask_ST.zw;
				float2 panner79 = ( 1.0 * _Time.y * _Vector3 + uv_Mask);
				float4 texCoord74 = IN.ase_texcoord2;
				texCoord74.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult75 = (float2(texCoord74.z , texCoord74.w));
				float2 lerpResult80 = lerp( panner79 , ( uv_Mask + appendResult75 ) , _Float12);
				float lerpResult325 = lerp( 0.0 , ( noise70 * noise_intensity67 ) , _Float0);
				float cos392 = cos( ( _Float43 * PI ) );
				float sin392 = sin( ( _Float43 * PI ) );
				float2 rotator392 = mul( ( lerpResult80 + lerpResult325 ) - float2( 0.5,0.5 ) , float2x2( cos392 , -sin392 , sin392 , cos392 )) + float2( 0.5,0.5 );
				float4 tex2DNode8 = tex2D( _Mask, rotator392 );
				#if defined(_KEYWORD0_R)
				float staticSwitch11 = tex2DNode8.r;
				#elif defined(_KEYWORD0_A)
				float staticSwitch11 = tex2DNode8.a;
				#else
				float staticSwitch11 = tex2DNode8.a;
				#endif
				float2 uv_Mask1 = IN.ase_texcoord1.xy * _Mask1_ST.xy + _Mask1_ST.zw;
				float2 panner216 = ( 1.0 * _Time.y * _Vector6 + uv_Mask1);
				float cos389 = cos( ( _Float42 * PI ) );
				float sin389 = sin( ( _Float42 * PI ) );
				float2 rotator389 = mul( ( lerpResult325 + panner216 ) - float2( 0.5,0.5 ) , float2x2( cos389 , -sin389 , sin389 , cos389 )) + float2( 0.5,0.5 );
				float4 tex2DNode218 = tex2D( _Mask1, rotator389 );
				#if defined(_KEYWORD2_R)
				float staticSwitch219 = tex2DNode218.r;
				#elif defined(_KEYWORD2_A)
				float staticSwitch219 = tex2DNode218.a;
				#else
				float staticSwitch219 = tex2DNode218.a;
				#endif
				float Mask82 = ( staticSwitch11 * staticSwitch219 );
				float3 ase_worldPos = IN.ase_texcoord5.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizedWorldNormal = normalize( IN.normalWS );
				float fresnelNdotV139 = dot( normalize( ( normalizedWorldNormal * ase_vface ) ), ase_worldViewDir );
				float fresnelNode139 = ( 0.0 + _power3 * pow( max( 1.0 - fresnelNdotV139 , 0.0001 ), _Float19 ) );
				float temp_output_140_0 = saturate( fresnelNode139 );
				float lerpResult144 = lerp( temp_output_140_0 , ( 1.0 - temp_output_140_0 ) , _Float20);
				float fresnel147 = lerpResult144;
				float lerpResult347 = lerp( 1.0 , fresnel147 , _Float33);
				
				surfaceDescription.Alpha = ( lerpResult374 * IN.ase_color.a * _Color0.a * staticSwitch239 * _Float15 * lerpResult338 * Mask82 * lerpResult347 );
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				float3 normalWS = IN.normalWS;
				return half4(NormalizeNormalPerPixel(normalWS), 0.0);

			}
        
			ENDHLSL
        }

		
        Pass
        {
			
            Name "DepthNormalsOnly"
            Tags { "LightMode"="DepthNormalsOnly" }
        
			ZTest LEqual
			ZWrite On
        
        
			HLSLPROGRAM
        
			#pragma multi_compile_instancing
			#define _RECEIVE_SHADOWS_OFF 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1

        
			#pragma exclude_renderers glcore gles gles3 
			#pragma vertex vert
			#pragma fragment frag
        
			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define ATTRIBUTES_NEED_TEXCOORD1
			#define VARYINGS_NEED_NORMAL_WS
			#define VARYINGS_NEED_TANGENT_WS
        
			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY
        
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _KEYWORD1_A _KEYWORD1_R
			#pragma shader_feature_local _KEYWORD5_OFF _KEYWORD5_ON
			#pragma shader_feature_local _KEYWORD7_UP _KEYWORD7_DOWN _KEYWORD7_LEFT _KEYWORD7_RIGHT _KEYWORD7_OFF
			#pragma shader_feature_local _KEYWORD0_R _KEYWORD0_A
			#pragma shader_feature_local _KEYWORD2_R _KEYWORD2_A


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
        
			CBUFFER_START(UnityPerMaterial)
			float4 _Color0;
			float4 _Color1;
			float4 _noise_ST;
			float4 _Gradienttex_ST;
			float4 _maintex_ST;
			float4 _FujiaTex_ST;
			float4 _Mask1_ST;
			float4 _flowmaptex_ST;
			float4 _Color3;
			float4 _reftex_ST;
			float4 _Mask_ST;
			float4 _vertextex_ST;
			float4 _dissolvetex_ST;
			float4 _Color2;
			float3 _Vector5;
			float2 _Vector4;
			float2 _Vector0;
			float2 _speed1;
			float2 _Vector1;
			float2 _Vector7;
			float2 _Vector6;
			float2 _Vector3;
			float2 _Vector2;
			float _Float4;
			float _Float11;
			float _Float6;
			float _Float18;
			float _Float13;
			float _Float23;
			float _Float17;
			float _Float24;
			float _Float34;
			float _Float37;
			float _Float36;
			float _Float8;
			float _Float15;
			float _Float12;
			float _Float0;
			float _Float43;
			float _Float41;
			float _Float33;
			float _Float29;
			float _Float19;
			float _Src;
			float _Float1;
			float _Float2;
			float _Dst;
			float _Float45;
			float _Float22;
			float _Float28;
			float _Float16;
			float _Float5;
			float _Float30;
			float _Float10;
			float _Float44;
			float _Float9;
			float _Float32;
			float _Float31;
			float _Float39;
			float _Float38;
			float _Float46;
			float _Float47;
			float _Float40;
			float _Float35;
			float _Float14;
			float _power3;
			float _Float20;
			float _Float42;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _vertextex;
			sampler2D _maintex;
			sampler2D _noise;
			sampler2D _flowmaptex;
			sampler2D _dissolvetex;
			uniform float4 _CameraDepthTexture_TexelSize1;
			sampler2D _Mask;
			sampler2D _Mask1;


			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};
      
			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_vertextex = v.ase_texcoord.xy * _vertextex_ST.xy + _vertextex_ST.zw;
				float2 panner168 = ( 1.0 * _Time.y * _Vector4 + uv_vertextex);
				float cos398 = cos( ( _Float45 * PI ) );
				float sin398 = sin( ( _Float45 * PI ) );
				float2 rotator398 = mul( panner168 - float2( 0.5,0.5 ) , float2x2( cos398 , -sin398 , sin398 , cos398 )) + float2( 0.5,0.5 );
				float4 texCoord167 = v.ase_texcoord2;
				texCoord167.xy = v.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult176 = lerp( 1.0 , texCoord167.w , _Float22);
				float3 vertexoffset181 = ( tex2Dlod( _vertextex, float4( rotator398, 0, 0.0) ).r * v.ase_normal * _Vector5 * lerpResult176 );
				
				float3 vertexPos97 = v.vertex.xyz;
				float4 ase_clipPos97 = TransformObjectToHClip((vertexPos97).xyz);
				float4 screenPos97 = ComputeScreenPos(ase_clipPos97);
				o.ase_texcoord4 = screenPos97;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				o.ase_texcoord5.xyz = ase_worldPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_texcoord2 = v.ase_texcoord1;
				o.ase_texcoord3 = v.ase_texcoord2;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord5.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = vertexoffset181;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal(v.ase_normal);

				o.clipPos = TransformWorldToHClip(positionWS);
				o.normalWS.xyz =  normalWS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord2 = v.ase_texcoord2;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float2 uv_maintex = IN.ase_texcoord1.xy * _maintex_ST.xy + _maintex_ST.zw;
				float2 panner36 = ( 1.0 * _Time.y * _Vector0 + uv_maintex);
				float4 texCoord39 = IN.ase_texcoord2;
				texCoord39.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult42 = (float2(texCoord39.x , texCoord39.y));
				float2 lerpResult59 = lerp( panner36 , ( uv_maintex + appendResult42 ) , _Float10);
				float2 maintexUV161 = lerpResult59;
				float2 uv_noise = IN.ase_texcoord1.xy * _noise_ST.xy + _noise_ST.zw;
				float2 panner53 = ( 1.0 * _Time.y * _Vector1 + uv_noise);
				float cos395 = cos( ( _Float44 * PI ) );
				float sin395 = sin( ( _Float44 * PI ) );
				float2 rotator395 = mul( panner53 - float2( 0.5,0.5 ) , float2x2( cos395 , -sin395 , sin395 , cos395 )) + float2( 0.5,0.5 );
				float noise70 = tex2D( _noise, rotator395 ).r;
				float noise_intensity67 = ( _Float9 * 0.1 );
				float2 uv_flowmaptex = IN.ase_texcoord1.xy * _flowmaptex_ST.xy + _flowmaptex_ST.zw;
				float4 tex2DNode241 = tex2D( _flowmaptex, uv_flowmaptex );
				float2 appendResult242 = (float2(tex2DNode241.r , tex2DNode241.g));
				float2 flowmap285 = appendResult242;
				float flowmap_intensity311 = _Float32;
				float4 texCoord100 = IN.ase_texcoord3;
				texCoord100.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float flpwmap_custom_switch316 = _Float31;
				float lerpResult99 = lerp( flowmap_intensity311 , texCoord100.y , flpwmap_custom_switch316);
				float2 lerpResult283 = lerp( ( maintexUV161 + ( noise70 * noise_intensity67 ) ) , flowmap285 , lerpResult99);
				float cos377 = cos( ( _Float39 * PI ) );
				float sin377 = sin( ( _Float39 * PI ) );
				float2 rotator377 = mul( lerpResult283 - float2( 0.5,0.5 ) , float2x2( cos377 , -sin377 , sin377 , cos377 )) + float2( 0.5,0.5 );
				float4 tex2DNode1 = tex2D( _maintex, rotator377 );
				#if defined(_KEYWORD1_A)
				float staticSwitch14 = tex2DNode1.a;
				#elif defined(_KEYWORD1_R)
				float staticSwitch14 = tex2DNode1.r;
				#else
				float staticSwitch14 = tex2DNode1.a;
				#endif
				float lerpResult374 = lerp( staticSwitch14 , ( pow( staticSwitch14 , _Float34 ) * _Float37 ) , _Float36);
				float2 texCoord263 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord264 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord266 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord262 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_KEYWORD7_UP)
				float staticSwitch272 = ( 1.0 - saturate( texCoord263.y ) );
				#elif defined(_KEYWORD7_DOWN)
				float staticSwitch272 = saturate( texCoord264.y );
				#elif defined(_KEYWORD7_LEFT)
				float staticSwitch272 = saturate( texCoord266.x );
				#elif defined(_KEYWORD7_RIGHT)
				float staticSwitch272 = ( 1.0 - saturate( texCoord262.x ) );
				#elif defined(_KEYWORD7_OFF)
				float staticSwitch272 = 1.0;
				#else
				float staticSwitch272 = 1.0;
				#endif
				float dis_direction277 = pow( staticSwitch272 , _Float18 );
				float2 uv_dissolvetex = IN.ase_texcoord1.xy * _dissolvetex_ST.xy + _dissolvetex_ST.zw;
				float2 panner58 = ( 1.0 * _Time.y * _Vector2 + uv_dissolvetex);
				float2 temp_cast_0 = (noise70).xx;
				float2 lerpResult308 = lerp( panner58 , temp_cast_0 , noise_intensity67);
				float4 texCoord303 = IN.ase_texcoord3;
				texCoord303.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult307 = lerp( flowmap_intensity311 , texCoord303.y , flpwmap_custom_switch316);
				float2 lerpResult309 = lerp( lerpResult308 , flowmap285 , lerpResult307);
				float2 lerpResult89 = lerp( panner58 , lerpResult309 , _Float13);
				float2 dissolveUV92 = lerpResult89;
				float cos386 = cos( ( _Float41 * PI ) );
				float sin386 = sin( ( _Float41 * PI ) );
				float2 rotator386 = mul( dissolveUV92 - float2( 0.5,0.5 ) , float2x2( cos386 , -sin386 , sin386 , cos386 )) + float2( 0.5,0.5 );
				float temp_output_280_0 = ( dis_direction277 * tex2D( _dissolvetex, rotator386 ).r );
				float4 texCoord49 = IN.ase_texcoord3;
				texCoord49.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult62 = lerp( _Float6 , texCoord49.x , _Float11);
				float smoothstepResult32 = smoothstep( ( 1.0 - _Float8 ) , _Float8 , saturate( ( ( temp_output_280_0 + 1.0 ) - ( lerpResult62 * 2.0 ) ) ));
				float dis_soft122 = smoothstepResult32;
				float temp_output_130_0 = (0.0 + (temp_output_280_0 - -0.5) * (1.0 - 0.0) / (1.5 - -0.5));
				float temp_output_105_0 = step( lerpResult62 , temp_output_130_0 );
				float dis_bright124 = temp_output_105_0;
				#if defined(_KEYWORD5_OFF)
				float staticSwitch239 = dis_soft122;
				#elif defined(_KEYWORD5_ON)
				float staticSwitch239 = dis_bright124;
				#else
				float staticSwitch239 = dis_soft122;
				#endif
				float4 screenPos97 = IN.ase_texcoord4;
				float4 ase_screenPosNorm97 = screenPos97 / screenPos97.w;
				ase_screenPosNorm97.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm97.z : ase_screenPosNorm97.z * 0.5 + 0.5;
				float screenDepth97 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm97.xy ),_ZBufferParams);
				float distanceDepth97 = saturate( abs( ( screenDepth97 - LinearEyeDepth( ase_screenPosNorm97.z,_ZBufferParams ) ) / ( _Float16 ) ) );
				float depthfade_switch334 = _Float5;
				float lerpResult336 = lerp( distanceDepth97 , ( 1.0 - distanceDepth97 ) , depthfade_switch334);
				float depthfade126 = lerpResult336;
				float lerpResult338 = lerp( depthfade126 , 1.0 , depthfade_switch334);
				float2 uv_Mask = IN.ase_texcoord1.xy * _Mask_ST.xy + _Mask_ST.zw;
				float2 panner79 = ( 1.0 * _Time.y * _Vector3 + uv_Mask);
				float4 texCoord74 = IN.ase_texcoord2;
				texCoord74.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult75 = (float2(texCoord74.z , texCoord74.w));
				float2 lerpResult80 = lerp( panner79 , ( uv_Mask + appendResult75 ) , _Float12);
				float lerpResult325 = lerp( 0.0 , ( noise70 * noise_intensity67 ) , _Float0);
				float cos392 = cos( ( _Float43 * PI ) );
				float sin392 = sin( ( _Float43 * PI ) );
				float2 rotator392 = mul( ( lerpResult80 + lerpResult325 ) - float2( 0.5,0.5 ) , float2x2( cos392 , -sin392 , sin392 , cos392 )) + float2( 0.5,0.5 );
				float4 tex2DNode8 = tex2D( _Mask, rotator392 );
				#if defined(_KEYWORD0_R)
				float staticSwitch11 = tex2DNode8.r;
				#elif defined(_KEYWORD0_A)
				float staticSwitch11 = tex2DNode8.a;
				#else
				float staticSwitch11 = tex2DNode8.a;
				#endif
				float2 uv_Mask1 = IN.ase_texcoord1.xy * _Mask1_ST.xy + _Mask1_ST.zw;
				float2 panner216 = ( 1.0 * _Time.y * _Vector6 + uv_Mask1);
				float cos389 = cos( ( _Float42 * PI ) );
				float sin389 = sin( ( _Float42 * PI ) );
				float2 rotator389 = mul( ( lerpResult325 + panner216 ) - float2( 0.5,0.5 ) , float2x2( cos389 , -sin389 , sin389 , cos389 )) + float2( 0.5,0.5 );
				float4 tex2DNode218 = tex2D( _Mask1, rotator389 );
				#if defined(_KEYWORD2_R)
				float staticSwitch219 = tex2DNode218.r;
				#elif defined(_KEYWORD2_A)
				float staticSwitch219 = tex2DNode218.a;
				#else
				float staticSwitch219 = tex2DNode218.a;
				#endif
				float Mask82 = ( staticSwitch11 * staticSwitch219 );
				float3 ase_worldPos = IN.ase_texcoord5.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizedWorldNormal = normalize( IN.normalWS );
				float fresnelNdotV139 = dot( normalize( ( normalizedWorldNormal * ase_vface ) ), ase_worldViewDir );
				float fresnelNode139 = ( 0.0 + _power3 * pow( max( 1.0 - fresnelNdotV139 , 0.0001 ), _Float19 ) );
				float temp_output_140_0 = saturate( fresnelNode139 );
				float lerpResult144 = lerp( temp_output_140_0 , ( 1.0 - temp_output_140_0 ) , _Float20);
				float fresnel147 = lerpResult144;
				float lerpResult347 = lerp( 1.0 , fresnel147 , _Float33);
				
				surfaceDescription.Alpha = ( lerpResult374 * IN.ase_color.a * _Color0.a * staticSwitch239 * _Float15 * lerpResult338 * Mask82 * lerpResult347 );
				surfaceDescription.AlphaClipThreshold = 0.5;
				
				#if _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				float3 normalWS = IN.normalWS;
				return half4(NormalizeNormalPerPixel(normalWS), 0.0);

			}

			ENDHLSL
        }
		
	}
	
	CustomEditor "UnityEditor.ShaderGraphUnlitGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=18935
306.6667;-10;1826.667;1373;9070.893;4593.878;6.559517;True;False
Node;AmplifyShaderEditor.CommentaryNode;259;-5357.104,-2330.234;Inherit;False;1636.939;987.6809;扰动;11;70;50;53;51;52;55;67;360;393;394;395;扰动;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;393;-5111.372,-1984.386;Inherit;False;Property;_Float44;扰动贴图旋转;60;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;52;-5243.104,-1924.289;Inherit;False;Property;_Vector1;扰动速度;62;0;Create;False;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;51;-5307.104,-2148.289;Inherit;False;0;50;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PiNode;394;-4919.05,-1972.53;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;53;-4955.104,-2148.289;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;395;-4688.07,-2075.313;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;312;-5106.146,-2950.022;Inherit;False;1094.708;330.5801;flowmap;7;241;242;285;310;311;305;316;flowmap;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;55;-4862.333,-1806.447;Inherit;False;Property;_Float9;扰动强度;63;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;360;-4657.35,-1768.447;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;305;-4508.5,-2814.648;Inherit;False;Property;_Float31;custom2y控制flowmap扭曲;59;1;[Toggle];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;315;-4641.798,2275.623;Inherit;False;1321.745;1338.922;溶解uv;15;57;56;302;314;58;304;308;307;306;90;309;89;92;303;317;溶解uv;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;50;-4484.2,-2149.009;Inherit;True;Property;_noise;扰动贴图;58;0;Create;False;0;0;0;False;2;Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________);Header(Noise);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;241;-5056.146,-2894.798;Inherit;True;Property;_flowmaptex;flowmaptex;61;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;310;-4514.317,-2707.73;Inherit;False;Property;_Float32;flowmap扰动;64;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;67;-4327.011,-1782.353;Inherit;False;noise_intensity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;242;-4741.872,-2873.442;Inherit;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;316;-4238.615,-2816.66;Inherit;False;flpwmap_custom_switch;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;57;-4591.798,2325.623;Inherit;False;0;23;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;311;-4222.354,-2702.069;Inherit;False;flowmap_intensity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;70;-4099.011,-2017.946;Inherit;False;noise;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;56;-4553.451,2494.174;Inherit;False;Property;_Vector2;溶解流动;50;0;Create;False;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.PannerNode;58;-4197.188,2337.896;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;302;-4348.539,2891.422;Inherit;False;67;noise_intensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;278;-3229.496,771.2501;Inherit;False;2403.086;1048.659;溶解方向;15;262;265;271;263;264;270;266;268;267;269;272;274;277;279;282;溶解方向;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;285;-4455.108,-2900.022;Inherit;False;flowmap;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;303;-4570.194,3312.545;Inherit;True;2;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;317;-4053.379,3308.939;Inherit;False;316;flpwmap_custom_switch;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;304;-4554.514,2792.454;Inherit;False;70;noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;314;-4247.46,3161.452;Inherit;False;311;flowmap_intensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;307;-3839.906,3116.869;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;306;-4098.13,2973.241;Inherit;False;285;flowmap;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;163;-3529.084,-2199.979;Inherit;False;1568.74;739.7102;主贴图uv;9;39;38;35;42;43;60;36;59;161;主贴图uv;1,1,1,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;262;-3153.605,1104.564;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;263;-3136.698,882.8436;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;308;-3982.747,2782.508;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;265;-2689.06,1072.232;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;309;-3775.692,2936.646;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;267;-2680.087,821.2501;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;264;-3132.348,1316.446;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;39;-3462.661,-1762.269;Inherit;True;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;90;-3925.762,2598.177;Inherit;False;Property;_Float13;扰动影响溶解;66;1;[Toggle];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;266;-3179.496,1560.16;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;42;-3096.343,-1739.416;Inherit;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;270;-2668.326,1326.289;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;269;-2168.952,1465.344;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;38;-3443.297,-1997.472;Inherit;False;Property;_Vector0;主贴图流动;28;0;Create;False;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.OneMinusNode;271;-2294.883,833.8645;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;35;-3475.628,-2149.952;Inherit;False;0;1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;103;-3497.564,-1344.041;Inherit;False;1704.885;838.751;软溶解;21;49;29;93;61;23;25;31;62;24;30;26;33;34;45;32;122;280;281;384;385;386;软溶解;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;279;-1954.578,1225.773;Inherit;False;Constant;_Float25;Float 25;52;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;268;-2671.69,1565.909;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;89;-3711.171,2343.505;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;274;-1705.432,1353.576;Inherit;False;Property;_Float18;溶解方向强度;52;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;222;-6035.102,-1279.701;Inherit;False;2384.237;985.5953;mask;30;74;75;80;76;79;216;215;8;77;78;73;218;217;219;11;220;82;319;320;321;323;325;326;322;387;388;389;390;391;392;mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;43;-2709.335,-1902.334;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-2742.667,-1662.09;Inherit;False;Property;_Float10;custom1xy控制主贴图偏移;19;1;[Toggle];Create;False;0;0;0;True;2;Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________);Header(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;272;-1723.76,973.114;Inherit;False;Property;_Keyword7;溶解方向;51;0;Create;False;0;0;0;False;0;False;0;4;4;True;;KeywordEnum;5;up;down;left;right;off;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;36;-2580.977,-2096.186;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;92;-3544.052,2342.612;Inherit;False;dissolveUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;384;-3482.165,-1103.679;Inherit;False;Property;_Float41;溶解贴图旋转;49;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;59;-2367.156,-1887.983;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode;282;-1296.819,1064.88;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;93;-3490.295,-1255.449;Inherit;False;92;dissolveUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;385;-3333.906,-1104.307;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;74;-5964.198,-916.9839;Inherit;True;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;72;-1622.31,-2147.904;Inherit;False;67;noise_intensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;71;-1620.138,-2246.357;Inherit;False;70;noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;78;-5908.361,-1053.048;Inherit;False;Property;_Vector3;遮罩01流动;42;0;Create;False;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RegisterLocalVarNode;277;-1050.409,1159.944;Inherit;False;dis_direction;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;323;-5441.909,-720.9814;Inherit;False;67;noise_intensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;75;-5650.359,-900.2957;Inherit;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;77;-6012.413,-1237.33;Inherit;False;0;8;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;146;-3141.72,3013.755;Inherit;False;1475.065;723.4756;菲尼尔;11;135;137;138;139;140;141;142;144;147;136;352;菲尼尔;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;321;-5414.299,-801.5012;Inherit;False;70;noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;161;-2184.836,-1824.237;Inherit;False;maintexUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;386;-3135.395,-1194.231;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;322;-5163.32,-794.8383;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;79;-5317.127,-1193.981;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FaceVariableNode;352;-3012.43,3187.22;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-3514.295,-1005.209;Inherit;False;Property;_Float6;溶解;53;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;318;-1311.717,-1771.174;Inherit;False;316;flpwmap_custom_switch;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;100;-1592.991,-1830.176;Inherit;False;2;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;313;-1348.078,-1909.204;Inherit;False;311;flowmap_intensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;353;-1354.73,-2217.515;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;23;-2941.885,-1155.051;Inherit;True;Property;_dissolvetex;溶解贴图;47;0;Create;False;0;0;0;False;2;Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________);Header(dissolove);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;281;-3126.44,-1311.651;Inherit;False;277;dis_direction;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;76;-5281.01,-1048.949;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldNormalVector;136;-3118.165,3057.115;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TextureCoordinatesNode;49;-3447.564,-807.2889;Inherit;True;2;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;326;-5275.3,-655.787;Inherit;False;Property;_Float0;扰动影响mask;65;1;[Toggle];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;162;-1624.481,-2370.605;Inherit;False;161;maintexUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-3208.92,-636.406;Inherit;False;Property;_Float11;custom2x控制溶解;48;1;[Toggle];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;215;-5900.545,-440.6154;Inherit;False;Property;_Vector6;遮罩02流动;46;0;Create;False;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;73;-5284.498,-881.4714;Inherit;False;Property;_Float12;custom1zw控制mask01偏移;39;1;[Toggle];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;217;-5917.62,-601.73;Inherit;False;0;218;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;31;-2409.969,-820.4878;Inherit;False;Constant;_Float7;Float 7;11;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;99;-1049.579,-1892.656;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;284;-1199.801,-1992.284;Inherit;False;285;flowmap;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;351;-2795.43,3144.22;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;354;-1183.78,-2283.116;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;62;-3112.455,-841.386;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-2748.355,-842.9209;Inherit;False;Constant;_Float3;Float 3;11;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;80;-5011.625,-1129.087;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;216;-5220.491,-582.2068;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;138;-3076.711,3573.226;Inherit;False;Property;_Float19;菲尼尔范围;16;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;135;-3045.824,3462.564;Inherit;False;Property;_power3;菲尼尔强度;15;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;166;-5187.872,-62.2597;Inherit;False;1013.145;364.3818; 软粒子;9;126;97;98;96;327;333;334;336;337; 软粒子;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;280;-2719.747,-1296.348;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;390;-4964.858,-1235.579;Inherit;False;Property;_Float43;遮罩01旋转;40;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;380;-1308.535,-2438.455;Inherit;False;Property;_Float39;主贴图旋转;20;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;387;-5112.771,-452.4007;Inherit;False;Property;_Float42;遮罩02旋转;44;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;325;-5012.3,-818.787;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;137;-3052.719,3270.273;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PiNode;378;-1147.213,-2438.599;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;98;-5137.872,-12.25966;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;180;-5325.397,532.1029;Inherit;False;1665.282;998.5445;顶点偏移;15;168;169;174;173;175;171;172;176;179;178;167;181;398;396;397;顶点偏移;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;24;-2534.248,-1196.414;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;283;-943.9205,-2169.898;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;333;-4988.276,217.7946;Inherit;False;Property;_Float5;反向软粒子(强化边缘）;11;1;[Toggle];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;388;-4910.449,-466.5448;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;319;-4800.81,-1053.726;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FresnelNode;139;-2742.485,3325.885;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;96;-5153.254,150.1221;Inherit;False;Property;_Float16;软粒子（羽化边缘）;10;0;Create;False;0;0;0;False;1;Header(depthfade);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;320;-4839.203,-776.843;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-2438.252,-1029.233;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;391;-4787.188,-1225.071;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;377;-925.2325,-2478.382;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;334;-4771.959,204.0856;Inherit;False;depthfade_switch;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;97;-4906.419,-12.83418;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;174;-5200.287,775.6785;Inherit;False;Property;_Vector4;顶点偏移速度;71;0;Create;False;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleSubtractOpNode;26;-2402.387,-1171.976;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;140;-2505.02,3326.082;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;173;-5275.397,582.103;Inherit;False;0;169;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RotatorNode;389;-4652.469,-521.3277;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;396;-5188.168,1039.419;Inherit;False;Property;_Float45;顶点贴图旋转;69;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-2410.078,-753.675;Inherit;False;Property;_Float8;软硬;54;0;Create;False;0;0;0;False;0;False;0.5;0.5;0.5;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;114;-3534.336,-348.9304;Inherit;False;1936.036;770.2162; 亮边溶解;8;107;109;105;106;108;124;130;133;亮边溶解;1,1,1,1;0;0
Node;AmplifyShaderEditor.RotatorNode;392;-4550.068,-1258.994;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1;-671.7001,-2230.574;Inherit;True;Property;_maintex;主贴图;18;0;Create;False;0;0;0;False;2;Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________);Header(Main);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;34;-2268.365,-1062.25;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;141;-2409.202,3428.264;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;218;-4429.35,-597.144;Inherit;True;Property;_Mask1;遮罩02;43;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;142;-2560.026,3560.687;Inherit;False;Property;_Float20;反向菲尼尔（虚化边缘）;17;1;[Toggle];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;45;-2180.262,-1199.743;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;130;-2928.531,-202.3795;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-0.5;False;2;FLOAT;1.5;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;397;-4788.926,1368.624;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;337;-4544.628,181.5275;Inherit;False;334;depthfade_switch;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;327;-4684.74,69.05119;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;8;-4416.859,-1075.701;Inherit;True;Property;_Mask;遮罩01;38;0;Create;False;0;0;0;False;2;Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________);Header(Mask);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;168;-5007.591,684.1565;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;14;-244.674,-1956.377;Inherit;False;Property;_Keyword1;主贴图通道;21;0;Create;False;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;A;R;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;398;-4795.865,916.4915;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;11;-4017.359,-1084.189;Inherit;False;Property;_Keyword0;遮罩01通道;41;0;Create;False;0;0;0;False;0;False;0;1;1;True;;KeywordEnum;2;R;A;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;32;-2064.223,-1147.086;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;365;-454.8054,-1830.794;Inherit;False;Property;_Float34;主贴图细节对比度;22;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;167;-4569.402,1149.538;Inherit;True;2;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;178;-4309.021,1068.144;Inherit;False;Constant;_Float21;Float 21;37;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;179;-4505.635,1422.648;Inherit;False;Property;_Float22;custom2w控制顶点偏移强度;68;1;[Toggle];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;144;-2176.633,3335.982;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;336;-4528.151,-12.14388;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;105;-2447.35,-278.2395;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;219;-4063.549,-562.1036;Inherit;False;Property;_Keyword2;遮罩02通道;45;0;Create;False;0;0;0;False;0;False;0;1;1;True;;KeywordEnum;2;R;A;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;172;-4344.198,769.7045;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;175;-4421.282,922.3486;Inherit;False;Property;_Vector5;顶点偏移强度;70;0;Create;False;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PowerNode;372;-61.45117,-1782.779;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;126;-4366.524,-10.40218;Inherit;False;depthfade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;169;-4666.782,642.2286;Inherit;True;Property;_vertextex;顶点偏移贴图;67;0;Create;False;0;0;0;False;2;Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________);Header(Vertex_offset);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;220;-4103.923,-813.4775;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;147;-1878.385,3301.25;Inherit;False;fresnel;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;370;-452.3302,-1733.819;Inherit;False;Property;_Float37;主贴图细节提亮;23;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;124;-2107.195,-289.4281;Inherit;False;dis_bright;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;122;-1970.244,-899.0286;Inherit;False;dis_soft;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;176;-4040.265,1018.409;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;340;147.6157,157.3226;Inherit;False;334;depthfade_switch;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;82;-3901.864,-813.6307;Inherit;False;Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;128;157.3221,51.57904;Inherit;False;126;depthfade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;123;-590.8659,-203.0265;Inherit;False;122;dis_soft;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;367;-476.1465,-1624.499;Inherit;False;Property;_Float36;细节平滑过渡;24;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;350;-61.1196,-339.5812;Inherit;False;Property;_Float33;菲尼尔开关;14;1;[Toggle];Create;False;0;0;0;False;1;Header(Fresnel);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;125;-584.3593,-119.436;Inherit;False;124;dis_bright;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;171;-4047.889,670.6615;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;150;-96.71649,-486.6401;Inherit;False;147;fresnel;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;209;-102.5648,-563.2598;Inherit;False;Constant;_Float27;Float 27;43;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;373;119.3011,-1750.806;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;239;-321.2267,-210.135;Inherit;False;Property;_Keyword5;亮边溶解;55;0;Create;False;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;off;on;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;338;543.0873,82.17676;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;197;-3135.871,1911.744;Inherit;False;1797.446;957.2153;折射;15;188;186;187;190;183;185;191;193;192;194;195;196;202;201;203;折射;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;374;440.1891,-1744.643;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;236;-3523.134,-2654.724;Inherit;False;1214.206;357.624;Gradient;4;224;229;226;231;Gradienttex;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;221;592.5698,217.0276;Inherit;False;82;Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;462;-5296.483,-3687.005;Inherit;False;1743;623;fujiatex;13;443;444;447;442;437;446;438;449;450;448;439;453;454;附加图;1,1,1,1;0;0
Node;AmplifyShaderEditor.VertexColorNode;3;-929.5941,-1231.052;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;4;-1023.776,-772.6129;Inherit;False;Property;_Color0;颜色;5;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;181;-3875.224,686.1115;Inherit;False;vertexoffset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;347;242.4988,-554.7366;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;95;-155.7354,-55.72403;Inherit;False;Property;_Float15;alpha强度;9;0;Create;False;0;0;0;False;0;False;1;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;109;-3095.645,133.4256;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;183;-1754.151,2067.014;Inherit;False;Global;_GrabScreen0;Grab Screen 0;1;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;453;-4170.483,-3391.005;Inherit;False;Property;_Keyword4;附加图通道;35;0;Create;False;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;R;A;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GrabScreenPosition;202;-2212.468,1969.472;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;194;-3068.68,2489.68;Inherit;True;2;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;191;-2263.457,2462.681;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;212;-582.4836,-1530.928;Inherit;True;Property;_Gradienttex;混合颜色贴图;25;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;108;-2180.274,-88.0987;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;132;473.6913,-1104.722;Inherit;False;Property;_Color1;亮边颜色;57;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;213;-517.2658,-1316.839;Inherit;False;Property;_Float29;颜色混合;27;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;196;-1558.426,2073.591;Inherit;False;ref;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;434;2183.022,-1102.922;Inherit;False;Property;_Src;Src;3;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;456;50.95508,-2275.108;Inherit;False;Property;_Keyword6;是否开启附加图;30;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;186;-3085.871,1998.77;Inherit;False;0;190;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;234;-1392.855,-1344.522;Inherit;False;231;Gradienttex;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;383;-840.2119,-1602.472;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;432;2178.022,-1267.922;Inherit;False;Property;_Float1;双面;0;1;[Enum];Create;False;0;1;kaiqi;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;381;-1300.515,-1533.545;Inherit;False;Property;_Float40;颜色混合贴图旋转;26;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;237;1534.187,-1056.438;Inherit;False;Property;_Keyword3;折射（热扭曲）开关;74;0;Create;False;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;off;on;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;211;434.5716,-2194.117;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;460;-274.0449,-2458.108;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;459;-214.0449,-2642.108;Inherit;False;Property;_Keyword8;附加图模式;31;0;Create;False;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;ADD;Alpha;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;457;-533.0449,-2686.108;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;440;-838.5841,-2810.943;Inherit;False;439;fujiaTex;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;447;-5021.483,-3404.005;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;439;-3781.483,-3535.005;Inherit;False;fujiaTex;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;448;-5027.483,-3197.005;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;450;-4463.483,-3637.005;Inherit;False;Property;_Color2;附加图颜色;33;1;[HDR];Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;449;-4829.483,-3268.005;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;438;-5159.483,-3614.005;Inherit;False;0;437;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;446;-5246.483,-3322.005;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;437;-4477.483,-3418.005;Inherit;True;Property;_FujiaTex;附加贴图;34;0;Create;False;0;0;0;False;0;False;-1;1495d2f3a3cded2468b867220859f4eb;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScaleAndOffsetNode;442;-4734.483,-3496.005;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;94;13.3175,-832.5779;Inherit;False;Property;_Float14;整体颜色强度;6;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;195;-2854.264,2754.401;Inherit;False;Property;_Float24;custom2z控制折射（热扭曲）;73;1;[Toggle];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;454;-3953.483,-3523.005;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;231;-2658.637,-2562.118;Inherit;False;Gradienttex;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;343;425.2014,-2745.807;Inherit;False;Property;_Float28;边缘强度;12;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;436;2396.022,-1248.922;Inherit;False;Property;_Float4;渲染顺序;2;1;[Enum];Create;False;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;131;764.0637,-1221.447;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;106;-3505.17,138.5015;Inherit;False;Property;_Float17;亮边宽度;56;0;Create;False;0;0;0;False;0;False;0;0;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;185;-1897.62,2071.844;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;133;-1880.867,-169.121;Inherit;False;dis_edge;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;433;2181.022,-1183.922;Inherit;False;Property;_Float2;深度写入;1;1;[Toggle];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;203;-2040.38,2283.387;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;107;-2649.787,9.893482;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;232;-1381.513,-1209.213;Inherit;False;70;noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;192;-2800.274,2423.947;Inherit;False;Property;_Float23;折射（热扭曲）强度;76;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;233;-1410.079,-1091.063;Inherit;False;67;noise_intensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;358;-931.8485,-352.5294;Inherit;False;Property;_Float35;启用第二面颜色;7;1;[Toggle];Create;False;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;357;-1014.146,-573.8961;Inherit;False;Property;_Color3;颜色2;8;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;1642.675,-735.1955;Inherit;False;8;8;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;229;-3055.932,-2529.487;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;443;-5213.866,-3417.387;Inherit;False;Property;_Float38;附加图速度U;36;0;Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;435;2195.022,-1021.922;Inherit;False;Property;_Dst;Dst;4;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;345;529.6104,-2518.01;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;182;1837.156,-318.5735;Inherit;False;181;vertexoffset;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;226;-3473.134,-2604.724;Inherit;False;0;212;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;329;976.7951,-1987.192;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector2Node;224;-3464.554,-2461.1;Inherit;False;Property;_Vector7;混合图流动;29;0;Create;False;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;187;-3069.63,2184.771;Inherit;False;Property;_speed1;折射（热扭曲）流动;75;0;Create;False;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;341;753.037,-2623.884;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;188;-2685.971,2032.571;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SwitchByFaceNode;356;-394.2628,-871.1414;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;199;1151.744,-1008.331;Inherit;False;196;ref;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.PiNode;382;-1098.192,-1547.689;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;450.0233,-1287.041;Inherit;False;5;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;190;-2396.215,2162.022;Inherit;True;Property;_reftex; 折射（热扭曲）贴图;72;0;Create;False;0;0;0;False;2;Header(___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________);Header(Ref);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;359;-467.3316,-579.4472;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;461;-636.0449,-2429.108;Inherit;False;Property;_Float47;融合度;32;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;332;43.95041,-2648.343;Inherit;False;126;depthfade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;201;-2543.121,2352.396;Inherit;False;Constant;_Float26;Float 26;43;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;193;-2515.579,2480.279;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;330;308.1682,-2605.84;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;444;-5242.483,-3231.005;Inherit;False;Property;_Float46;附加图速度V;37;0;Create;False;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;134;537.8172,-845.9244;Inherit;False;133;dis_edge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;235;-1033.183,-1394.69;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;335;38.88324,-2551.179;Inherit;False;334;depthfade_switch;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;346;309.5167,-2448.761;Inherit;False;Property;_Float30;边缘收窄;13;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;423;2326.042,-895.3063;Float;False;True;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;3;VFX/URPShader;2992e84f91cbeb14eab234972e07ea9d;True;Forward;0;1;Forward;8;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;0;True;432;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;5;False;434;10;False;435;1;1;False;-1;10;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;2;False;433;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForwardOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;22;Surface;1;638368227774068417;  Blend;0;0;Two Sided;1;0;Cast Shadows;0;638368227832706595;  Use Shadow Threshold;0;0;Receive Shadows;0;638368227840023258;GPU Instancing;1;0;LOD CrossFade;0;0;Built-in Fog;0;0;DOTS Instancing;0;0;Meta Pass;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,-1;0;  Type;0;0;  Tess;16,False,-1;0;  Min;10,False,-1;0;  Max;25,False,-1;0;  Edge Length;16,False,-1;0;  Max Displacement;25,False,-1;0;Vertex Position,InvertActionOnDeselection;1;0;0;10;False;True;False;True;False;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;425;2326.042,-895.3063;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;428;2326.042,-895.3063;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;True;4;d3d11;glcore;gles;gles3;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;427;2326.042,-895.3063;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;5;False;434;10;False;435;1;1;False;-1;10;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;2;False;433;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;424;2326.042,-895.3063;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;426;2326.042,-895.3063;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;431;2326.042,-895.3063;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormalsOnly;0;9;DepthNormalsOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormalsOnly;False;True;15;d3d9;d3d11_9x;d3d11;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;429;2326.042,-895.3063;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;True;4;d3d11;glcore;gles;gles3;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;430;2326.042,-895.3063;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormals;0;8;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormalsOnly;False;True;4;d3d11;glcore;gles;gles3;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;422;2326.042,-895.3063;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;394;0;393;0
WireConnection;53;0;51;0
WireConnection;53;2;52;0
WireConnection;395;0;53;0
WireConnection;395;2;394;0
WireConnection;360;0;55;0
WireConnection;50;1;395;0
WireConnection;67;0;360;0
WireConnection;242;0;241;1
WireConnection;242;1;241;2
WireConnection;316;0;305;0
WireConnection;311;0;310;0
WireConnection;70;0;50;1
WireConnection;58;0;57;0
WireConnection;58;2;56;0
WireConnection;285;0;242;0
WireConnection;307;0;314;0
WireConnection;307;1;303;2
WireConnection;307;2;317;0
WireConnection;308;0;58;0
WireConnection;308;1;304;0
WireConnection;308;2;302;0
WireConnection;265;0;262;1
WireConnection;309;0;308;0
WireConnection;309;1;306;0
WireConnection;309;2;307;0
WireConnection;267;0;263;2
WireConnection;42;0;39;1
WireConnection;42;1;39;2
WireConnection;270;0;264;2
WireConnection;269;0;265;0
WireConnection;271;0;267;0
WireConnection;268;0;266;1
WireConnection;89;0;58;0
WireConnection;89;1;309;0
WireConnection;89;2;90;0
WireConnection;43;0;35;0
WireConnection;43;1;42;0
WireConnection;272;1;271;0
WireConnection;272;0;270;0
WireConnection;272;2;268;0
WireConnection;272;3;269;0
WireConnection;272;4;279;0
WireConnection;36;0;35;0
WireConnection;36;2;38;0
WireConnection;92;0;89;0
WireConnection;59;0;36;0
WireConnection;59;1;43;0
WireConnection;59;2;60;0
WireConnection;282;0;272;0
WireConnection;282;1;274;0
WireConnection;385;0;384;0
WireConnection;277;0;282;0
WireConnection;75;0;74;3
WireConnection;75;1;74;4
WireConnection;161;0;59;0
WireConnection;386;0;93;0
WireConnection;386;2;385;0
WireConnection;322;0;321;0
WireConnection;322;1;323;0
WireConnection;79;0;77;0
WireConnection;79;2;78;0
WireConnection;353;0;71;0
WireConnection;353;1;72;0
WireConnection;23;1;386;0
WireConnection;76;0;77;0
WireConnection;76;1;75;0
WireConnection;99;0;313;0
WireConnection;99;1;100;2
WireConnection;99;2;318;0
WireConnection;351;0;136;0
WireConnection;351;1;352;0
WireConnection;354;0;162;0
WireConnection;354;1;353;0
WireConnection;62;0;29;0
WireConnection;62;1;49;1
WireConnection;62;2;61;0
WireConnection;80;0;79;0
WireConnection;80;1;76;0
WireConnection;80;2;73;0
WireConnection;216;0;217;0
WireConnection;216;2;215;0
WireConnection;280;0;281;0
WireConnection;280;1;23;1
WireConnection;325;1;322;0
WireConnection;325;2;326;0
WireConnection;378;0;380;0
WireConnection;24;0;280;0
WireConnection;24;1;25;0
WireConnection;283;0;354;0
WireConnection;283;1;284;0
WireConnection;283;2;99;0
WireConnection;388;0;387;0
WireConnection;319;0;80;0
WireConnection;319;1;325;0
WireConnection;139;0;351;0
WireConnection;139;4;137;0
WireConnection;139;2;135;0
WireConnection;139;3;138;0
WireConnection;320;0;325;0
WireConnection;320;1;216;0
WireConnection;30;0;62;0
WireConnection;30;1;31;0
WireConnection;391;0;390;0
WireConnection;377;0;283;0
WireConnection;377;2;378;0
WireConnection;334;0;333;0
WireConnection;97;1;98;0
WireConnection;97;0;96;0
WireConnection;26;0;24;0
WireConnection;26;1;30;0
WireConnection;140;0;139;0
WireConnection;389;0;320;0
WireConnection;389;2;388;0
WireConnection;392;0;319;0
WireConnection;392;2;391;0
WireConnection;1;1;377;0
WireConnection;34;0;33;0
WireConnection;141;0;140;0
WireConnection;218;1;389;0
WireConnection;45;0;26;0
WireConnection;130;0;280;0
WireConnection;397;0;396;0
WireConnection;327;0;97;0
WireConnection;8;1;392;0
WireConnection;168;0;173;0
WireConnection;168;2;174;0
WireConnection;14;1;1;4
WireConnection;14;0;1;1
WireConnection;398;0;168;0
WireConnection;398;2;397;0
WireConnection;11;1;8;1
WireConnection;11;0;8;4
WireConnection;32;0;45;0
WireConnection;32;1;34;0
WireConnection;32;2;33;0
WireConnection;144;0;140;0
WireConnection;144;1;141;0
WireConnection;144;2;142;0
WireConnection;336;0;97;0
WireConnection;336;1;327;0
WireConnection;336;2;337;0
WireConnection;105;0;62;0
WireConnection;105;1;130;0
WireConnection;219;1;218;1
WireConnection;219;0;218;4
WireConnection;372;0;14;0
WireConnection;372;1;365;0
WireConnection;126;0;336;0
WireConnection;169;1;398;0
WireConnection;220;0;11;0
WireConnection;220;1;219;0
WireConnection;147;0;144;0
WireConnection;124;0;105;0
WireConnection;122;0;32;0
WireConnection;176;0;178;0
WireConnection;176;1;167;4
WireConnection;176;2;179;0
WireConnection;82;0;220;0
WireConnection;171;0;169;1
WireConnection;171;1;172;0
WireConnection;171;2;175;0
WireConnection;171;3;176;0
WireConnection;373;0;372;0
WireConnection;373;1;370;0
WireConnection;239;1;123;0
WireConnection;239;0;125;0
WireConnection;338;0;128;0
WireConnection;338;2;340;0
WireConnection;374;0;14;0
WireConnection;374;1;373;0
WireConnection;374;2;367;0
WireConnection;181;0;171;0
WireConnection;347;0;209;0
WireConnection;347;1;150;0
WireConnection;347;2;350;0
WireConnection;109;0;62;0
WireConnection;109;1;106;0
WireConnection;183;0;185;0
WireConnection;453;1;437;1
WireConnection;453;0;437;4
WireConnection;191;0;201;0
WireConnection;191;1;193;0
WireConnection;212;1;383;0
WireConnection;108;0;105;0
WireConnection;108;1;107;0
WireConnection;196;0;183;0
WireConnection;456;1;1;0
WireConnection;456;0;459;0
WireConnection;383;0;235;0
WireConnection;383;2;382;0
WireConnection;237;1;131;0
WireConnection;237;0;199;0
WireConnection;211;0;456;0
WireConnection;211;1;212;0
WireConnection;211;2;213;0
WireConnection;460;0;457;0
WireConnection;460;1;1;0
WireConnection;460;2;461;0
WireConnection;459;1;457;0
WireConnection;459;0;460;0
WireConnection;457;0;440;0
WireConnection;457;1;1;0
WireConnection;447;0;443;0
WireConnection;447;1;446;0
WireConnection;439;0;454;0
WireConnection;448;0;446;0
WireConnection;448;1;444;0
WireConnection;449;0;447;0
WireConnection;449;1;448;0
WireConnection;437;1;442;0
WireConnection;442;0;438;0
WireConnection;442;2;449;0
WireConnection;454;0;450;0
WireConnection;454;1;453;0
WireConnection;231;0;229;0
WireConnection;131;0;5;0
WireConnection;131;1;132;0
WireConnection;131;2;134;0
WireConnection;185;0;202;0
WireConnection;185;1;203;0
WireConnection;133;0;108;0
WireConnection;203;0;190;1
WireConnection;203;1;191;0
WireConnection;107;0;109;0
WireConnection;107;1;130;0
WireConnection;6;0;374;0
WireConnection;6;1;3;4
WireConnection;6;2;4;4
WireConnection;6;3;239;0
WireConnection;6;4;95;0
WireConnection;6;5;338;0
WireConnection;6;6;221;0
WireConnection;6;7;347;0
WireConnection;229;0;226;0
WireConnection;229;2;224;0
WireConnection;345;0;330;0
WireConnection;345;1;346;0
WireConnection;329;0;341;0
WireConnection;329;1;211;0
WireConnection;341;0;343;0
WireConnection;341;1;345;0
WireConnection;188;0;186;0
WireConnection;188;2;187;0
WireConnection;356;0;4;0
WireConnection;356;1;359;0
WireConnection;382;0;381;0
WireConnection;5;0;329;0
WireConnection;5;1;3;0
WireConnection;5;2;356;0
WireConnection;5;3;94;0
WireConnection;5;4;347;0
WireConnection;190;1;188;0
WireConnection;359;0;4;0
WireConnection;359;1;357;0
WireConnection;359;2;358;0
WireConnection;193;0;192;0
WireConnection;193;1;194;3
WireConnection;193;2;195;0
WireConnection;330;1;332;0
WireConnection;330;2;335;0
WireConnection;235;0;234;0
WireConnection;235;1;232;0
WireConnection;235;2;233;0
WireConnection;423;2;237;0
WireConnection;423;3;6;0
WireConnection;423;5;182;0
ASEEND*/
//CHKSM=A94E4E6375CAA7FE86D0DBB2DDC8E7E21242DA3B