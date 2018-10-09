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
    val actionNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val actionTargetProp :
      {
        get : 'a class -> GLib.VariantRecord.t option,
        set :
          GLib.VariantRecord.t option
           -> 'a class
           -> unit,
        new : GLib.VariantRecord.t option -> 'a class Property.t
      }
  end
