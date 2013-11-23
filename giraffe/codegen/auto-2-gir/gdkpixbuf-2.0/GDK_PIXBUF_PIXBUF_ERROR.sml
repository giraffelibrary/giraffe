signature GDK_PIXBUF_PIXBUF_ERROR =
  sig
    datatype t =
      CORRUPTIMAGE
    | INSUFFICIENTMEMORY
    | BADOPTION
    | UNKNOWNTYPE
    | UNSUPPORTEDOPERATION
    | FAILED
    exception Error of t
    val handler : GLib.ErrorRecord.handler
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
        exception Value of FFI.Enum.C.val_
      end
  end
