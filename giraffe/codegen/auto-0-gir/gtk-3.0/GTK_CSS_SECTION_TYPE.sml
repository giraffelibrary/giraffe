signature GTK_CSS_SECTION_TYPE =
  sig
    datatype enum =
      DOCUMENT
    | IMPORT
    | COLOR_DEFINITION
    | BINDING_SET
    | RULESET
    | SELECTOR
    | DECLARATION
    | VALUE
    | KEYFRAMES
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
