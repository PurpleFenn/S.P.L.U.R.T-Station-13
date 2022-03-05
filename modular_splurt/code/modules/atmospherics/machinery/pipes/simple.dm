/obj/machinery/atmospherics/pipe/simple
	var/connections

/obj/machinery/atmospherics/pipe/simple/update_pipe_icon()
	icon = 'modular_splurt/icons/obj/atmospherics/pipes/pipes_bitmask.dmi'
	connections = NONE

	for(var/i in 1 to device_type)
		if(!nodes[i])
			continue
		var/obj/machinery/atmospherics/node = nodes[i]
		var/connected_dir = get_dir(src, node)
		connections |= connected_dir
	var/bitfield = CARDINAL_TO_FULLPIPES(connections)
	dir = check_binary_direction(connections)

	if(ISSTUB(connections))
		var/bits_to_add = NONE
		if (connections != NONE)
			bits_to_add |= REVERSE_DIR(connections) & initialize_directions
		var/candidates = initialize_directions
		var/shift = 0
		// Candidates should never reach 0 as stub pipes are not allowed and break things
		while (ISSTUB(connections | bits_to_add) && (candidates >> shift) != 0)
			bits_to_add |= candidates & (1 << shift)
			shift += 1
		bitfield |= CARDINAL_TO_SHORTPIPES(bits_to_add)

	icon_state = "[bitfield]_[piping_layer]"

/obj/machinery/atmospherics/pipe/simple/update_icon()
	. = ..()
	update_alpha()
	update_pipe_icon()

/obj/machinery/atmospherics/pipe/simple/proc/check_binary_direction(direction)
	switch(direction)
		if(EAST|WEST)
			return WEST
		if(SOUTH|NORTH)
			return SOUTH
		else
			return direction
