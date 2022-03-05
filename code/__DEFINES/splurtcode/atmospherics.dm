// Gas defines here because somebody hates typepaths
#define GAS_COPIUM "copium"

#undef PIPING_LAYER_MAX
#define PIPING_LAYER_MAX 5
#undef PIPING_LAYER_DEFAULT
#define PIPING_LAYER_DEFAULT 3

#undef PIPING_LAYER_DOUBLE_SHIFT
#define PIPING_LAYER_DOUBLE_SHIFT(T, PipingLayer) \
	T.pixel_x = (PipingLayer - PIPING_LAYER_DEFAULT) * 10;\
	T.pixel_y = (PipingLayer - PIPING_LAYER_DEFAULT) * 10;
