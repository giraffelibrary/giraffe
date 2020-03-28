structure ListExtras =
  struct

    fun revMapAppendWith g f (xs, ys) = foldl (fn (x, ys) => g (f x, ys)) ys xs
    fun revMapAppend f = revMapAppendWith (op ::) f
    fun revMap f xs = revMapAppend f (xs, [])

    fun revMapPartialAppendWith g f (xs, ys) =
      foldl (fn (x, ys) => case f x of SOME y => g (y, ys) | NONE => ys) ys xs
    fun revMapPartialAppend f = revMapPartialAppendWith (op ::) f
    fun revMapPartial f xs = revMapPartialAppend f (xs, [])


    fun foldmapwithl

      (
        e : 'd,
        g : 'b * 'd -> 'd
      )
      (f : 'a * 'c -> 'b * 'c)

    : 'a list * 'c -> 'd * 'c =
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
          | []       => (e, c)
      in
        aux
      end

    fun foldmapl f = foldmapwithl ([], op ::) f

    fun insert (x, xs) =
      if List.exists (fn x' => x = x') xs then xs else x :: xs

    local
      fun find (e, xs) =
        let
          fun aux n =
            fn
              x :: xs =>
                if x = e
                then SOME n
                else aux (n + 1) xs
            | []      => NONE
        in
          aux 0 xs
        end

      fun splitAt (n, xs) =
        let
          fun aux n (ys, xs) =
            if n > 0
            then
              case xs of
                x :: xs => aux (n - 1) (x :: ys, xs)
              | []      => raise Subscript
            else if n = 0
            then (ys, xs)
            else raise Subscript
        in
          aux n ([], xs)
        end
    in
      fun removeFirst (e, xs) =
        case find (e, xs) of
          SOME n =>
            let
              val (ys, xs) = splitAt (n, xs)
            in
              List.revAppend (ys, tl xs)
            end
        | NONE   => xs
    end

    fun partitionRevAppendMap (f, g) =
      let
        fun aux (acc1, acc2) =
          fn
            x :: xs => (
              case f x of
                SOME y => aux (y :: acc1, acc2) xs
              | NONE   => aux (acc1, g x :: acc2) xs
            )
          | []      => (acc1, acc2)
      in
        aux
      end

    fun partitionRevMap (f, g) = partitionRevAppendMap (f, g) ([], [])

    fun sepWith sep =
      let
        fun aux acc =
          fn
            []      => rev acc
          | x :: xs => aux (x :: sep :: acc) xs
      in
        fn
          []      => []
        | x :: [] => [x]
        | x :: xs => aux [x] xs
      end

  end
