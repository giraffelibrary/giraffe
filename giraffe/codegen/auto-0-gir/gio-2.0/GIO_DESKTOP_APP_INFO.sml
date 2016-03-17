signature GIO_DESKTOP_APP_INFO =
  sig
    type 'a class
    type 'a app_info_class
    type t = base class
    val asAppInfo : 'a class -> base app_info_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val newFromFilename : string -> base class
    val newFromKeyfile : GLib.KeyFileRecord.t -> base class
    val setDesktopEnv : string -> unit
    val getCategories : 'a class -> string
    val getFilename : 'a class -> string
    val getGenericName : 'a class -> string
    val getIsHidden : 'a class -> bool
    val getNodisplay : 'a class -> bool
    val getShowIn :
      'a class
       -> string
       -> bool
    val filenameProp : ('a class, string option, string option) Property.readwrite
  end
