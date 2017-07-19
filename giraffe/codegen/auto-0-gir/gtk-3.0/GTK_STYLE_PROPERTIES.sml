signature GTK_STYLE_PROPERTIES =
  sig
    type 'a class
    type 'a style_provider_class
    type symbolic_color_t
    type state_flags_t
    type t = base class
    val asStyleProvider : 'a class -> base style_provider_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val clear : 'a class -> unit
    val lookupColor :
      'a class
       -> string
       -> symbolic_color_t
    val mapColor :
      'a class
       -> string * symbolic_color_t
       -> unit
    val merge :
      'a class
       -> 'b class * bool
       -> unit
    val setProperty :
      'a class
       -> string
           * state_flags_t
           * GObject.ValueRecord.t
       -> unit
    val unsetProperty :
      'a class
       -> string * state_flags_t
       -> unit
  end
