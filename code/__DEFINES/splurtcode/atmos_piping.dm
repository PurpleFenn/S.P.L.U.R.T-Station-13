// Stuff you should probably leave well alone? Fuck that lol.

// Defines for pipe bitmasking
#define NORTH_FULLPIPE	(1<<0)	// Also just NORTH
#define SOUTH_FULLPIPE	(1<<1)	// Also just SOUTH
#define EAST_FULLPIPE	(1<<2)	// Also just EAST
#define WEST_FULLPIPE	(1<<3)	// Also just WEST
#define NORTH_SHORTPIPE	(1<<4)
#define	SOUTH_SHORTPIPE	(1<<5)
#define EAST_SHORTPIPE	(1<<6)
#define WEST_SHORTPIPE	(1<<7)

// Helpers to convert cardinals to and from pipe bitfields
#define FULLPIPE_TO_CARDINALS(bitfield)		((bitfield) & ALL_CARDINALS)
#define SHORTPIPE_TO_CARDINALS(bitfield)	(((bitfield) >> 4) & ALL_CARDINALS)
#define CARDINAL_TO_FULLPIPES(cardinals)	(cardinals)
#define CARDINAL_TO_SHORTPIPES(cardinals)	((cardinals) << 4)

// A pipe is a stub if it only has zero or one permitted direction
#define ISSTUB(bits)	!((bits) & (bits - 1))
#define ISNOTSTUB(bits)	((bits) & (bits - 1))
