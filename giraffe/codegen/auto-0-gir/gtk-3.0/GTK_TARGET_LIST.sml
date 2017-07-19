signature GTK_TARGET_LIST =
  sig
    type t
    type 'a text_buffer_class
    val getType : unit -> GObject.Type.t
    val add :
      t
       -> Gdk.AtomRecord.t
           * LargeInt.int
           * LargeInt.int
       -> unit
    val addImageTargets :
      t
       -> LargeInt.int * bool
       -> unit
    val addRichTextTargets :
      t
       -> LargeInt.int
           * bool
           * 'a text_buffer_class
       -> unit
    val addTextTargets :
      t
       -> LargeInt.int
       -> unit
    val addUriTargets :
      t
       -> LargeInt.int
       -> unit
    val remove :
      t
       -> Gdk.AtomRecord.t
       -> unit
  end
