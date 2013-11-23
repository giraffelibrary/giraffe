structure GtkActionEntry :> GTK_ACTION_ENTRY =
  struct
    type t =
      {
	name : string,
	stockId : string option,
	label : string option,
	accelerator : string option,
	tooltip : string option,
	callback : (unit -> unit) option
      }
  end
