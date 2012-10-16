structure VTextTree :> V_TEXT_TREE where type h = HTextTree.t =
  struct

    type h = HTextTree.t

    (* `Empty` represents no lines.
     * `Space n` represents `n` empty lines.
     *)
    datatype t =
      Empty
    | Space  of int
    | Line   of h
    | Seq    of t list


    (*
     * Constructors
     *)
    val empty = Empty
    val sp    = Space
    val line  = Line
    val seq   = Seq
    val seq1 = fn [t] => t | ts => seq ts

    val str = line o HTextTree.str
    val concat = seq o map line

    (*
     * Iteration
     *)
    structure Iter =
      struct
        type state = t list list

        (* fromText *)
        fun fromText t = [[t]]

        (* toText *)
        val rec toText =
          fn
            []                => empty
          | ts1 :: []         => seq1 ts1
          | ts1 :: ts2 :: tss => toText ((seq1 ts1 :: ts2) :: tss)

        (* getLine *)
        val rec getLine : t list list -> (h * t list list) option =
          fn
            []                 => NONE
          | [] :: tss'         => getLine tss'
          | (t :: ts') :: tss' =>
              case t of
                Empty   => getLine (ts' :: tss')
              | Space 0 => getLine (ts' :: tss')
              | Space n => SOME (HTextTree.empty, (Space (n - 1) :: ts') :: tss')
              | Line l  => SOME (l, ts' :: tss')
              | Seq ts  => getLine (ts :: ts' :: tss')

        (* isEmpty *)
        val rec isEmpty =
          fn
            []                 => true
          | [] :: tss'         => isEmpty tss'
          | (t :: ts') :: tss' =>
              case t of
                Empty   => isEmpty (ts' :: tss')
              | Space 0 => isEmpty (ts' :: tss')
              | Space _ => false
              | Line _  => false
              | Seq ts  => isEmpty (ts :: ts' :: tss')

        (* isMulti *)
        local
          fun check haveOne =
            fn
              []                 => false
            | [] :: tss'         => check haveOne tss'
            | (t :: ts') :: tss' =>
                case t of
                  Empty   => check haveOne (ts' :: tss')
                | Space 0 => check haveOne (ts' :: tss')
                | Space _ => haveOne orelse check true (ts' :: tss')
                | Line _  => haveOne orelse check true (ts' :: tss')
                | Seq ts  => check haveOne (ts :: ts' :: tss')
        in
          val isMulti = check false
        end
      end


    (*
     * Predicates
     *)

    (* isEmpty *)
    val isEmpty = Iter.isEmpty o Iter.fromText

    (* isMulti *)
    val isMulti = Iter.isMulti o Iter.fromText


    (*
     * Operations
     *)

    (* size *)
    fun size t =
      let
        fun addSize (t, a) =
          case t of
            Empty   => a
          | Space n => a + n
          | Line _  => a + 1
          | Seq ts  => foldl addSize a ts
      in
        addSize (t, 0)
      end

    (* indentWith *)
    fun indentWith p nonEmptyOnly =
      let
        val rec indent =
          fn
            Empty    => Empty    (* no lines to indent *)
          | Space 0  => Space 0  (* no lines to indent *)
          | Space n  =>
              if nonEmptyOnly
              then Space n
              else Seq (List.tabulate (n, fn _ => Line p))
          | Line h   =>
              Line (
                if HTextTree.isEmpty h andalso nonEmptyOnly
                then h
                else HTextTree.seq [p, h]
              )
          | Seq ts   => Seq (map indent ts)
      in
        if HTextTree.isEmpty p then I else indent
      end

    (* flattenWith *)
    fun flattenWith nl t =
      let
        fun aux acc tss =
          case Iter.getLine tss of
            NONE           => acc
          | SOME (h, tss') => aux (HTextTree.seq [acc, nl, h]) tss'

        val tss = [[t]]
      in
        case Iter.getLine tss of
          NONE           => HTextTree.empty
        | SOME (h, tss') => aux h tss'
      end

    (* app *)
    local
      fun repeat f n = if 0 < n then (f (); repeat f (n - 1)) else ()
    in
      fun app (nl, f) =
        fn
          Empty    => ()
        | Space n  => repeat nl n
        | Line l   => (HTextTree.app f l; nl ())
        | Seq ts   => List.app (app (nl, f)) ts
    end

    (* toStrings *)
    fun toStrings1 (t, acc) =
      case t of
        Empty    => acc
      | Space n  => List.tabulate (n, fn _ => []) @ acc
      | Line l   => HTextTree.toStrings l :: acc
      | Seq ts   => foldr toStrings1 acc ts

    and toStrings t = toStrings1 (t, [])

  end
