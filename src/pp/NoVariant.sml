structure NoVariant :> VARIANT =
  struct
    (* The type `version` is uninhabited outside this structure.  Therefore
     * it can be assumed that no value for a version can be provided to any
     * function here.  Still, this is checked and the exception `Version`
     * raised if any value is found.  Ideally a compiler would determine that
     * such paths are unreachable.
     *)
    type version = unit
    exception Version

    structure Version =
      struct
        type version = version
        (* `compare` and `toString` can never be evaluated as the type
         * `version` is uninhabited outside this structure. *)
        fun compare _ = raise Version
        fun toString _ = raise Version
      end

    type 'a t = 'a

    (* In `variant (vxs, d)`, `vxs` must be `[]` as the type
     * `version` is uninhabited outside this structure. *)
    fun default d = d
    val variant =
      fn
        ([], d) => d
      | _       => raise Version

    (* In `value optVer`, `optVer` must be `NONE` as the type
     * `version` is uninhabited outside this structure. *)
    fun versions _ = []
    fun values d = ([], d)
    val value =
      fn
        NONE => Fn.id
      | _    => raise Version

    type 'a same = 'a * 'a -> bool

    fun split _ = Fn.id
    fun join _ = Fn.id

    fun map _ = Fn.id
    fun fold _ = Fn.id
    fun foldmap _ = Fn.id

    type frame = unit
    val unboundedFrame = ()

    fun map1 _ () f = f ()
    fun map2 _ () f = f ()
    fun fold1 _ () f = f ()
    fun foldmap1 _ () f = f ()

    structure List =
      struct
        fun all () f = List.all (f ())
      end
  end
