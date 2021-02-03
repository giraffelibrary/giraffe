structure HTextTree :>
    H_TEXT_TREE
      where type version = Variant.version
      where type frame = Variant.frame
      where type 'a variant = 'a Variant.t =
  struct

    type version = Variant.version
    type frame = Variant.frame
    type 'a variant = 'a Variant.t

    datatype t =
      Empty
    | Space  of int
    | String of string
    | Char   of char
    | Seq    of t list
    | Var    of t variant


    (*
     * Constructors
     *)
    val empty = Empty
    val sp    = Space
    val str   = String
    val chr   = Char
    val seq   = Seq
    val var   = Var


    (*
     * Derived constructors
     *)
    val seq1 = fn [t] => t | ts => seq ts
    val var1 = fn v => case Variant.values v of ([], t) => t | _ => var v
    val concat = seq o List.map str


    (*
     * Predicates
     *)
    val isEmpty =
      let
        fun isEmpty1 frame =
          fn
            Empty    => Variant.default true
          | Space n  => Variant.default (n = 0)
          | String s => Variant.default (s = "")
          | Char _   => Variant.default false
          | Seq ts   => Variant.List.all frame isEmpty1 ts
          | Var v    => Variant.map1 (op =) frame isEmpty1 v
      in
        isEmpty1 Variant.unboundedFrame
      end


    (*
     * Operations
     *)

    (* fold helper function *)
    fun fold
      {
        empty  :          ''a -> ''a,
        space  : int    * ''a -> ''a,
        string : string * ''a -> ''a,
        char   : char   * ''a -> ''a
      }
    =
      let
        fun fold1 frame (t, accVar : ''a variant) =
          case t of
            Empty    => Variant.map (op =) empty accVar
          | Space n  => Variant.fold (op =) space (n, accVar)
          | String s => Variant.fold (op =) string (s, accVar)
          | Char c   => Variant.fold (op =) char (c, accVar)
          | Seq ts   => List.foldl (fold1 frame) accVar ts
          | Var v    => Variant.fold1 (op =) frame fold1 (v, accVar)
      in
        fn (t, a) => fold1 Variant.unboundedFrame (t, Variant.default a)
      end

    (* size *)
    val addSize =
      fold
        {
          empty  = fn n => n,
          space  = op +,
          string = fn (s, n) => String.size s + n,
          char   = fn (_, n) => n + 1
        }

    fun size t = addSize (t, 0)

    (* indentWith *)
    fun indentWith prefix nonEmptyOnly =
      let
        fun addPrefix t tIsEmpty =
          if tIsEmpty andalso nonEmptyOnly
          then t
          else seq [prefix, t]

        fun indent t =
          var1 (Variant.map (fn _ => false) (addPrefix t) (isEmpty t))
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
      | String _ => accVar
      | Char _   => accVar
      | Seq ts   => List.foldl (addVersions frame) accVar ts
      | Var v    => Variant.fold1 (fn _ => false) frame addVersions (v, accVar)

    fun versions t =
      Variant.versions (addVersions Variant.unboundedFrame (t, Variant.default ()))

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
      fun app optVer f =
        fn
          Empty    => ()
        | Space n  => appSpaces f n
        | String s => f s
        | Char c   => f (Char.toString c)
        | Seq ts   => List.app (app optVer f) ts
        | Var v    => app optVer f (Variant.value optVer v)
    end

    (* toStrings *)
    fun addStrings optVer (t, acc) =
      case t of
        Empty    => acc
      | Space n  => CharVector.tabulate (n, fn _ => #" ") :: acc
      | String s => s :: acc
      | Char c   => Char.toString c :: acc
      | Seq ts   => foldr (addStrings optVer) acc ts
      | Var v    => addStrings optVer (Variant.value optVer v, acc)

    fun strings optVer t = addStrings optVer (t, [])

  end
