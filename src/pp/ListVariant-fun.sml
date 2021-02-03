(**
 * In this implementation of VARIANT, the variants are stored in an
 * association list keyed by version.
 *)
functor ListVariant(Version : VERSION) :>
  VARIANT
    where type version = Version.version =
  struct
    type version = Version.version
    structure Version = Version

    fun v1 <  v2 = case Version.compare (v1, v2) of LESS => true | _ => false
    fun v1 <= v2 = case Version.compare (v1, v2) of GREATER => false | _ => true

    (**
     * The variant type is an ordered association list indexed by version.
     * The general form is `([(v_1, x_1), ..., (v_n, x_n)], x) : 'a t`,
     * for 0 <= n.  For 0 < i <= n, `x_i` is the value of the variant for a
     * version `v` such that `v_{i - 1} < v <= v_i`, where `v_0` is less than
     * every possible version, and `x`, the value of the default variant for
     * a version `v` such that `v_n` < `x`.
     *
     * The data type invariant requires that the variants are in ascending
     * order (which implies that there are no duplicates), as checked by the
     * function `valid var` indicates whether `var` is valid.
     *)
    type 'a t = (version * 'a) list * 'a

    (**
     * `inv var` indicates whether the variant `var` satisfies any data type
     * invariant.
     *)
    fun inv ((vxs, _) : 'a t) =
      let
        fun check (prev, vxs) =
          case vxs of
            []             => true
          | (v, _) :: vxs' => if prev < v then check (v, vxs') else false
      in
        case vxs of
          []             => true
        | (v, _) :: vxs' => check (v, vxs')
      end
    val _ = inv  (* silence any unused warning *)


    fun default d = ([], d)

    fun variant var =
      let
        val () =
          if inv var
          then ()
          else raise Fail "variants must be specified in ascending order"
      in
        var
      end


    fun versions (vxs, _) = List.map (fn (v, _) => v) vxs

    fun values var = var

    val value : version option -> 'a t -> 'a =
      fn
        NONE     => (fn (_, d) => d)
      | SOME ver =>
          let
            fun findVal (vxs, d) =
              case vxs of
                []             => d
              | (v, x) :: vxs' => if ver <= v then x else findVal (vxs', d)
          in
            findVal
          end


    (**
     * Merging versions with the same value
     *)

    type 'a same = 'a * 'a -> bool

    fun prepend same (vx as (_, x), var as (vxs, d)) =
      let
        val xNext =
          case vxs of
            []              => d
          | (_, xNext) :: _ => xNext
      in
        if same (xNext, x) then var else (vx :: vxs, d)
      end


    (**
     * Split function
     *)

    fun split (same1, same2) (vxs, (d1, d2)) =
      (
        foldl (prepend same1) ([], d1) (ListExtras.revMap (fn (v, (x1, _)) => (v, x1)) vxs),
        foldl (prepend same2) ([], d2) (ListExtras.revMap (fn (v, (_, x2)) => (v, x2)) vxs)
      )


    (**
     * Map functions
     *)

    fun mapSnd f (a, b) = (a, f b)
    fun curry f a b = f (a, b)

    fun map same f (vxs, d) = foldl (prepend same) ([], f d) (ListExtras.revMap (mapSnd f) vxs)

    fun fold same f (b, accVar) = map same (curry f b) accVar

    fun foldmap (accSame, cSame) f =
      let
        fun notSame _ = false
      in
        split (cSame, accSame) o fold notSame f
      end


    (* Use types to distinguish lower and upper bounds because
     * the value represented by `NONE` depends on the type of bound.
     * Nothing more general than the following is needed.
     *)
    datatype lower_bound = LB of version option
    datatype upper_bound = UB of version option

    fun lessThan (LB lb, UB ub) =
      case (lb, ub) of
        (NONE,   _)      => true
      | (_,      NONE)   => true
      | (SOME l, SOME u) => l < u


    (**
     * The 'frame' is a version interval of interest and is represented by an
     * optional lower bound and an optional upper bound.
     *   - If the lower bound is `NONE`, the interval is unbounded below.
     *   - If the upper bound is `NONE`, the interval is unbounded above.
     *   - If the lower bound is not `NONE`, the interval is open below.
     *   - If the upper bound is not `NONE`, the interval is closed above.
     * Therefore, the frame `(LB (SOME a), UB (SOME b))` corresponds to the
     * interval (a, b].  Given this, the variable naming convention for the
     * bounds of a frame is not `(min, max)` but `(prevMax, max)`.  When
     * reading the code, 'prevMax' can be read as 'min' whilst noting that
     * it is not in the interval.
     *)
    type frame = lower_bound * upper_bound

    fun frameInv (prevMax, max) = lessThan (prevMax, max)
    val _ = frameInv  (* silence any unused warning *)

    val unboundedFrame = (LB NONE, UB NONE)


    (**
     * Restricting a variant to a frame
     *)

    local
      fun prependRestInFrame same res framePrevMax (vMax, xMax, rvxs) =
        let
          fun restInFrame res = prependRestInFrame same res framePrevMax

          val max = UB (SOME vMax)
          fun prependRes () = prepend same ((vMax, xMax), res)
        in
          if lessThan (framePrevMax, max)
          then
            case rvxs of
              []              => prependRes ()
            | (v, x) :: rvxs' => restInFrame (prependRes ()) (v, x, rvxs')
          else
            res
        end
    in
      fun prependInFrame same res (framePrevMax, vMax) (vxs, d) =
        let
          val frameMax = UB (SOME vMax)

          fun firstInFrame (xMax, rvxs) =
            case rvxs of
              []              => prepend same ((vMax, xMax), res)
            | (v, x) :: rvxs' => checkInFrame xMax (v, x, rvxs')

          and checkInFrame xMax (v, x, rvxs) =
            let
              val prevMax = LB (SOME v)
            in
              if lessThan (prevMax, frameMax)
              then restInFrame (prepend same ((vMax, xMax), res)) (v, x, rvxs)
              else firstInFrame (x, rvxs)
            end

          and restInFrame res = prependRestInFrame same res framePrevMax
        in
          firstInFrame (d, rev vxs)
        end

      fun initialToPrevMax same framePrevMax (vxs, d) =
        let
          fun restInFrame res = prependRestInFrame same res framePrevMax

          val res = ([], d)
          val rvxs = rev vxs
        in
          case rvxs of
            []              => res
          | (v, x) :: rvxs' => restInFrame res (v, x, rvxs')
        end
    end

    (*
     * Cases
     *
     *                                                      
     *     d ---------------------------------------------------------------->
     *                         |                      |
     *                    framePrevMax             frameMax
     *
     *
     *                  v1
     *     x1 --------->| d ------------------------------------------------->
     *                         |                      |
     *                    framePrevMax             frameMax
     *
     *
     *                                     v1
     *     x1 ---------------------------->| d ------------------------------>
     *                         |                      |
     *                    framePrevMax             frameMax
     *
     *
     *                  v1                 v2
     *     x1 --------->| x2 ------------->| d ------------------------------>
     *                         |                      |
     *                    framePrevMax             frameMax
     *
     *
     *                                                      v1
     *     x1 --------------------------------------------->| d ------------->
     *                         |                      |
     *                    framePrevMax             frameMax
     *
     *
     *                  v1                                  v2
     *     x1 --------->| x2 ------------------------------>| d ------------->
     *                         |                      |
     *                    framePrevMax             frameMax
     *
     *
     *                                     v1               v2
     *     x1 ---------------------------->| x2 ----------->| d ------------->
     *                         |                      |
     *                    framePrevMax             frameMax
     *
     *
     *                  v1                v2                v3
     *     x1 --------->| x2 ------------>| x3 ------------>| d-------------->
     *                         |                      |
     *                    framePrevMax             frameMax
     *
     *)
    fun map1 (same : 'a same) (frame : frame) (f : frame -> 'b -> 'a t) ((vxs, d) : 'b t) : 'a t =
      let
        val (framePrevMax, frameMax) = frame

        fun firstInFrame (xMax, rvxs) =
          case rvxs of
            []              => f (framePrevMax, frameMax) xMax
          | (v, x) :: rvxs' => checkInFrame xMax (v, x, rvxs')

        and checkInFrame xMax (v, x, rvxs) =
          let
            val prevMax = LB (SOME v)
            fun prependRes () =
              (* require `lessThan (prevMax, frameMax)` *)
              initialToPrevMax same prevMax (f (prevMax, frameMax) xMax)
          in
            if lessThan (prevMax, frameMax)
            then restInFrame (prependRes ()) (v, x, rvxs)
            else firstInFrame (x, rvxs)
          end

        and restInFrame res (vMax, xMax, rvxs) =
          let
            val max = UB (SOME vMax)
            fun prependRes prevMax =
              (* require `lessThan (prevMax, max)` *)
              prependInFrame same res (prevMax, vMax) (f (prevMax, max) xMax)
          in
            if lessThan (framePrevMax, max)
            then
              case rvxs of
                []              => prependRes framePrevMax
              | (v, x) :: rvxs' =>
                  (* `prependRes` requires `lessThan (LB (SOME v), max)`
                   * which is satisfied because `v < vMax` by invariant. *)
                  restInFrame (prependRes (LB (SOME v))) (v, x, rvxs')
            else
              res
          end
      in
        firstInFrame (d, rev vxs)
      end


    fun map2 (same : 'a same) (frame : frame) (f : frame -> 'b * 'c -> 'a t) ((vxs1, d1) : 'b t, (vxs2, d2) : 'c t) : 'a t =
      let
        val (framePrevMax, frameMax) = frame

        fun firstInFrame (xMax as (x1Max, x2Max), rvxs1, rvxs2) =
          case (rvxs1, rvxs2) of
            ([],                 [])                 => f (framePrevMax, frameMax) xMax
          | ((v1, x1) :: rvxs1', [])                 => checkInFrame xMax (v1, (x1, x2Max), rvxs1', rvxs2)
          | ([],                 (v2, x2) :: rvxs2') => checkInFrame xMax (v2, (x1Max, x2), rvxs1, rvxs2')
          | ((v1, x1) :: rvxs1', (v2, x2) :: rvxs2') =>
              case Version.compare (v1, v2) of
                GREATER => checkInFrame xMax (v1, (x1,    x2Max), rvxs1', rvxs2)
              | EQUAL   => checkInFrame xMax (v1, (x1,    x2),    rvxs1', rvxs2')
              | LESS    => checkInFrame xMax (v2, (x1Max, x2),    rvxs1,  rvxs2')

        and checkInFrame xMax (v, x, rvxs1, rvxs2) =
          let
            val prevMax = LB (SOME v)
            fun prependRes () =
              (* require `lessThan (prevMax, frameMax)` *)
              initialToPrevMax same prevMax (f (prevMax, frameMax) xMax)

          in
            if lessThan (prevMax, frameMax)
            then restInFrame (prependRes ()) (v, x, rvxs1, rvxs2)
            else firstInFrame (x, rvxs1, rvxs2)
          end

        and restInFrame res (vMax, xMax as (x1Max, x2Max), rvxs1, rvxs2) =
          let
            val max = UB (SOME vMax)
            fun prependRes prevMax =
              (* require `lessThan (prevMax, max)` *)
              prependInFrame same res (prevMax, vMax) (f (prevMax, max) xMax)
          in
            if lessThan (framePrevMax, max)
            then
              case (rvxs1, rvxs2) of
                ([],                 [])                 => prependRes framePrevMax
              | ((v1, x1) :: rvxs1', [])                 => restInFrame (prependRes (LB (SOME v1))) (v1, (x1,    x2Max), rvxs1', rvxs2)
              | ([],                 (v2, x2) :: rvxs2') => restInFrame (prependRes (LB (SOME v2))) (v2, (x1Max, x2),    rvxs1,  rvxs2')
              | ((v1, x1) :: rvxs1', (v2, x2) :: rvxs2') =>
                  case Version.compare (v1, v2) of
                    GREATER => restInFrame (prependRes (LB (SOME v1))) (v1, (x1,    x2Max), rvxs1', rvxs2)
                  | EQUAL   => restInFrame (prependRes (LB (SOME v1))) (v1, (x1,    x2),    rvxs1', rvxs2')
                  | LESS    => restInFrame (prependRes (LB (SOME v2))) (v2, (x1Max, x2),    rvxs1,  rvxs2')
            else
              res
          end
      in
        firstInFrame ((d1, d2), rev vxs1, rev vxs2)
      end


    (**
     * Join function
     *)

    fun join same = map2 same unboundedFrame (fn _ => default)


    (**
     * Fold functions
     *
     * Straightforward implementations in terms of `map2`.
     *)

    fun fold1 accSame frame f =
      let
        fun f' frame (b, acc) = f frame (b, default acc)
      in
        map2 accSame frame f'
      end


    fun foldmap1 (accSame, cSame) frame f =
      let
        fun notSame _ = false  
        fun f' frame = join notSame o f frame
      in
        split (cSame, accSame) o fold1 notSame frame f'
      end


    (**
     * List functions
     *)

    structure List =
      struct
        fun all frame (p : frame -> 'a -> bool t) (xs : 'a list) : bool t =
          let
            fun step res xs =
              case xs of
                x :: xs' => (
                  case p frame x of
                    var as ([], false) => var  (* check common case for efficiency *)
                  | var                =>
                      case map2 (op =) frame (fn _ => fn (a, b) => default (a andalso b)) (var, res) of
                        res' as ([], false) => res'  (* short circuit *)
                      | res'                => step res' xs'
                )
              | []       => res
          in
            step ([], true) xs
          end
      end

  end

