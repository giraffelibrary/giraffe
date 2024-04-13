(* Copyright (C) 2012-2013, 2016-2021, 2023-2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ClosureMarshal :>
  sig
    include CLOSURE_MARSHAL
      where type 'a accessor = 'a ValueAccessor.t
      where type C.value_v = GObjectValueRecord.C.v
      where type C.value_array_v = GObjectValueRecordCArrayN.C.non_opt GObjectValueRecordCArrayN.C.p
      where type C.size_v = GUInt32.C.v
  end =
  struct
    type 'a accessor = 'a ValueAccessor.t

    structure Pointer = CPointer(GMemory)
    structure Closure =
      Closure(
        val name = "GObject.Closure"
        type args =
          GObjectValueRecord.C.non_opt GObjectValueRecord.C.p
           * GObjectValueRecordCArrayN.C.non_opt GObjectValueRecordCArrayN.C.p
           * GUInt32.C.v
        type ret = unit
        val exnRetVal = ()
        val noneRetVal = ()
      )

    val getData_ =
      _import "giraffe_closure_get_data" :
        GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p -> Closure.t;

    fun log (closure2Op, closure) =
      if GiraffeDebug.logClosureEnabled ()
      then
        GiraffeDebug.logClosure2
          {
            closure2Op  = closure2Op,
            closureAddr = GObjectClosureRecord.C.Pointer.toString closure
          }
      else
        ()

    (* The closure called in `dispatch` and `destroyNotify` should catch any
     * exceptions but we still handle exceptions for unforeseen reasons to
     * ensure that they are reported and control returns from the callback.
     *)
    fun dispatch (closure, v, size, vs, _, _) = (
      log (GiraffeDebug.C2DispatchEnter, closure);
      Closure.call (getData_ closure) (v, vs, size)
       before log (GiraffeDebug.C2DispatchLeave, closure)
    ) handle e => app print [exnMessage e, "\n"]

    fun destroyNotify (data, closure) = (
      log (GiraffeDebug.C2DestroyEnter, closure);
      Closure.free data
       before log (GiraffeDebug.C2DestroyLeave, closure)
    ) handle e => app print [exnMessage e, "\n"]

    val () =
      _export "giraffe_closure_dispatch" private :
        (
          GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p
           * GObjectValueRecord.C.non_opt GObjectValueRecord.C.p
           * GUInt32.FFI.val_
           * GObjectValueRecordCArrayN.C.non_opt GObjectValueRecordCArrayN.C.p
           * Pointer.t
           * Pointer.t
           -> unit
        ) -> unit;
        dispatch

    val () =
      _export "giraffe_closure_destroy" private :
        (
          Closure.t
           * GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p
           -> unit
        ) -> unit;
        destroyNotify

    structure C =
      struct
        type value_v = GObjectValueRecord.C.non_opt GObjectValueRecord.C.p
        type value_array_v = GObjectValueRecordCArrayN.C.non_opt GObjectValueRecordCArrayN.C.p
        type size_v = GUInt32.C.v
        fun offset vs n = GObjectValueRecordCArrayN.C.Pointer.get (vs, n)
      end

    type ('r, 'w) arg =
      {
        get  : C.value_array_v -> 'r,
        set  : C.value_array_v -> 'w -> unit,
        init : (int * (C.value_v -> unit)) list,
        last : int
      }

    type ('r, 'w) res =
      {
        get  : C.value_array_v * C.value_v -> 'r,
        set  : C.value_array_v * C.value_v -> 'w -> unit,
        init : (int option * (C.value_v -> unit)) list,
        last : int
      }

    type ('arg_r, 'arg_w, 'res_r, 'res_w) marshaller =
      {
        getArg   : C.value_array_v -> 'arg_r,
        setArg   : C.value_array_v -> 'arg_w -> unit,
        getRes   : C.value_array_v * C.value_v -> 'res_r,
        setRes   : C.value_array_v * C.value_v -> 'res_w -> unit,
        initPars : (C.value_v -> unit) vector,
        initRet  : C.value_v -> unit
      }

    fun (a &&&> b) =
      {
        get  = fn vs => #get a vs & #get b vs,
        set  = fn vs => fn x & y => (#set a vs x; #set b vs y),
        init = #init a @ #init b,
        last = Int.max (#last a, #last b)
      }

    fun (a &&& b) =
      {
        get  = fn vsv => #get a vsv & #get b vsv,
        set  = fn vsv => fn x & y => (#set a vsv x; #set b vsv y),
        init = #init a @ #init b,
        last = Int.max (#last a, #last b)
      }

    fun checkAscending s prev =
      let
        fun check prev =
          fn
            (n, _) :: xs =>
              if n > prev
              then check n xs
              else raise Fail ("marshaller specifies non-ascending \
                               \'" ^ s ^ "' parameter indices")
          | []             => ()
      in
        check prev
      end

    fun mergeAscending (xs, ys) =
      let
        fun merge acc (xs, ys) =
          case (xs, ys) of
            ((x as (m, _)) :: xs', (y as (n, _)) :: ys') =>
              if m < n
              then merge (x :: acc) (xs', ys)
              else if m = n
              then merge (x :: acc) (xs', ys')
              else merge (y :: acc) (xs,  ys')
          | ([],                   y :: ys')             => merge (y :: acc) ([], ys')
          | (x :: xs',             [])                   => merge (x :: acc) ([], xs')
          | ([],                   [])                   => rev acc
      in
        merge [] (xs, ys)
      end

    fun (arg ---> res) =
      {
        getArg   = #get arg,
        setArg   = #set arg,
        getRes   = #get res,
        setRes   = #set res,
        initPars =
          let
            val numPars = Int.max (#last arg, #last res) + 1
            val initIns = #init arg
            val initOuts =
              List.mapPartial (fn (SOME n, f) => SOME (n, f) | _ => NONE) (#init res)

            val () = checkAscending "in"  ~1 initIns
            val () = checkAscending "out" ~1 initOuts
            val inits = mergeAscending (initIns, initOuts)
            val r = ref inits
            exception Missing of int
            fun getNext i = (
              case ! r of
                (n, f) :: inits' => if n = i then (r := inits'; f) else raise Missing i
              | []               => raise Missing i
            ) handle
                Missing i =>
                  raise Fail (
                    concat [
                      "marshaller does not specify contiguous parameter indices: ",
                      case i of
                        0 => "instance parameter (index 0)"
                      | _ => "parameter with index " ^ Int.toString i,
                      " is missing"
                    ]
                  )
          in
            Vector.tabulate (numPars, getNext)
          end,
        initRet  =
          let
            val initRets =
              List.mapPartial (fn (NONE, f) => SOME f | _ => NONE) (#init res)
          in
            case initRets of
              []        => Fn.const ()
            | [initRet] => initRet
            | _         => raise Fail "marshaller specifies multiple return values"
          end
      }

    fun parInst t =
      {
        get  = fn vs => ValueAccessor.C.get t (C.offset vs 0),
        set  = fn vs => fn x => ValueAccessor.C.set t (C.offset vs 0) x,
        init = [(0, fn v => ValueAccessor.C.init v (ValueAccessor.C.gtype t ()))],
        last = 0
      }

    fun parIn n t =
      {
        get  = fn vs => ValueAccessor.C.get t (C.offset vs n),
        set  = fn vs => fn x => ValueAccessor.C.set t (C.offset vs n) x,
        init = [(n, fn v => ValueAccessor.C.init v (ValueAccessor.C.gtype t ()))],
        last = n
      }

    fun parOut n t =
      {
        get  = fn (vs, _) => ValueAccessor.C.get t (C.offset vs n),
        set  = fn (vs, _) => fn x => ValueAccessor.C.set t (C.offset vs n) x,
        init = [(SOME n, fn v => ValueAccessor.C.init v (ValueAccessor.C.gtype t ()))],
        last = n
      }

    fun ret t =
      {
        get  = fn (_, v) => ValueAccessor.C.get t v,
        set  = fn (_, v) => fn x => ValueAccessor.C.set t v x,
        init = [(NONE, fn v => ValueAccessor.C.init v (ValueAccessor.C.gtype t ()))],
        last = ~1
      }

    val retVoid =
      {
        get  =
          fn (_, v) =>
            if not (ValueAccessor.C.isValue v)
            then ()
            else raise Fail "GIRAFFE internal error: retVoid used to get \
                            \return value of closure that has return value",
        set  =
          fn (_, v) =>
          fn () =>
            if not (ValueAccessor.C.isValue v)
            then ()
            else raise Fail "GIRAFFE internal error: retVoid used to set \
                            \return value of closure that has return value",
        init = [(NONE, fn _ => ())],
        last = ~1
      }

    fun map (mapArgR, mapArgW, mapResR, mapResW)
      {
        getArg,
        setArg,
        getRes,
        setRes,
        initPars,
        initRet
      } =
      {
        getArg   = mapArgR o getArg,
        setArg   = fn vs => setArg vs o mapArgW,
        getRes   = mapResR o getRes,
        setRes   = fn vsv => setRes vsv o mapResW,
        initPars = initPars,
        initRet  = initRet
      }

    type callback = Closure.callback

    fun makeCallback {getArg, setRes, ...} func =
      fn (v, vs, _) => setRes (vs, v) (func (getArg vs))

    fun call {setArg, getRes, initPars, initRet, ...} =
      let
        val numPars = VectorSequence.length initPars

        val (pars, ret) =
          let
            open GObjectValueRecordCArrayN
            val n = numPars + 1  (* last element is for the return value *)
            fun initValue _ p (i, init) = init (C.ArrayType.get n p i)
            fun getInit i = VectorSequence.get initPars i handle Subscript => initRet
            val p = C.ArrayType.init initValue (n, getInit)
          in
            (p, C.ArrayType.get n p numPars)
          end
      in
        fn func => fn arg =>
          let
            val () = setArg pars arg
            val () = func (ret, pars, GUInt32Type.toC (LargeInt.fromInt numPars))
            val res = getRes (pars, ret)
            val () = GObjectValueRecordCArrayN.C.ArrayType.free ~1 numPars pars
          in
            res
          end
      end

    structure FFI =
      struct
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = Closure.t
        type 'a dispatch_p = 'a Pointer.p
        type destroy_notify_p = Pointer.t

        fun withPtr f callback =
          let
            val closure = Closure.make callback
          in
            f closure
              handle
                e => (Closure.free closure; raise e)
          end
        fun withOptPtr f optCallback =
          case optCallback of
            SOME callback => withPtr f callback
          | NONE          => f Closure.null

        val dispatchPtr = _address "giraffe_closure_dispatch" private : Pointer.t;
        val destroyNotifyPtr = _address "giraffe_closure_destroy" private : Pointer.t;

        fun withDispatchPtr f () = f dispatchPtr
        fun withOptDispatchPtr f =
          fn
            true  => withDispatchPtr (f o Pointer.toOptPtr) ()
          | false => f Pointer.null

        fun withDestroyNotifyPtr f () = f destroyNotifyPtr
      end
  end
