structure HVTextTree :>
    H_V_TEXT_TREE
      where type version = Variant.version
      where type frame = Variant.frame
      where type 'a variant = 'a Variant.t =
  struct
    type version = Variant.version
    type frame = Variant.frame
    type 'a variant = 'a Variant.t

    local
      fun seqWith (empty, seq) sep f ts =
        let
          fun aux acc =
            fn
              t :: ts => aux (seq [acc, sep, f t]) ts
            | []      => acc
        in
          case ts of
            []      => empty
          | t :: [] => f t
          | t :: ts => aux (f t) ts
        end
    in
      structure H =
        struct
          open HTextTree
          val seqWith = fn x => seqWith (empty, seq) x
          fun concatWith sep ss = seqWith (str sep) str ss
        end

      structure V =
        struct
          open VTextTree
          val seqWith = fn x => seqWith (empty, seq) x
          fun concatWith sep ss = seqWith (line sep) line ss
        end
    end


    type h = H.t
    type v = V.t

    datatype t =
      H of H.t
    | V of V.t


    val toH = fn H h => SOME h | V _ => NONE
    val toV = fn H h => V.line h | V v => v


    datatype tlist =
      HList of H.t list
    | VList of V.t list

    fun fromList (ts : t list) : tlist =
      HList (List.map (valOf o toH) ts) handle Option => VList (List.map toV ts)

    fun indentWith1 (prefixes as (prefixFirst, _)) nonEmptyOnly t : t =
      case t of
        H h => H (H.indentWith prefixFirst nonEmptyOnly h)
      | V v => V (V.indentWith1 prefixes nonEmptyOnly v)
  end
