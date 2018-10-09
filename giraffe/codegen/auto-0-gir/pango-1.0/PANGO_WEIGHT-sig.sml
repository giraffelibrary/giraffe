signature PANGO_WEIGHT =
  sig
    datatype enum =
      THIN
    | ULTRALIGHT
    | LIGHT
    | SEMILIGHT
    | BOOK
    | NORMAL
    | MEDIUM
    | SEMIBOLD
    | BOLD
    | ULTRABOLD
    | HEAVY
    | ULTRAHEAVY
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
