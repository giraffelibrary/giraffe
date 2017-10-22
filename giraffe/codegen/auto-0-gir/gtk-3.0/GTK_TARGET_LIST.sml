signature GTK_TARGET_LIST =
  sig
    type t
    type 'a text_buffer_class
    type target_entry_t
    val getType : unit -> GObject.Type.t
    val new : target_entry_t vector option -> t
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
    val addTable :
      t
       -> target_entry_t vector
       -> unit
    val addTextTargets :
      t
       -> LargeInt.int
       -> unit
    val addUriTargets :
      t
       -> LargeInt.int
       -> unit
    val find :
      t
       -> Gdk.AtomRecord.t
       -> LargeInt.int option
    val remove :
      t
       -> Gdk.AtomRecord.t
       -> unit
  end
