signature GTK_WIDGET_PATH =
  sig
    type record_t
    type 'a widget_class_t
    type region_flags_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val appendForWidget :
      record_t
       -> 'a widget_class_t
       -> LargeInt.int
    val appendWithSiblings :
      record_t
       -> record_t
       -> LargeInt.int
       -> LargeInt.int
    val copy : record_t -> record_t
    val iterAddClass :
      record_t
       -> LargeInt.int
       -> string
       -> unit
    val iterAddRegion :
      record_t
       -> LargeInt.int
       -> string
       -> region_flags_t
       -> unit
    val iterClearClasses :
      record_t
       -> LargeInt.int
       -> unit
    val iterClearRegions :
      record_t
       -> LargeInt.int
       -> unit
    val iterGetName :
      record_t
       -> LargeInt.int
       -> string
    val iterGetSiblingIndex :
      record_t
       -> LargeInt.int
       -> LargeInt.int
    val iterGetSiblings :
      record_t
       -> LargeInt.int
       -> record_t
    val iterHasClass :
      record_t
       -> LargeInt.int
       -> string
       -> bool
    val iterHasName :
      record_t
       -> LargeInt.int
       -> string
       -> bool
    val iterHasQclass :
      record_t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
    val iterHasQname :
      record_t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
    val iterHasQregion :
      record_t
       -> LargeInt.int
       -> LargeInt.int
       -> region_flags_t option
    val iterHasRegion :
      record_t
       -> LargeInt.int
       -> string
       -> region_flags_t option
    val iterRemoveClass :
      record_t
       -> LargeInt.int
       -> string
       -> unit
    val iterRemoveRegion :
      record_t
       -> LargeInt.int
       -> string
       -> unit
    val iterSetName :
      record_t
       -> LargeInt.int
       -> string
       -> unit
    val length : record_t -> LargeInt.int
    val toString : record_t -> string
  end
