signature PANGO_FONTSET_SIMPLE =
  sig
    type 'a class
    type language_t
    type 'a font_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : language_t -> base class
    val append :
      'a class
       -> 'b font_class
       -> unit
    val size : 'a class -> LargeInt.int
  end
