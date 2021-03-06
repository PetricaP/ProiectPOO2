cbuffer u_Model {
	float4x4 model;
	float4x4 view;
	float4x4 projection;
};

struct Input {
	float2 position : POSITION;
	float2 texCoord : TEXCOORD0;
};

struct Output {
	float4 position : SV_POSITION;
	float2 texCoord : TEXCOORD0;
	float2 fake_pos : TEXCOORD1;
};

Output main(Input input) {
	Output output;

	output.position = mul(mul(mul(float4(input.position.x, input.position.y, 0, 1), model), view), projection);
	output.texCoord = input.texCoord;
	output.fake_pos = float2(output.position.x, output.position.y);

	return output;
}