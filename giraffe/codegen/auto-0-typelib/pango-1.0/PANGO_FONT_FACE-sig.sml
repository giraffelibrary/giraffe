signature PANGO_FONT_FACE =
  sig
    type 'a class
    type font_description_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val describe : 'a class -> font_description_t
    val getFaceName : 'a class -> string
    val isSynthesized : 'a class -> bool
    val listSizes : 'a class -> GInt32CArrayN.t
  end
