structure GtkAspectFrame :>
  GTK_ASPECT_FRAME
    where type 'a class = 'a GtkAspectFrameClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_aspect_frame_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_gtk_aspect_frame_new" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               * GBool.FFI.val_
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val set_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_aspect_frame_set" :
              GtkAspectFrameClass.FFI.non_opt GtkAspectFrameClass.FFI.p
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class = 'a GtkAspectFrameClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        label,
        xalign,
        yalign,
        ratio,
        obeyChild
      ) =
      (
        Utf8.FFI.withOptPtr 0
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> GtkAspectFrameClass.FFI.fromPtr false
      )
        new_
        (
          label
           & xalign
           & yalign
           & ratio
           & obeyChild
        )
       before Utf8.FFI.touchOptPtr label
    fun set
      self
      (
        xalign,
        yalign,
        ratio,
        obeyChild
      ) =
      (
        GtkAspectFrameClass.FFI.withPtr false
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        set_
        (
          self
           & xalign
           & yalign
           & ratio
           & obeyChild
        )
    local
      open ValueAccessor
    in
      val obeyChildProp =
        {
          name = "obey-child",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val ratioProp =
        {
          name = "ratio",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val xalignProp =
        {
          name = "xalign",
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
    end
  end
