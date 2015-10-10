signature H_V_TEXT_TREE =
  sig
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


    datatype t =
      H of H.t
    | V of V.t

    (* `toV` always produces exactly one line for horizontal text. *)
    val toH : t -> H.t option
    val toV : t -> V.t


    datatype tlist =
      HList of H.t list
    | VList of V.t list

    val fromList : t list -> tlist

    val vIndentWith1 : H.t * H.t -> V.t -> V.t
    val indentWith1 : H.t * H.t -> t -> t
  end
