structure GdkKeymapKey :>
  GDK_KEYMAP_KEY
    where type record_t = GdkKeymapKeyRecord.t =
  struct
    type record_t = GdkKeymapKeyRecord.t
    type t = record_t
  end
