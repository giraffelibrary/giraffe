signature GTK_ICON_SOURCE =
  sig
    type t
    type text_direction_t
    type state_type_t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val copy : t -> t
    val getDirection : t -> text_direction_t
    val getDirectionWildcarded : t -> bool
    val getFilename : t -> string
    val getIconName : t -> string
    val getPixbuf : t -> base GdkPixbuf.PixbufClass.class
    val getSize : t -> LargeInt.int
    val getSizeWildcarded : t -> bool
    val getState : t -> state_type_t
    val getStateWildcarded : t -> bool
    val setDirection :
      t
       -> text_direction_t
       -> unit
    val setDirectionWildcarded :
      t
       -> bool
       -> unit
    val setFilename :
      t
       -> string
       -> unit
    val setIconName :
      t
       -> string option
       -> unit
    val setPixbuf :
      t
       -> 'a GdkPixbuf.PixbufClass.class
       -> unit
    val setSize :
      t
       -> LargeInt.int
       -> unit
    val setSizeWildcarded :
      t
       -> bool
       -> unit
    val setState :
      t
       -> state_type_t
       -> unit
    val setStateWildcarded :
      t
       -> bool
       -> unit
  end
