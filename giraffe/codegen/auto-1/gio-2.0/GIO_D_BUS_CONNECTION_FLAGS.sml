signature GIO_D_BUS_CONNECTION_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val NONE : t
    val AUTHENTICATIONCLIENT : t
    val AUTHENTICATIONSERVER : t
    val AUTHENTICATIONALLOWANONYMOUS : t
    val MESSAGEBUSCONNECTION : t
    val DELAYMESSAGEPROCESSING : t
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
      end
  end
