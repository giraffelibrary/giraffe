(* Copyright (C) 2012-2013, 2017-2018, 2020-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Property :>
  PROPERTY
    where type type_t = GObjectType.t
    where type value_v = GObjectValueRecord.C.v
    where type 'a object_class = 'a GObjectObjectClass.class
    where type 'a binding_class = 'a GObjectBindingClass.class =
  struct
    val getProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_get_property" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )

    val setProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_set_property" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )

    val bindProperty_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_object_bind_property" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectBindingFlags.FFI.val_
               -> GObjectBindingClass.FFI.non_opt GObjectBindingClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )

    val bindPropertyFull_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7
         & x8
         & x9 =>
          (
            _import "mlton_g_object_bind_property_with_closures" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectBindingFlags.FFI.val_
               * GObjectClosureRecord.FFI.opt GObjectClosureRecord.FFI.p
               * GObjectClosureRecord.FFI.opt GObjectClosureRecord.FFI.p
               -> GObjectBindingClass.FFI.non_opt GObjectBindingClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )

    type type_t = GObjectType.t
    type value_v = GObjectValueRecord.C.v
    type 'a object_class = 'a GObjectObjectClass.class
    type 'a binding_class = 'a GObjectBindingClass.class

    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
    in
      fun getProperty self (propertyName, value) =
        call getProperty_
          (
            GObjectObjectClass.toBase self
             & propertyName
             & value
          )
    end

    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
    in
      fun setProperty self (propertyName, value) =
        call setProperty_
          (
            GObjectObjectClass.toBase self
             & propertyName
             & value
          )
    end

    type ('object_class, 'get, 'set, 'init) t =
      {
        name  : string,
        gtype : unit -> type_t,
        get   : 'object_class -> GObjectValueRecord.C.v -> 'get,
        set   : 'object_class -> GObjectValueRecord.C.v -> 'set,
        init  :                  GObjectValueRecord.C.v -> 'init
      }

    fun conv f {name, gtype, get, set, init} =
      {name = name, gtype = gtype, get = get o f, set = set o f, init = init}

    fun get {name, gtype, get, ...} object =
      let
        val value = GObjectValue.new ()
        val () = GObjectValue.init value (gtype ())
        val () = getProperty object (name, value)
      in
        (GObjectValueRecord.FFI.withPtr false ---> I) (get object) value ()
      end

    fun set {name, gtype, set, ...} x object =
      let
        val value = GObjectValue.new ()
        val () = GObjectValue.init value (gtype ())
        val () = (GObjectValueRecord.FFI.withPtr false ---> I) (set object) value x
        val () = setProperty object (name, value)
      in
        ()        
      end

    type 'object_class init_t =
      {
        name : string,
        init : GObjectValueRecord.C.v -> unit
      }

    fun init {name, gtype, init, ...} x =
      {
        name = name,
        init = fn v => (ValueAccessor.C.init v (gtype ()); init v x)
      }

    fun initName {name, ...} = name
    fun initValue {init, ...} v = init v

    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectBindingFlags.FFI.withVal
         ---> GObjectBindingClass.FFI.fromPtr false
    in
      fun bindProperty
        (
          source,
          sourceProperty,
          target,
          targetProperty,
          flags
        ) =
        call bindProperty_
          (
            GObjectObjectClass.toBase source
             & sourceProperty
             & GObjectObjectClass.toBase target
             & targetProperty
             & flags
          )
    end

    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectBindingFlags.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withOptPtr false
         &&&> GObjectClosureRecord.FFI.withOptPtr false
         ---> GObjectBindingClass.FFI.fromPtr false
    in
      fun bindPropertyFull
        (
          source,
          sourceProperty,
          target,
          targetProperty,
          flags,
          transformTo,
          transformFrom
        ) =
        call bindPropertyFull_
          (
            GObjectObjectClass.toBase source
             & sourceProperty
             & GObjectObjectClass.toBase target
             & targetProperty
             & flags
             & transformTo
             & transformFrom
          )
    end

    fun bind
      (
        source,
        sourceProperty,
        target,
        targetProperty,
        syncOnCreate
      ) =
        bindProperty
          (
            source,
            #name sourceProperty,
            target,
            #name targetProperty,
            let
              open GObjectBindingFlags
            in
              flags [
                flags (if syncOnCreate then [SYNC_CREATE] else [])
              ]
            end
          )

    fun bindBidir
      (
        source,
        sourceProperty,
        target,
        targetProperty,
        syncOnCreate
      ) =
        bindProperty
          (
            source,
            #name sourceProperty,
            target,
            #name targetProperty,
            let
              open GObjectBindingFlags
            in
              flags [
                BIDIRECTIONAL,
                flags (if syncOnCreate then [SYNC_CREATE] else [])
              ]
            end
          )

    fun bindInvertBool
      (
        source,
        sourceProperty,
        target,
        targetProperty,
        syncOnCreate
      ) =
        bindProperty
          (
            source,
            #name sourceProperty,
            target,
            #name targetProperty,
            let
              open GObjectBindingFlags
            in
              flags [
                INVERT_BOOLEAN,
                flags (if syncOnCreate then [SYNC_CREATE] else [])
              ]
            end
          )

    fun bindBidirInvertBool
      (
        source,
        sourceProperty,
        target,
        targetProperty,
        syncOnCreate
      ) =
        bindProperty
          (
            source,
            #name sourceProperty,
            target,
            #name targetProperty,
            let
              open GObjectBindingFlags
            in
              flags [
                BIDIRECTIONAL,
                INVERT_BOOLEAN,
                flags (if syncOnCreate then [SYNC_CREATE] else [])
              ]
            end
          )

    fun bindFull
      (
        source,
        sourceProperty,
        target,
        targetProperty,
        syncOnCreate,
        convertToFun
      ) =
        let
          local
            open ClosureMarshal
          in
            val marshaller =
              get 0w1 GObjectValueRecord.t
               &&&> get 0w2 GObjectValueRecord.t
               ---> set 0w2 GObjectValueRecord.t && ret boolean
          end

          fun convert (fromValue & toValue) =
            let
              val from =
                (GObjectValueRecord.FFI.withPtr false ---> I)
                  (#get sourceProperty source)
                  fromValue
                  ()
              val to = convertToFun from
              val () =
                (GObjectValueRecord.FFI.withPtr false ---> I)
                  (#set targetProperty target)
                  toValue
                  to
            in
              toValue & true
            end
          val transformTo = SOME (GObjectClosure.new (marshaller, convert))
          val transformFrom = NONE
        in
          bindPropertyFull
            (
              source,
              #name sourceProperty,
              target,
              #name targetProperty,
              let
                open GObjectBindingFlags
              in
                flags [
                  flags (if syncOnCreate then [SYNC_CREATE] else [])
                ]
              end,
              transformTo,
              transformFrom
            )
        end

    fun bindFullBidir
      (
        source,
        sourceProperty,
        target,
        targetProperty,
        syncOnCreate,
        convertToFun,
        convertFromFun
      ) =
        let
          local
            open ClosureMarshal
          in
            val marshaller =
              get 0w1 GObjectValueRecord.t
               &&&> get 0w2 GObjectValueRecord.t
               ---> set 0w2 GObjectValueRecord.t && ret boolean
          end

          fun convertTo (fromValue & toValue) =
            let
              val from =
                (GObjectValueRecord.FFI.withPtr false ---> I)
                  (#get sourceProperty source)
                  fromValue
                  ()
              val to = convertToFun from
              val () =
                (GObjectValueRecord.FFI.withPtr false ---> I)
                  (#set targetProperty target)
                  toValue
                  to
            in
              toValue & true
            end

          fun convertFrom (fromValue & toValue) =
            let
              val from =
                (GObjectValueRecord.FFI.withPtr false ---> I)
                  (#get targetProperty target)
                  fromValue
                  ()
              val to = convertFromFun from
              val () =
                (GObjectValueRecord.FFI.withPtr false ---> I)
                  (#set sourceProperty source)
                  toValue
                  to
            in
              toValue & true
            end
          val transformTo = SOME (GObjectClosure.new (marshaller, convertTo))
          val transformFrom = SOME (GObjectClosure.new (marshaller, convertFrom))
        in
          bindPropertyFull
            (
              source,
              #name sourceProperty,
              target,
              #name targetProperty,
              let
                open GObjectBindingFlags
              in
                flags [
                  BIDIRECTIONAL,
                  flags (if syncOnCreate then [SYNC_CREATE] else [])
                ]
              end,
              transformTo,
              transformFrom
            )
        end
  end
