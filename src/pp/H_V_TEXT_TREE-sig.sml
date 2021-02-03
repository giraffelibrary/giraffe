signature H_V_TEXT_TREE =
  sig
    type version
    type frame
    type 'a variant

    structure H :
      sig
        include H_TEXT_TREE
        val seqWith : t -> ('a -> t) -> 'a list -> t
        val concatWith : string -> string list -> t
      end

    structure V :
      sig
        include V_TEXT_TREE
        val seqWith : t -> ('a -> t) -> 'a list -> t
        val concatWith : H.t -> H.t list -> t
      end

    sharing type V.version = H.version = version
    sharing type V.frame = H.frame = frame
    sharing type V.variant = H.variant = variant

    sharing type V.h = H.t


    type h = H.t
    type v = V.t

    datatype t =
      H of h
    | V of v

    (* `toV` always produces exactly one line for horizontal text. *)
    val toH : t -> h option
    val toV : t -> v


    datatype tlist =
      HList of h list
    | VList of v list

    val fromList : t list -> tlist

    val indentWith1 : h * h -> bool -> t -> t
  end
