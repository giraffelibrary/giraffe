signature GTK_WIDGET_PATH =
  sig
    type t
    type 'a widget_class
    type region_flags_t
    type state_flags_t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val appendForWidget :
      t
       -> 'a widget_class
       -> LargeInt.int
    val appendWithSiblings :
      t
       -> t * LargeInt.int
       -> LargeInt.int
    val copy : t -> t
    val iterAddClass :
      t
       -> LargeInt.int * string
       -> unit
    val iterAddRegion :
      t
       -> LargeInt.int
           * string
           * region_flags_t
       -> unit
    val iterClearClasses :
      t
       -> LargeInt.int
       -> unit
    val iterClearRegions :
      t
       -> LargeInt.int
       -> unit
    val iterGetName :
      t
       -> LargeInt.int
       -> string option
    val iterGetObjectName :
      t
       -> LargeInt.int
       -> string option
    val iterGetSiblingIndex :
      t
       -> LargeInt.int
       -> LargeInt.int
    val iterGetSiblings :
      t
       -> LargeInt.int
       -> t
    val iterGetState :
      t
       -> LargeInt.int
       -> state_flags_t
    val iterHasClass :
      t
       -> LargeInt.int * string
       -> bool
    val iterHasName :
      t
       -> LargeInt.int * string
       -> bool
    val iterHasQclass :
      t
       -> LargeInt.int * LargeInt.int
       -> bool
    val iterHasQname :
      t
       -> LargeInt.int * LargeInt.int
       -> bool
    val iterHasQregion :
      t
       -> LargeInt.int * LargeInt.int
       -> region_flags_t option
    val iterHasRegion :
      t
       -> LargeInt.int * string
       -> region_flags_t option
    val iterRemoveClass :
      t
       -> LargeInt.int * string
       -> unit
    val iterRemoveRegion :
      t
       -> LargeInt.int * string
       -> unit
    val iterSetName :
      t
       -> LargeInt.int * string
       -> unit
    val iterSetObjectName :
      t
       -> LargeInt.int * string option
       -> unit
    val iterSetState :
      t
       -> LargeInt.int * state_flags_t
       -> unit
    val length : t -> LargeInt.int
    val toString : t -> string
  end
