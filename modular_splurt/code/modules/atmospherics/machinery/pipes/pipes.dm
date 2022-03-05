/obj/machinery/atmospherics/pipe/proc/update_pipe_icon()
	icon = 'modular_splurt/icons/obj/atmospherics/pipes/pipes_bitmask.dmi'
	var/connections = NONE
	var/bitfield = NONE
	for(var/i in 1 to device_type)
		if(!nodes[i])
			continue
		var/obj/machinery/atmospherics/node = nodes[i]
		var/connected_dir = get_dir(src, node)
		connections |= connected_dir
	bitfield = CARDINAL_TO_FULLPIPES(connections)
	bitfield |= CARDINAL_TO_SHORTPIPES(initialize_directions & ~connections)
	icon_state = "[bitfield]_[piping_layer]"

/obj/machinery/atmospherics/pipe/update_icon()
	. = ..()
	update_pipe_icon()
	update_layer()

/obj/machinery/atmospherics/pipe/update_node_icon()
	for(var/i in 1 to device_type)
		if(!nodes[i])
			continue
		var/obj/machinery/atmospherics/current_node = nodes[i]
		current_node.update_icon()
