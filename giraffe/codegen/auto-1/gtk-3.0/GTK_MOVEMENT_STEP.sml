signature GTK_MOVEMENT_STEP =
  sig
    datatype t =
      LOGICALPOSITIONS
    | VISUALPOSITIONS
    | WORDS
    | DISPLAYLINES
    | DISPLAYLINEENDS
    | PARAGRAPHS
    | PARAGRAPHENDS
    | PAGES
    | BUFFERENDS
    | HORIZONTALPAGES
    val null : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.val_
      end
  end
