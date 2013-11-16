signature GTK_CSS_PROVIDER =
  sig
    type 'a class_t
    type 'a styleproviderclass_t
    val asStyleProvider : 'a class_t -> base styleproviderclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getDefault : unit -> base class_t
    val getNamed :
      string
       -> string option
       -> base class_t
    val loadFromFile :
      'a class_t
       -> 'b Gio.FileClass.t
       -> bool
    val loadFromPath :
      'a class_t
       -> string
       -> bool
    val toString : 'a class_t -> string
  end
