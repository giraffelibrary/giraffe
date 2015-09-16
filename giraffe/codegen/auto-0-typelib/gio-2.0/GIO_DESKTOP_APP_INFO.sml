signature GIO_DESKTOP_APP_INFO =
  sig
    type 'a class_t
    type 'a app_info_class_t
    type t = base class_t
    val asAppInfo : 'a class_t -> base app_info_class_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val newFromFilename : string -> base class_t
    val newFromKeyfile : GLib.KeyFileRecord.t -> base class_t
    val setDesktopEnv : string -> unit
    val getCategories : 'a class_t -> string
    val getFilename : 'a class_t -> string
    val getGenericName : 'a class_t -> string
    val getIsHidden : 'a class_t -> bool
    val getNodisplay : 'a class_t -> bool
    val getShowIn :
      'a class_t
       -> string
       -> bool
    val filenameProp : ('a class_t, string option, string option) Property.readwrite
  end
