signature PANGO_COVERAGE_LEVEL =
  sig
    datatype enum =
      NONE
    | FALLBACK
    | APPROXIMATE
    | EXACT
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
