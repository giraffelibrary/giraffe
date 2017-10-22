signature GIO_NOTIFICATION =
  sig
    type 'a class
    type 'a icon_class
    type notification_priority_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val addButton :
      'a class
       -> string * string
       -> unit
    val addButtonWithTarget :
      'a class
       -> string
           * string
           * GLib.VariantRecord.t option
       -> unit
    val setBody :
      'a class
       -> string option
       -> unit
    val setDefaultAction :
      'a class
       -> string
       -> unit
    val setDefaultActionAndTarget :
      'a class
       -> string * GLib.VariantRecord.t option
       -> unit
    val setIcon :
      'a class
       -> 'b icon_class
       -> unit
    val setPriority :
      'a class
       -> notification_priority_t
       -> unit
    val setTitle :
      'a class
       -> string
       -> unit
    val setUrgent :
      'a class
       -> bool
       -> unit
  end
