structure VTextTree :>
    V_TEXT_TREE
      where type h = HTextTree.t
      where type version = Variant.version
      where type frame = Variant.frame
      where type 'a variant = 'a Variant.t =
  struct

    type h = HTextTree.t

    type version = Variant.version
    type frame = Variant.frame
    type 'a variant = 'a Variant.t

    (* `Empty` represents no lines.
     * `Space n` represents `n` empty lines.
     *)
    datatype t =
      Empty
    | Space  of int
    | Line   of h
    | Seq    of t list
    | Var    of t variant


    (*
     * Constructors
     *)
    val empty = Empty
    val sp    = Space
    val line  = Line
    val seq   = Seq
    val var   = Var

    val seq1 = fn [t] => t | ts => seq ts
    val var1 = fn v => case Variant.values v of ([], t) => t | _ => var v
    val str = line o HTextTree.str
    val concat = seq o List.map line


    (*
     * Predicates
     *)

    (* isEmpty *)
    val isEmpty =
      let
        fun isEmpty1 frame =
          fn
            Empty    => Variant.default true
          | Space 0  => Variant.default true
          | Space _  => Variant.default false
          | Line _   => Variant.default false
          | Seq ts   => Variant.List.all frame isEmpty1 ts
          | Var v    => Variant.map1 (op =) frame isEmpty1 v
      in
        isEmpty1 Variant.unboundedFrame
      end


    (*
     * Operations
     *)

    (* helper functions *)
    fun map
      (tSame : t * t -> bool)
      {
        space : int -> t,
        line  : h   -> t
      }
    =
      let
        fun map1 t =
          case t of
            Empty    => t
          | Space 0  => t
          | Space n  => space n
          | Line h   => line h
          | Seq ts   => Seq (List.map map1 ts)
          | Var v    => Var (Variant.map tSame map1 v)
      in
        map1
      end

    fun fold
      (accSame : 'a * 'a -> bool)
      {
        space : int * 'a -> 'a,
        line  : h   * 'a -> 'a
      }
    =
      let
        fun fold1 frame (t, accVar : 'a variant) =
          case t of
            Empty    => accVar
          | Space n  => Variant.fold accSame space (n, accVar)
          | Line h   => Variant.fold accSame line (h, accVar)
          | Seq ts   => List.foldl (fold1 frame) accVar ts
          | Var v    => Variant.fold1 accSame frame fold1 (v, accVar)
      in
        fold1 Variant.unboundedFrame
      end

    fun mapFst f (a, b) = (f a, b)

    fun foldmap
      (
        tSame   : t * t -> bool,
        accSame : 'a * 'a -> bool
      )
      {
        space : int * 'a -> t * 'a,
        line  : h   * 'a -> t * 'a
      }
    =
      let
        fun foldmap1 frame (t, accVar : 'a variant) =
          case t of
            Empty    => (t, accVar)
          | Space 0  => (t, accVar)
          | Space n  => mapFst var1 (Variant.foldmap (accSame, tSame) space (n, accVar))
          | Line h   => mapFst var1 (Variant.foldmap (accSame, tSame) line (h, accVar))
          | Seq ts   => mapFst seq1 (ListExtras.foldmapl (foldmap1 frame) (ts, accVar))
          | Var v    => mapFst var1 (Variant.foldmap1 (accSame, tSame) frame foldmap2 (v, accVar))

        and foldmap2 frame = mapFst Variant.default o foldmap1 frame
      in
        foldmap1 Variant.unboundedFrame
      end

    (* size *)
    val addSize =
      fold
        (op =)
        {
          space  = op +,
          line   = fn (_, n) => n + 1
        }

    fun size t = addSize (t, Variant.default 0)

    (* indentWith *)
    fun indentWith hPrefix nonEmptyOnly =
      let
        fun indentSpace n =
          if nonEmptyOnly
          then Space n
          else Seq (List.tabulate (n, fn _ => Line hPrefix))

        fun indentLine hLine =
          Line (HTextTree.indentWith hPrefix nonEmptyOnly hLine)

        fun indent t =
          map
            (fn _ => false)
            {
              space = indentSpace,
              line  = indentLine
            }
            t
      in
        indent
      end

    (* indentWith1 *)
    fun indentWith1 (hPrefixFirst, hPrefixRest) nonEmptyOnly =
      let
        fun indentSpace (n, isFirst) =
          if nonEmptyOnly
          then (Space n, isFirst andalso n = 0)
          else
            if n > 0
            then (Seq (Line hPrefixFirst :: List.tabulate (n - 1, fn _ => Line hPrefixRest)), false)
            else (Empty, isFirst)

        fun indentLine (hLine, isFirst) =
          (
            Line (HTextTree.indentWith (if not isFirst then hPrefixRest else hPrefixFirst) nonEmptyOnly hLine)
          , false
          )

        fun indent t =
          let
            val (t', _) =
              foldmap
                (fn _ => false, fn _ => false)
                {
                  space = indentSpace,
                  line  = indentLine
                }
                (t, Variant.default true)
          in
            t'
          end
      in
        indent
      end

    (* versions
     *
     * In order to determine the versions that affect the result, a variant
     * is build whose value has type `unit`.  Under any form of equality,
     * two values with type `unit` will be equal, so the 'same' function
     * must return `false` to ensure that the unit variant is not collapsed
     * to a single default value. *)
    fun addVersions frame (t, accVar : unit variant) =
      case t of
        Empty    => accVar
      | Space _  => accVar
      | Line l   => HTextTree.addVersions frame (l, accVar)
      | Seq ts   => List.foldl (addVersions frame) accVar ts
      | Var v    => Variant.fold1 (fn _ => false) frame addVersions (v, accVar)

    fun versions t =
      Variant.versions (addVersions Variant.unboundedFrame (t, Variant.default ()))

    (* app *)
    local
      fun repeat f n = if 0 < n then (f (); repeat f (n - 1)) else ()
    in
      fun app optVer (nl, f) =
        fn
          Empty    => ()
        | Space n  => repeat nl n
        | Line l   => (HTextTree.app optVer f l; nl ())
        | Seq ts   => List.app (app optVer (nl, f)) ts
        | Var v    => app optVer (nl, f) (Variant.value optVer v)
    end

    (* strings *)
    fun addStrings optVer (t, acc) =
      case t of
        Empty    => acc
      | Space n  => List.tabulate (n, fn _ => []) @ acc
      | Line l   => HTextTree.strings optVer l :: acc
      | Seq ts   => foldr (addStrings optVer) acc ts
      | Var v    => addStrings optVer (Variant.value optVer v, acc)

    and strings optVer t = addStrings optVer (t, [])

  end
