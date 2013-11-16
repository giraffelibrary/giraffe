signature GDK_EVENT_KEY_RECORD =
  sig
    type key
    type 'a event_t
    type t = key event_t
    type 'a windowclass_t
    type modifiertype_t
    val t : (t, t) GObjectValue.accessor
    datatype event =
      KEYPRESS
    | KEYRELEASE
    val getWindow : t -> base windowclass_t
    val getSendEvent : t -> bool
    val getTime : t -> LargeInt.int
    val getState : t -> modifiertype_t
    val getKeyval : t -> LargeInt.int
    val getHardwareKeycode : t -> LargeInt.int
    val getGroup : t -> LargeInt.int
    val getIsModifier : t -> bool
    structure C :
      sig
        type notnull
        type 'a p
        val withPtr :
          (notnull p -> 'a)
           -> t
           -> 'a
        val withOptPtr :
          (unit p -> 'a)
           -> t option
           -> 'a
        val fromPtr :
          bool
           -> notnull p
           -> t
        val fromOptPtr :
          bool
           -> unit p
           -> t option
      end
  end
