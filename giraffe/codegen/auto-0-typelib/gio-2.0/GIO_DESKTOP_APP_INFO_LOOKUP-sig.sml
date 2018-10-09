signature GIO_DESKTOP_APP_INFO_LOOKUP =
  sig
    type 'a class
    type 'a app_info_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefaultForUriScheme :
      'a class
       -> string
       -> base app_info_class
  end
