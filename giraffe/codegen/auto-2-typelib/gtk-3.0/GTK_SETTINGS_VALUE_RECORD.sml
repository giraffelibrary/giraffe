signature GTK_SETTINGS_VALUE_RECORD =
  sig
    type t
    structure C :
      sig
        type notnull
        type 'a p
        val withPtr :
          (notnull p -> 'a)
           -> t
           -> 'a
        val withOptPtr :
          (unit p -> 'a)
           -> t option
           -> 'a
        val withNewPtr :
          (notnull p -> 'a)
           -> unit
           -> (notnull p, 'a) pair
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
