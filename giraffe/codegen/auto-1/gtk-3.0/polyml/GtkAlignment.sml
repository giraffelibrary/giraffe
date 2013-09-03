structure GtkAlignment :>
  GTK_ALIGNMENT
    where type 'a class_t = 'a GtkAlignmentClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_alignment_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgtk "gtk_alignment_new")
          (
            FFI.PolyML.Float.VAL
             &&> FFI.PolyML.Float.VAL
             &&> FFI.PolyML.Float.VAL
             &&> FFI.PolyML.Float.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val getPadding_ =
        call (load_sym libgtk "gtk_alignment_get_padding")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt32.REF
             &&> FFI.PolyML.UInt32.REF
             &&> FFI.PolyML.UInt32.REF
             &&> FFI.PolyML.UInt32.REF
             --> FFI.PolyML.VOID
          )
      val set_ =
        call (load_sym libgtk "gtk_alignment_set")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Float.VAL
             &&> FFI.PolyML.Float.VAL
             &&> FFI.PolyML.Float.VAL
             &&> FFI.PolyML.Float.VAL
             --> FFI.PolyML.VOID
          )
      val setPadding_ =
        call (load_sym libgtk "gtk_alignment_set_padding")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt32.VAL
             &&> FFI.PolyML.UInt32.VAL
             &&> FFI.PolyML.UInt32.VAL
             &&> FFI.PolyML.UInt32.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkAlignmentClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new xalign yalign xscale yscale =
      (
        FFI.Float.withVal
         &&&> FFI.Float.withVal
         &&&> FFI.Float.withVal
         &&&> FFI.Float.withVal
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
             &&&> FFI.UInt32.withRefVal
             &&&> FFI.UInt32.withRefVal
             &&&> FFI.UInt32.withRefVal
             &&&> FFI.UInt32.withRefVal
             ---> FFI.UInt32.fromVal
                   && FFI.UInt32.fromVal
                   && FFI.UInt32.fromVal
                   && FFI.UInt32.fromVal
                   && I
          )
            getPadding_
            (
              self
               & 0
               & 0
               & 0
               & 0
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
         &&&> FFI.Float.withVal
         &&&> FFI.Float.withVal
         &&&> FFI.Float.withVal
         &&&> FFI.Float.withVal
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
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
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
