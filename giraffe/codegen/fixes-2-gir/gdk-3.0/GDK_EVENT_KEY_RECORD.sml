signature GDK_EVENT_KEY_RECORD =
  sig
    type key
    type 'a event_union
    type t = key event_union
    type 'a window_class
    type modifier_type_t
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
    datatype event =
      KEY_PRESS
    | KEY_RELEASE
    val getWindow : t -> base window_class
    val getSendEvent : t -> bool
    val getTime : t -> LargeInt.int
    val getState : t -> modifier_type_t
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
