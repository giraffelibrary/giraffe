signature ATK_TEXT_ATTRIBUTE =
  sig
    datatype t =
      INVALID
    | LEFTMARGIN
    | RIGHTMARGIN
    | INDENT
    | INVISIBLE
    | EDITABLE
    | PIXELSABOVELINES
    | PIXELSBELOWLINES
    | PIXELSINSIDEWRAP
    | BGFULLHEIGHT
    | RISE
    | UNDERLINE
    | STRIKETHROUGH
    | SIZE
    | SCALE
    | WEIGHT
    | LANGUAGE
    | FAMILYNAME
    | BGCOLOR
    | FGCOLOR
    | BGSTIPPLE
    | FGSTIPPLE
    | WRAPMODE
    | DIRECTION
    | JUSTIFICATION
    | STRETCH
    | VARIANT
    | STYLE
    | LASTDEFINED
    val null : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    val forName : string -> t
    val getName : t -> string
    val getValue :
      t
       -> LargeInt.int
       -> string
    val register : string -> t
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
        exception Value of FFI.Enum.C.val_
      end
  end
