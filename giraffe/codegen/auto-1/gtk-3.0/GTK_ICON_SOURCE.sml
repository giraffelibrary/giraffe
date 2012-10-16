signature GTK_ICON_SOURCE =
  sig
    type record_t
    type statetype_t
    type textdirection_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val copy : record_t -> record_t
    val getDirection : record_t -> textdirection_t
    val getDirectionWildcarded : record_t -> bool
    val getFilename : record_t -> string
    val getIconName : record_t -> string
    val getPixbuf : record_t -> base GdkPixbuf.PixbufClass.t
    val getSize : record_t -> LargeInt.int
    val getSizeWildcarded : record_t -> bool
    val getState : record_t -> statetype_t
    val getStateWildcarded : record_t -> bool
    val setDirection :
      record_t
       -> textdirection_t
       -> unit
    val setDirectionWildcarded :
      record_t
       -> bool
       -> unit
    val setFilename :
      record_t
       -> string
       -> unit
    val setIconName :
      record_t
       -> string option
       -> unit
    val setPixbuf :
      record_t
       -> 'a GdkPixbuf.PixbufClass.t
       -> unit
    val setSize :
      record_t
       -> LargeInt.int
       -> unit
    val setSizeWildcarded :
      record_t
       -> bool
       -> unit
    val setState :
      record_t
       -> statetype_t
       -> unit
    val setStateWildcarded :
      record_t
       -> bool
       -> unit
  end
