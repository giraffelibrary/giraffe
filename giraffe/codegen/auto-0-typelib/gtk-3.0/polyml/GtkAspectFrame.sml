structure GtkAspectFrame :>
  GTK_ASPECT_FRAME
    where type 'a class = 'a GtkAspectFrameClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_aspect_frame_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgtk "gtk_aspect_frame_new")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val set_ =
        call (load_sym libgtk "gtk_aspect_frame_set")
          (
            GtkAspectFrameClass.PolyML.cPtr
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
    end
    type 'a class = 'a GtkAspectFrameClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new label xalign yalign ratio obeyChild =
      (
        Utf8.C.withPtr
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> GtkAspectFrameClass.C.fromPtr false
      )
        new_
        (
          label
           & xalign
           & yalign
           & ratio
           & obeyChild
        )
    fun set self xalign yalign ratio obeyChild =
      (
        GtkAspectFrameClass.C.withPtr
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         &&&> FFI.Bool.C.withVal
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
      open Property
    in
      val obeyChildProp =
        {
          get = fn x => get "obey-child" boolean x,
          set = fn x => set "obey-child" boolean x
        }
      val ratioProp =
        {
          get = fn x => get "ratio" float x,
          set = fn x => set "ratio" float x
        }
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x
        }
      val yalignProp =
        {
          get = fn x => get "yalign" float x,
          set = fn x => set "yalign" float x
        }
    end
  end
