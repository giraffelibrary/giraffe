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
