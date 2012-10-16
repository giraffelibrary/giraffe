structure HTextTree :> H_TEXT_TREE =
  struct

    datatype t =
      Empty
    | Space  of int
    | String of string
    | Char   of char
    | Seq    of t list


    (*
     * Constructors
     *)
    val empty = Empty
    val sp    = Space
    val str   = String
    val chr   = Char
    val seq   = Seq


    (*
     * Derived constructors
     *)
    val concat = seq o map str


    (*
     * Predicates
     *)
    val rec isEmpty =
      fn
        Empty    => true
      | Space n  => n = 0
      | String s => s = ""
      | Char _   => false
      | Seq ts   => List.all isEmpty ts


    (*
     * Operations
     *)

    (* size *)
    fun size t =
      let
        fun addSize (t, acc) =
          case t of
            Empty    => 0
          | Space n  => acc + n
          | String s => acc + String.size s
          | Char _   => acc + 1
          | Seq ts   => foldl addSize acc ts
      in
        addSize (t, 0)
      end

    (* app *)
    local
      (* `max` can be any value greater than 0.  The value should
       * be large enough to minimize recursion in `appSpaces`.
       * In general, this is application dependent.  A value of
       * 160 is used as this is double the width of a standard
       * text document, so unlikely to be exceeded. *)
      val max = 160
      val spaces = CharVector.tabulate (max, fn _ => #" ")
      fun appSpaces f n =
        if 0 < n
        then
          if n <= max
          then f (String.extract (spaces, 0, SOME n))
          else (f spaces; appSpaces f (n - max))
        else
          ()
    in
      fun app f =
        fn
          Empty    => ()
        | Space n  => appSpaces f n
        | String s => f s
        | Char c   => f (Char.toString c)
        | Seq ts   => List.app (app f) ts
    end

    (* toStrings *)
    fun toStrings1 (t, acc) =
      case t of
        Empty    => acc
      | Space n  => CharVector.tabulate (n, fn _ => #" ") :: acc
      | String s => s :: acc
      | Char c   => Char.toString c :: acc
      | Seq ts   => foldr toStrings1 acc ts

    and toStrings t = toStrings1 (t, [])

  end
