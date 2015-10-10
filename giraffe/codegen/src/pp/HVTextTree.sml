structure HVTextTree : H_V_TEXT_TREE =
  struct

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



    datatype t =
      H of H.t
    | V of V.t

    val toH = fn H h => SOME h | V _ => NONE
    val toV = fn H h => V.line h | V v => v


    datatype tlist =
      HList of H.t list
    | VList of V.t list

    fun fromList (ts : t list) : tlist =
      HList (map (valOf o toH) ts) handle Option => VList (map toV ts)


    fun vIndentWith1 (prefixFirst, prefixRest) v : V.t =
      case V.Iter.getLine (V.Iter.fromText v) of
        SOME (head, rest) =>
          if V.Iter.isEmpty rest
          then
            (* `v` is single line *)
            V.line (H.seq [prefixFirst, head])
          else
            (* `v` is multi-line *)
            V.seq [
              V.line (H.seq [prefixFirst, head]),
              V.indentWith prefixRest true (V.Iter.toText rest)
            ]
      | NONE              => V.empty

    fun indentWith1 (prefixes as (prefixFirst, _)) t : t =
      case t of
        H h => H (H.seq [prefixFirst, h])
      | V v => V (vIndentWith1 prefixes v)

  end
