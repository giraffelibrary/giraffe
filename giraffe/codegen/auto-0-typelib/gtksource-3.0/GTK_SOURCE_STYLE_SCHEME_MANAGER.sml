signature GTK_SOURCE_STYLE_SCHEME_MANAGER =
  sig
    type 'a class_t
    type 'a style_scheme_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getDefault : unit -> base class_t
    val appendSearchPath :
      'a class_t
       -> string
       -> unit
    val forceRescan : 'a class_t -> unit
    val getScheme :
      'a class_t
       -> string
       -> base style_scheme_class_t
    val prependSearchPath :
      'a class_t
       -> string
       -> unit
  end
