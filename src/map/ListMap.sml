functor ListMap (Key : EQ_KEY) :>
  sig
    include MAP where type key = Key.key

    val toList : 'a t -> 'a maplet list
  end =
  struct
    type key = Key.key
    type 'a maplet = key * 'a

    type 'a t = 'a maplet list


    val empty = []

    fun singleton x = [x]

    fun singletonMap f (k, d) = [(k, f d)]

    fun singletonMapi f (x as (k, _)) = [(k, f x)]

    fun singletonFoldMap f (k, d) =
      let val (a, d') = f d in (a, [(k, d')]) end

    fun singletonFoldMapi f (x as (k, _)) =
      let val (a, d') = f x in (a, [(k, d')]) end


    val isEmpty = List.null

    val size = List.length


    fun extractMaplet kFind xs =
      let
        fun find ys xs =
          case xs of
            (x as (k, d)) :: xs' =>
              if Key.eq (k, kFind)
              then SOME (ys, d, xs')
              else find (x :: ys) xs'
          | []                   => NONE
      in
        find [] xs
      end


    fun insertMapi g f (x as (k, _), xs) =
      case extractMaplet k xs of
        SOME (ys, d, zs) =>
          let
            val d' = f (x, d)
          in
            if not (alias (d', d))
            then List.revAppend (ys, (k, d') :: zs)
            else xs
          end
      | NONE             => (k, g x) :: xs

    fun insertFoldMapi g f (x as (k, _), xs) =
      case extractMaplet k xs of
        SOME (ys, d, zs) =>
          let
            val (acc, d') = f (x, d)
            val xs' =
              if not (alias (d', d))
              then List.revAppend (ys, (k, d') :: zs)
              else xs
          in
            (acc, xs')
          end
      | NONE             =>
          let
            val (acc, d') = g x
          in
            (acc, (k, d') :: xs)
          end

    fun insertMap g f = insertMapi (g o #2) (fn (x, d) => f (#2 x, d))

    fun insertFoldMap g f = insertFoldMapi (g o #2) (fn (x, d) => f (#2 x, d))

    fun insert f = insertMap Fn.id f

    fun inserti f = insertMapi #2 f


    fun update f (k, xs) =
      case extractMaplet k xs of
        SOME (ys, d, zs) =>
          let
            val d' = f d
          in
            if not (alias (d', d))
            then List.revAppend (ys, (k, d') :: zs)
            else xs
          end
      | NONE             => xs


    fun delete (k, xs) =
      case extractMaplet k xs of
        SOME (ys, _, zs) => List.revAppend (ys, zs)
      | NONE             => xs


    fun removei f (k, xs) =
      case extractMaplet k xs of
        SOME (ys, d, zs) => (
          case f (k, d) of
            SOME d' =>
              if not (alias (d', d))
              then List.revAppend (ys, (k, d') :: zs)
              else xs
          | NONE    => List.revAppend (ys, zs)
        )
      | NONE             => xs

    fun removeMapi f ((k, a), xs) =
      case extractMaplet k xs of
        SOME (ys, d, zs) => (
          case f (k, (a, d)) of
            SOME d' =>
              if not (alias (d', d))
              then List.revAppend (ys, (k, d') :: zs)
              else xs
          | NONE    => List.revAppend (ys, zs)
        )
      | NONE             => xs

    fun removeFoldMapi g f (x as (k, a), xs) =
      case extractMaplet k xs of
        SOME (ys, d, zs) =>
          let
            val (a, dOpt) = f (k, (a, d))
            val xs' =
              case dOpt of
                SOME d' =>
                  if not (alias (d', d))
                  then List.revAppend (ys, (k, d') :: zs)
                  else xs
              | NONE    => List.revAppend (ys, zs)
          in
            (a, xs')
          end
      | NONE             => (g x, xs)

    fun remove f = removei (f o #2)

    fun removeMap f = removeMapi (f o #2)

    fun removeFoldMap g f = removeFoldMapi (g o #2) (f o #2)


    fun lookup xs kFind =
      let
        fun find xs =
          case xs of
            (k, d) :: xs' =>
              if Key.eq (k, kFind)
              then SOME d
              else find xs'
          | []            => NONE
      in
        find xs
      end


    fun app f xs =
      case xs of
        (_, d) :: xs' => (f d; app f xs')
      | []            => ()

    fun appi f xs =
      case xs of
        x :: xs' => (f x; appi f xs')
      | []       => ()


    fun map f xs =
      case xs of
        (k, d) :: xs' => (k, f d) :: map f xs'
      | []            => []

    fun mapi f xs =
      case xs of
        (x as (k, _)) :: xs' => (k, f x) :: mapi f xs'
      | []                   => []


    fun mapPartial f xs =
      case xs of
        (k, d) :: xs' => (
          case f d of
            SOME d' => (k, d') :: mapPartial f xs'
          | NONE    => mapPartial f xs'
        )
      | []            => []

    fun mapPartiali f xs =
      case xs of
        (x as (k, _)) :: xs' => (
          case f x of
            SOME d' => (k, d') :: mapPartiali f xs'
          | NONE    => mapPartiali f xs'
        )
      | []                   => []


    fun filter f xs =
      case xs of
        (x as (_, d)) :: xs' => (
          if f d
          then x :: filter f xs'
          else filter f xs'
        )
      | []                   => []

    fun filteri f xs =
      case xs of
        x :: xs' => (
          if f x
          then x :: filteri f xs'
          else filteri f xs'
        )
      | []       => []


    fun fold f (xs, a) =
      case xs of
        (_, d) :: xs' => fold f (xs', f (d, a))
      | []            => a

    fun foldi f (xs, a) =
      case xs of
        x :: xs' => foldi f (xs', f (x, a))
      | []       => a


    fun foldR f (xs, a) =
      case xs of
        (_, d) :: xs' => f (d, foldR f (xs', a))
      | []            => a

    fun foldRi f (xs, a) =
      case xs of
        x :: xs' => f (x, foldRi f (xs', a))
      | []       => a


    fun foldL f (a, xs) =
      case xs of
        (_, d) :: xs' => foldL f (f (a, d), xs')
      | []            => a

    fun foldLi f (a, xs) =
      case xs of
        x :: xs' => foldLi f (f (a, x), xs')
      | []       => a


    fun toList xs = xs
  end
