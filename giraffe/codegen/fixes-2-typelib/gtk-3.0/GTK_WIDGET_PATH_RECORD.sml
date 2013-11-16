signature GTK_WIDGET_PATH_RECORD =
  sig
    type t
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
    structure C :
      sig
        type notnull
        type 'a p
        type ('a, 'b) r
        val withPtr :
          (notnull p -> 'a)
           -> t
           -> 'a
        val withOptPtr :
          (unit p -> 'a)
           -> t option
           -> 'a
        val withRefPtr :
          (('a, 'b) r -> 'c)
            -> t
            -> ('b p, 'c) pair
        val withRefOptPtr :
          ((unit, 'a) r -> 'b)
            -> t option
            -> ('a p, 'b) pair
        val fromPtr :
          bool
           -> notnull p
           -> t
        val fromOptPtr :
          bool
           -> unit p
           -> t option
      end
  end
