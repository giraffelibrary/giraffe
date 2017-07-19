signature PANGO_TAB_ARRAY =
  sig
    type t
    type tab_align_t
    val getType : unit -> GObject.Type.t
    val new : LargeInt.int * bool -> t
    val copy : t -> t
    val getPositionsInPixels : t -> bool
    val getSize : t -> LargeInt.int
    val getTab :
      t
       -> LargeInt.int
       -> tab_align_t * LargeInt.int
    val resize :
      t
       -> LargeInt.int
       -> unit
    val setTab :
      t
       -> LargeInt.int
           * tab_align_t
           * LargeInt.int
       -> unit
  end
