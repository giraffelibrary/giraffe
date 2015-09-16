signature PANGO_FONT_FACE =
  sig
    type 'a class_t
    type font_description_record_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val describe : 'a class_t -> font_description_record_t
    val getFaceName : 'a class_t -> string
    val isSynthesized : 'a class_t -> bool
  end
