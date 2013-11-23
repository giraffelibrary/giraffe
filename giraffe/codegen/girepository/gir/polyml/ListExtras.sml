structure ListExtras =
  struct

    fun revMapAppend f (xs, ys) = foldl (fn (x, ys) => f x :: ys) ys xs
    fun revMap f xs = revMapAppend f (xs, [])

    fun revMapPartialAppend f (xs, ys) =
      foldl (fn (x, ys) => case f x of SOME y => y :: ys | NONE => ys) ys xs
    fun revMapPartial f xs = revMapPartialAppend f (xs, [])


    fun genfoldmapl

      (g : 'b * 'd list -> 'd list)
      (f : 'a * 'c -> 'b * 'c)

    : 'a list * 'c -> 'd list * 'c =
      let
        fun aux (xs, c) =
          case xs of
            x :: xs' =>
              let
                val (y, c') = f (x, c)
                val (ys, c') = aux (xs', c')
              in
                (g (y, ys), c')
              end
          | []       => ([], c)
      in
        aux
      end

  fun foldmapl f = genfoldmapl (op ::) f

end
