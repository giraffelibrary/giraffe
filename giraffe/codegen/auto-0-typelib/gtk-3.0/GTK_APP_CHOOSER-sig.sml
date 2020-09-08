signature GTK_APP_CHOOSER =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getAppInfo : 'a class -> base Gio.AppInfoClass.class option
    val getContentType : 'a class -> string
    val refresh : 'a class -> unit
    val contentTypeProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
  end
