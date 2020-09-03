structure ListExtras =
  struct

    fun fold f (xs, e) = foldl f e xs
    fun revFold f (xs, e) = foldl f e (rev xs)
    fun foldL f (e, xs) = foldl (fn (x, e) => f (e, x)) e xs
    fun foldR f (xs, e) = foldr f e xs


    fun revMapAppendWith g f (xs, a) = foldl (fn (x, a) => g (f x, a)) a xs
    fun revMapAppend f = revMapAppendWith (op ::) f
    fun revMap f xs = revMapAppend f (xs, [])

    fun revMapPartialAppendWith g f (xs, a) =
      foldl (fn (x, a) => case f x of SOME y => g (y, a) | NONE => a) a xs
    fun revMapPartialAppend f = revMapPartialAppendWith (op ::) f
    fun revMapPartial f xs = revMapPartialAppend f (xs, [])


    val unzipInit = ([], [])
    fun unzipStep ((x, y), (xs, ys)) = (x :: xs, y :: ys)


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

    fun findMap f xs =
      case xs of
        x :: xs' => (
          case f x of
            SOME y => SOME y
          | NONE   => findMap f xs'
        )
      | []       => NONE

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


    (* `revSort unsortable m` returns a reordering of `m` such that each element
     * occurs after its dependencies in `rev m`, i.e. the reordering in reverse
     * satisfies the partial order in `m`.  Each element in `m` has the form
     * `(key, (data, deps))` where `deps` are the keys that `key` depends on.
     *
     * If no total order exists that satisfies the partial order, then the
     * function `unsortable` is applied to `m` where `m` is a list of the elements
     * whose dependencies could not be satisfied, where each  element has the form
     * `(remainingDeps, (key, (data, originalDeps)))`.  `unsortable` could report
     * the error and continue with only those elements that could be sorted or
     * raise an exception.  The function `reportUnsortable` is a general function
     * to print unsortable elements.
     *)

    fun reportUnsortable m =
      let
        fun quote s = ["\"", String.toString s, "\""]
        fun fmt (deps, (id, _)) = (
          app (app print) [quote id, [" ("]];
          app (app print) (sepWith [", "] (map quote deps));
          print ")\n"
        )
      in
        app fmt m
      end

    fun listRemoveFirst ys xs = foldl removeFirst xs ys

    infix **
    fun (f ** g) (x, y) = (f x, g y)

    fun getNext unsortable (m : (string list * (string * ('a * string list))) list) =
      let
        val (next, m'1) =
          partitionRevMap
            (fn ([], x) => SOME x | _ => NONE, I)
            m

        val ids = map #1 next
        val m'2 = revMap (listRemoveFirst ids ** I) m'1
        val () =
          case next of
            _ :: _ => ()
          | []     => unsortable m
      in
        (next, m'2)
      end

    fun revSortMapAppendWith
      (unsortable : (string list * (string * ('a * string list))) list -> unit)
      (g : 'c * 'd -> 'd)
      (f : string * ('a * string list) -> 'c)
      (m : (string * ('a * string list)) list, acc : 'd)
      : 'd =
      let
        fun step (m, acc) =
          case m of
            _ :: _ =>
              let
                val (next, m') = getNext unsortable m
              in
                case next of
                  _ :: _ => step (m', revMapAppendWith g f (next, acc))
                | []     => acc
              end
          | []     => acc
        fun init (x as (_, (_, deps))) = (deps, x)
      in
        step (revMap init m, acc)
      end

    fun revSortMapAppend unsortable f = revSortMapAppendWith unsortable (op ::) f

    fun revSortMap unsortable f m = revSortMapAppend unsortable f (m, [])

    fun revSort unsortable m = revSortMap unsortable Fn.id m

  end
