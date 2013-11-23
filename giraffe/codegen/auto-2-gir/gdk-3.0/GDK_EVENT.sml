signature GDK_EVENT =
  sig
    type 'a t
    val toBase : 'a t -> base t
    val t : (base t, 'a t) GObjectValue.accessor
    val tOpt : (base t option, 'a t option) GObjectValue.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val withPtr :
          (notnull p -> 'a)
           -> 'b t
           -> 'a
        val withOptPtr :
          (unit p -> 'a)
           -> 'b t option
           -> 'a
        val fromPtr :
          bool
           -> notnull p
           -> base t
        val fromOptPtr :
          bool
           -> unit p
           -> base t option
      end
  end
