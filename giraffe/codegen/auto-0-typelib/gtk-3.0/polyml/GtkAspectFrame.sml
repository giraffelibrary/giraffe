structure GtkAspectFrame :>
  GTK_ASPECT_FRAME
    where type 'a class_t = 'a GtkAspectFrameClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_aspect_frame_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgtk "gtk_aspect_frame_new")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.Float.PolyML.VAL
             &&> FFI.Float.PolyML.VAL
             &&> FFI.Float.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val set_ =
        call (load_sym libgtk "gtk_aspect_frame_set")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Float.PolyML.VAL
             &&> FFI.Float.PolyML.VAL
             &&> FFI.Float.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkAspectFrameClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new label xalign yalign ratio obeyChild =
      (
        FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
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
