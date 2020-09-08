signature GTK_ACTIONABLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getActionName : 'a class -> string option
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
    val actionNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val actionTargetProp : ('a class, unit -> GLib.VariantRecord.t option, GLib.VariantRecord.t option -> unit, GLib.VariantRecord.t option -> unit) Property.t
  end
