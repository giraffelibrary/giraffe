structure GtkMisc :>
  GTK_MISC
    where type 'a class_t = 'a GtkMiscClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_misc_get_type" : unit -> GObjectType.C.val_;
    val getAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_misc_get_alignment" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Float.ref_
               * FFI.Float.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_misc_get_padding" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.ref_
               * FFI.Int32.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_misc_set_alignment" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Float.val_
               * FFI.Float.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_misc_set_padding" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkMiscClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAlignment self =
      let
        val xalign
         & yalign
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Float.withRefVal
             &&&> FFI.Float.withRefVal
             ---> FFI.Float.fromVal
                   && FFI.Float.fromVal
                   && I
          )
            getAlignment_
            (
              self
               & 0.0
               & 0.0
            )
      in
        (xalign, yalign)
      end
    fun getPadding self =
      let
        val xpad
         & ypad
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getPadding_
            (
              self
               & 0
               & 0
            )
      in
        (xpad, ypad)
      end
    fun setAlignment self xalign yalign =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Float.withVal
         &&&> FFI.Float.withVal
         ---> I
      )
        setAlignment_
        (
          self
           & xalign
           & yalign
        )
    fun setPadding self xpad ypad =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> I
      )
        setPadding_
        (
          self
           & xpad
           & ypad
        )
    local
      open Property
    in
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x
        }
      val xpadProp =
        {
          get = fn x => get "xpad" int x,
          set = fn x => set "xpad" int x
        }
      val yalignProp =
        {
          get = fn x => get "yalign" float x,
          set = fn x => set "yalign" float x
        }
      val ypadProp =
        {
          get = fn x => get "ypad" int x,
          set = fn x => set "ypad" int x
        }
    end
  end
