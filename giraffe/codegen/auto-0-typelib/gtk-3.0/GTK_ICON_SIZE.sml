signature GTK_ICON_SIZE =
  sig
    datatype t =
      INVALID
    | MENU
    | SMALL_TOOLBAR
    | LARGE_TOOLBAR
    | BUTTON
    | DND
    | DIALOG
    val null : t
    val t : (t, t) GObject.Value.accessor
    type 'a settings_class
    val getType : unit -> GObject.Type.t
    val fromName : string -> LargeInt.int
    val getName : LargeInt.int -> string
    val lookup : LargeInt.int -> (LargeInt.int * LargeInt.int) option
    val lookupForSettings :
      'a settings_class
       -> LargeInt.int
       -> (LargeInt.int * LargeInt.int) option
    val register :
      string
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val registerAlias :
      string
       -> LargeInt.int
       -> unit
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
