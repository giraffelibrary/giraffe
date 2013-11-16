signature GTK_ACTION_ENTRY =
  sig
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
