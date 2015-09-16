signature GTK_STYLE_PROPERTIES =
  sig
    type 'a class_t
    type 'a style_provider_class_t
    type symbolic_color_record_t
    type state_flags_t
    type t = base class_t
    val asStyleProvider : 'a class_t -> base style_provider_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val clear : 'a class_t -> unit
    val lookupColor :
      'a class_t
       -> string
       -> symbolic_color_record_t
    val mapColor :
      'a class_t
       -> string
       -> symbolic_color_record_t
       -> unit
    val merge :
      'a class_t
       -> 'b class_t
       -> bool
       -> unit
    val setProperty :
      'a class_t
       -> string
       -> state_flags_t
       -> GObject.ValueRecord.t
       -> unit
    val unsetProperty :
      'a class_t
       -> string
       -> state_flags_t
       -> unit
  end
