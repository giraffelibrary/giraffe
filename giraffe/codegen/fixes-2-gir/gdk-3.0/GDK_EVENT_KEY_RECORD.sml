signature GDK_EVENT_KEY_RECORD =
  sig
    type key
    type 'a event_union
    include RECORD where type t = key event_union
    datatype event =
      KEY_PRESS
    | KEY_RELEASE
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
    type 'a window_class
    type modifier_type_t
    val getWindow : t -> base window_class
    val getSendEvent : t -> bool
    val getTime : t -> LargeInt.int
    val getState : t -> modifier_type_t
    val getKeyval : t -> LargeInt.int
    val getHardwareKeycode : t -> LargeInt.int
    val getGroup : t -> Word8.word
    val getIsModifier : t -> bool
  end
