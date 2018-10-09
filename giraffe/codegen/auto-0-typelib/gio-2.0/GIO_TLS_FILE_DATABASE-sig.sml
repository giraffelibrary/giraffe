signature GIO_TLS_FILE_DATABASE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val anchorsProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
