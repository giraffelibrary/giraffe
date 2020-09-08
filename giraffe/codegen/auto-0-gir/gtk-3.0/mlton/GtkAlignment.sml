structure GtkAlignment :>
  GTK_ALIGNMENT
    where type 'a class = 'a GtkAlignmentClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_alignment_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_alignment_new" :
              GFloat.FFI.val_
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
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
              GtkAlignmentClass.FFI.non_opt GtkAlignmentClass.FFI.p
               * GUInt.FFI.ref_
               * GUInt.FFI.ref_
               * GUInt.FFI.ref_
               * GUInt.FFI.ref_
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
              GtkAlignmentClass.FFI.non_opt GtkAlignmentClass.FFI.p
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               * GFloat.FFI.val_
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
              GtkAlignmentClass.FFI.non_opt GtkAlignmentClass.FFI.p
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class = 'a GtkAlignmentClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        xalign,
        yalign,
        xscale,
        yscale
      ) =
      (
        GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         ---> GtkAlignmentClass.FFI.fromPtr false
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
            GtkAlignmentClass.FFI.withPtr false
             &&&> GUInt.FFI.withRefVal
             &&&> GUInt.FFI.withRefVal
             &&&> GUInt.FFI.withRefVal
             &&&> GUInt.FFI.withRefVal
             ---> GUInt.FFI.fromVal
                   && GUInt.FFI.fromVal
                   && GUInt.FFI.fromVal
                   && GUInt.FFI.fromVal
                   && I
          )
            getPadding_
            (
              self
               & GUInt.null
               & GUInt.null
               & GUInt.null
               & GUInt.null
            )
      in
        (
          paddingTop,
          paddingBottom,
          paddingLeft,
          paddingRight
        )
      end
    fun set
      self
      (
        xalign,
        yalign,
        xscale,
        yscale
      ) =
      (
        GtkAlignmentClass.FFI.withPtr false
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
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
    fun setPadding
      self
      (
        paddingTop,
        paddingBottom,
        paddingLeft,
        paddingRight
      ) =
      (
        GtkAlignmentClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
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
      open ValueAccessor
    in
      val bottomPaddingProp =
        {
          name = "bottom-padding",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val leftPaddingProp =
        {
          name = "left-padding",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val rightPaddingProp =
        {
          name = "right-padding",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val topPaddingProp =
        {
          name = "top-padding",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val xalignProp =
        {
          name = "xalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val xscaleProp =
        {
          name = "xscale",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val yalignProp =
        {
          name = "yalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val yscaleProp =
        {
          name = "yscale",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
    end
  end
