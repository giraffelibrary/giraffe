structure GtkAlignment :>
  GTK_ALIGNMENT
    where type 'a class = 'a GtkAlignmentClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_alignment_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgtk "gtk_alignment_new")
          (
            FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val getPadding_ =
        call (load_sym libgtk "gtk_alignment_get_padding")
          (
            GtkAlignmentClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cRef
             &&> FFI.UInt.PolyML.cRef
             &&> FFI.UInt.PolyML.cRef
             &&> FFI.UInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val set_ =
        call (load_sym libgtk "gtk_alignment_set")
          (
            GtkAlignmentClass.PolyML.cPtr
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setPadding_ =
        call (load_sym libgtk "gtk_alignment_set_padding")
          (
            GtkAlignmentClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
    end
    type 'a class = 'a GtkAlignmentClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
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
            GtkAlignmentClass.C.withPtr
             &&&> FFI.UInt.C.withRefVal
             &&&> FFI.UInt.C.withRefVal
             &&&> FFI.UInt.C.withRefVal
             &&&> FFI.UInt.C.withRefVal
             ---> FFI.UInt.C.fromVal
                   && FFI.UInt.C.fromVal
                   && FFI.UInt.C.fromVal
                   && FFI.UInt.C.fromVal
                   && I
          )
            getPadding_
            (
              self
               & FFI.UInt.null
               & FFI.UInt.null
               & FFI.UInt.null
               & FFI.UInt.null
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
        GtkAlignmentClass.C.withPtr
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
        GtkAlignmentClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
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
