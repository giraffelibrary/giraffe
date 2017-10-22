signature GTK_ACTIONABLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getActionName : 'a class -> string
    val getActionTargetValue : 'a class -> GLib.VariantRecord.t
    val setActionName :
      'a class
       -> string option
       -> unit
    val setActionTargetValue :
      'a class
       -> GLib.VariantRecord.t
       -> unit
    val setDetailedActionName :
      'a class
       -> string
       -> unit
    val actionNameProp : ('a class, string option, string option) Property.readwrite
    val actionTargetProp : ('a class, GLib.VariantRecord.t option, GLib.VariantRecord.t option) Property.readwrite
  end
