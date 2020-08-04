structure GtkAlignment :>
  GTK_ALIGNMENT
    where type 'a class = 'a GtkAlignmentClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_alignment_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_alignment_new")
          (
            GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val getPadding_ =
        call (getSymbol "gtk_alignment_get_padding")
          (
            GtkAlignmentClass.PolyML.cPtr
             &&> GUInt.PolyML.cRef
             &&> GUInt.PolyML.cRef
             &&> GUInt.PolyML.cRef
             &&> GUInt.PolyML.cRef
             --> cVoid
          )
      val set_ =
        call (getSymbol "gtk_alignment_set")
          (
            GtkAlignmentClass.PolyML.cPtr
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             --> cVoid
          )
      val setPadding_ =
        call (getSymbol "gtk_alignment_set_padding")
          (
            GtkAlignmentClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             --> cVoid
          )
    end
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
      open Property
    in
      val bottomPaddingProp =
        {
          get = fn x => get "bottom-padding" uint x,
          set = fn x => set "bottom-padding" uint x,
          new = fn x => new "bottom-padding" uint x
        }
      val leftPaddingProp =
        {
          get = fn x => get "left-padding" uint x,
          set = fn x => set "left-padding" uint x,
          new = fn x => new "left-padding" uint x
        }
      val rightPaddingProp =
        {
          get = fn x => get "right-padding" uint x,
          set = fn x => set "right-padding" uint x,
          new = fn x => new "right-padding" uint x
        }
      val topPaddingProp =
        {
          get = fn x => get "top-padding" uint x,
          set = fn x => set "top-padding" uint x,
          new = fn x => new "top-padding" uint x
        }
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x,
          new = fn x => new "xalign" float x
        }
      val xscaleProp =
        {
          get = fn x => get "xscale" float x,
          set = fn x => set "xscale" float x,
          new = fn x => new "xscale" float x
        }
      val yalignProp =
        {
          get = fn x => get "yalign" float x,
          set = fn x => set "yalign" float x,
          new = fn x => new "yalign" float x
        }
      val yscaleProp =
        {
          get = fn x => get "yscale" float x,
          set = fn x => set "yscale" float x,
          new = fn x => new "yscale" float x
        }
    end
  end
