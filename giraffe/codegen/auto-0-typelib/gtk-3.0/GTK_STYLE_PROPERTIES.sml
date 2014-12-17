signature GTK_STYLE_PROPERTIES =
  sig
    type 'a class_t
    type 'a styleproviderclass_t
    type symboliccolorrecord_t
    type stateflags_t
    type t = base class_t
    val asStyleProvider : 'a class_t -> base styleproviderclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val clear : 'a class_t -> unit
    val lookupColor :
      'a class_t
       -> string
       -> symboliccolorrecord_t
    val mapColor :
      'a class_t
       -> string
       -> symboliccolorrecord_t
       -> unit
    val merge :
      'a class_t
       -> 'b class_t
       -> bool
       -> unit
    val setProperty :
      'a class_t
       -> string
       -> stateflags_t
       -> GObject.ValueRecord.t
       -> unit
    val unsetProperty :
      'a class_t
       -> string
       -> stateflags_t
       -> unit
  end
