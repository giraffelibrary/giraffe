structure GtkAspectFrame :>
  GTK_ASPECT_FRAME
    where type 'a class = 'a GtkAspectFrameClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_aspect_frame_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_aspect_frame_new")
          (
            Utf8.PolyML.cInOptPtr
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val set_ =
        call (getSymbol "gtk_aspect_frame_set")
          (
            GtkAspectFrameClass.PolyML.cPtr
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
    end
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
