signature GTK_INPUT_PURPOSE =
  sig
    datatype enum =
      FREE_FORM
    | ALPHA
    | DIGITS
    | NUMBER
    | PHONE
    | URL
    | EMAIL
    | NAME
    | PASSWORD
    | PIN
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
