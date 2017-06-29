structure GtkBox :>
  GTK_BOX
    where type 'a class = 'a GtkBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t
    where type pack_type_t = GtkPackType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_box_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_box_new") (GtkOrientation.PolyML.cVal &&> GInt.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val getHomogeneous_ = call (getSymbol "gtk_box_get_homogeneous") (GtkBoxClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSpacing_ = call (getSymbol "gtk_box_get_spacing") (GtkBoxClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val packEnd_ =
        call (getSymbol "gtk_box_pack_end")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GUInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val packStart_ =
        call (getSymbol "gtk_box_pack_start")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GUInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val queryChildPacking_ =
        call (getSymbol "gtk_box_query_child_packing")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cRef
             &&> GBool.PolyML.cRef
             &&> GUInt.PolyML.cRef
             &&> GtkPackType.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val reorderChild_ =
        call (getSymbol "gtk_box_reorder_child")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setChildPacking_ =
        call (getSymbol "gtk_box_set_child_packing")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GtkPackType.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setHomogeneous_ = call (getSymbol "gtk_box_set_homogeneous") (GtkBoxClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSpacing_ = call (getSymbol "gtk_box_set_spacing") (GtkBoxClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type pack_type_t = GtkPackType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new orientation spacing = (GtkOrientation.FFI.withVal &&&> GInt.FFI.withVal ---> GtkBoxClass.FFI.fromPtr false) new_ (orientation & spacing)
    fun getHomogeneous self = (GtkBoxClass.FFI.withPtr ---> GBool.FFI.fromVal) getHomogeneous_ self
    fun getSpacing self = (GtkBoxClass.FFI.withPtr ---> GInt.FFI.fromVal) getSpacing_ self
    fun packEnd self child expand fill padding =
      (
        GtkBoxClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> I
      )
        packEnd_
        (
          self
           & child
           & expand
           & fill
           & padding
        )
    fun packStart self child expand fill padding =
      (
        GtkBoxClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> I
      )
        packStart_
        (
          self
           & child
           & expand
           & fill
           & padding
        )
    fun queryChildPacking self child =
      let
        val expand
         & fill
         & padding
         & packType
         & () =
          (
            GtkBoxClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GBool.FFI.withRefVal
             &&&> GBool.FFI.withRefVal
             &&&> GUInt.FFI.withRefVal
             &&&> GtkPackType.FFI.withRefVal
             ---> GBool.FFI.fromVal
                   && GBool.FFI.fromVal
                   && GUInt.FFI.fromVal
                   && GtkPackType.FFI.fromVal
                   && I
          )
            queryChildPacking_
            (
              self
               & child
               & GBool.null
               & GBool.null
               & GUInt.null
               & GtkPackType.null
            )
      in
        (
          expand,
          fill,
          padding,
          packType
        )
      end
    fun reorderChild self child position =
      (
        GtkBoxClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        reorderChild_
        (
          self
           & child
           & position
        )
    fun setChildPacking self child expand fill padding packType =
      (
        GtkBoxClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GtkPackType.FFI.withVal
         ---> I
      )
        setChildPacking_
        (
          self
           & child
           & expand
           & fill
           & padding
           & packType
        )
    fun setHomogeneous self homogeneous = (GtkBoxClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setSpacing self spacing = (GtkBoxClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setSpacing_ (self & spacing)
    local
      open Property
    in
      val homogeneousProp =
        {
          get = fn x => get "homogeneous" boolean x,
          set = fn x => set "homogeneous" boolean x
        }
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x
        }
    end
  end
