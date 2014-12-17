signature GTK_APP_CHOOSER =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getAppInfo : 'a class_t -> base Gio.AppInfoClass.t
    val getContentType : 'a class_t -> string
    val refresh : 'a class_t -> unit
    val contentTypeProp : ('a class_t, string option, string option) Property.readwrite
  end
