signature GIO_DESKTOP_APP_INFO =
  sig
    type 'a class
    type 'a app_info_class
    type 'a app_launch_context_class
    type t = base class
    val asAppInfo : 'a class -> base app_info_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val newFromFilename : string -> base class
    val newFromKeyfile : GLib.KeyFileRecord.t -> base class
    val search : string -> Utf8CArrayCArray.t
    val setDesktopEnv : string -> unit
    val getActionName :
      'a class
       -> string
       -> string
    val getBoolean :
      'a class
       -> string
       -> bool
    val getCategories : 'a class -> string
    val getFilename : 'a class -> string
    val getGenericName : 'a class -> string
    val getIsHidden : 'a class -> bool
    val getKeywords : 'a class -> Utf8CArray.t
    val getNodisplay : 'a class -> bool
    val getShowIn :
      'a class
       -> string option
       -> bool
    val getStartupWmClass : 'a class -> string
    val getString :
      'a class
       -> string
       -> string
    val hasKey :
      'a class
       -> string
       -> bool
    val launchAction :
      'a class
       -> string * 'b app_launch_context_class option
       -> unit
    val listActions : 'a class -> Utf8CArray.t
    val filenameProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
  end
