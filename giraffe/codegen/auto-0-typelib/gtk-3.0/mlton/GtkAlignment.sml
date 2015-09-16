structure GtkAlignment :>
  GTK_ALIGNMENT
    where type 'a class_t = 'a GtkAlignmentClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_alignment_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_alignment_new" :
              FFI.Float.C.val_
               * FFI.Float.C.val_
               * FFI.Float.C.val_
               * FFI.Float.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getPadding_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_alignment_get_padding" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.C.ref_
               * FFI.UInt32.C.ref_
               * FFI.UInt32.C.ref_
               * FFI.UInt32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val set_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_alignment_set" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Float.C.val_
               * FFI.Float.C.val_
               * FFI.Float.C.val_
               * FFI.Float.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setPadding_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_alignment_set_padding" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.C.val_
               * FFI.UInt32.C.val_
               * FFI.UInt32.C.val_
               * FFI.UInt32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class_t = 'a GtkAlignmentClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new xalign yalign xscale yscale =
      (
        FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         ---> GtkAlignmentClass.C.fromPtr false
      )
        new_
        (
          xalign
           & yalign
           & xscale
           & yscale
        )
    fun getPadding self =
      let
        val paddingTop
         & paddingBottom
         & paddingLeft
         & paddingRight
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.UInt32.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && FFI.UInt32.C.fromVal
                   && FFI.UInt32.C.fromVal
                   && FFI.UInt32.C.fromVal
                   && I
          )
            getPadding_
            (
              self
               & FFI.UInt32.null
               & FFI.UInt32.null
               & FFI.UInt32.null
               & FFI.UInt32.null
            )
      in
        (
          paddingTop,
          paddingBottom,
          paddingLeft,
          paddingRight
        )
      end
    fun set self xalign yalign xscale yscale =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         ---> I
      )
        set_
        (
          self
           & xalign
           & yalign
           & xscale
           & yscale
        )
    fun setPadding self paddingTop paddingBottom paddingLeft paddingRight =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        setPadding_
        (
          self
           & paddingTop
           & paddingBottom
           & paddingLeft
           & paddingRight
        )
    local
      open Property
    in
      val bottomPaddingProp =
        {
          get = fn x => get "bottom-padding" uint x,
          set = fn x => set "bottom-padding" uint x
        }
      val leftPaddingProp =
        {
          get = fn x => get "left-padding" uint x,
          set = fn x => set "left-padding" uint x
        }
      val rightPaddingProp =
        {
          get = fn x => get "right-padding" uint x,
          set = fn x => set "right-padding" uint x
        }
      val topPaddingProp =
        {
          get = fn x => get "top-padding" uint x,
          set = fn x => set "top-padding" uint x
        }
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x
        }
      val xscaleProp =
        {
          get = fn x => get "xscale" float x,
          set = fn x => set "xscale" float x
        }
      val yalignProp =
        {
          get = fn x => get "yalign" float x,
          set = fn x => set "yalign" float x
        }
      val yscaleProp =
        {
          get = fn x => get "yscale" float x,
          set = fn x => set "yscale" float x
        }
    end
  end
