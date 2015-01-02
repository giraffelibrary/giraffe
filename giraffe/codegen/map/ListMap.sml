functor ListMap (Key : EQ_KEY) :> MAP where type key = Key.key =
  struct
    type key = Key.key
    type 'a maplet = key * 'a

    type 'a t = 'a maplet list


    val empty = []
    fun singleton x = [x]


    fun extractMaplet kFind xs =
      let
        fun aux ys xs =
          case xs of
            (x as (k, d)) :: xs' =>
              if Key.eq (k, kFind)
              then SOME (ys, d, xs')
              else aux (x :: ys) xs'
          | []                   => NONE
      in
        aux [] xs
      end


    fun insertMap g f ((k, dNew), xs) =
      case extractMaplet k xs of
        SOME (ys, dOld, xs') =>
          let
            val (acc, d') = f (dNew, dOld)
          in
            (acc, (k, d') :: List.revAppend (ys, xs'))
          end
      | NONE                 =>
          let
            val (acc, d') = g dNew
          in
            (acc, (k, d') :: xs)
          end

    fun insert g f = #2 o insertMap (D o g) (D o f)


    fun delete (k, xs) =
      case extractMaplet k xs of
        SOME (ys, d, xs') => (d, List.revAppend (ys, xs'))
      | NONE              => raise Unchanged


    fun update k f xs =
      case extractMaplet k xs of
        SOME (ys, d, xs') => (k, f d) :: List.revAppend (ys, xs')
      | NONE              => raise Unchanged


    fun lookup xs kFind =
      let
        fun aux xs =
          case xs of
            (k, d) :: xs' =>
              if Key.eq (k, kFind)
              then SOME d
              else aux xs'
          | []            => NONE
      in
        aux xs
      end


    val size = List.length


    fun map f =
      let
        fun aux xs =
          case xs of
            (k, d) :: xs' => (k, f d) :: aux xs'
          | []            => []
      in
        aux
      end

    fun mapi f =
      let
        fun aux xs =
          case xs of
            (x as (k, _)) :: xs' => (k, f x) :: aux xs'
          | []                   => []
      in
        aux
      end


    fun app f =
      let
        fun aux xs =
          case xs of
            (_, d) :: xs' => (f d; aux xs')
          | []            => ()
      in
        aux
      end

    fun appi f =
      let
        fun aux xs =
          case xs of
            x :: xs' => (f x; aux xs')
          | []       => ()
      in
        aux
      end


    fun fromList xs = foldl (insert I (fn _ => raise Domain)) empty xs

    fun toList xs = xs
  end
