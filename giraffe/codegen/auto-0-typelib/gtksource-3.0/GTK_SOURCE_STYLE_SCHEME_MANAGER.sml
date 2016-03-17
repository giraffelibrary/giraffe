signature GTK_SOURCE_STYLE_SCHEME_MANAGER =
  sig
    type 'a class
    type 'a style_scheme_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getDefault : unit -> base class
    val appendSearchPath :
      'a class
       -> string
       -> unit
    val forceRescan : 'a class -> unit
    val getScheme :
      'a class
       -> string
       -> base style_scheme_class
    val prependSearchPath :
      'a class
       -> string
       -> unit
  end
