structure GtkBox :>
  GTK_BOX
    where type 'a class = 'a GtkBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t
    where type pack_type_t = GtkPackType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_box_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "gtk_box_new" : GtkOrientation.C.val_ * FFI.Int.C.val_ -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;) (x1, x2)
    val getHomogeneous_ = _import "gtk_box_get_homogeneous" : GtkBoxClass.C.notnull GtkBoxClass.C.p -> FFI.Bool.C.val_;
    val getSpacing_ = _import "gtk_box_get_spacing" : GtkBoxClass.C.notnull GtkBoxClass.C.p -> FFI.Int.C.val_;
    val packEnd_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_box_pack_end" :
              GtkBoxClass.C.notnull GtkBoxClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val packStart_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_box_pack_start" :
              GtkBoxClass.C.notnull GtkBoxClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val queryChildPacking_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_box_query_child_packing" :
              GtkBoxClass.C.notnull GtkBoxClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Bool.C.ref_
               * FFI.Bool.C.ref_
               * FFI.UInt.C.ref_
               * GtkPackType.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val reorderChild_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_box_reorder_child" :
              GtkBoxClass.C.notnull GtkBoxClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setChildPacking_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_box_set_child_packing" :
              GtkBoxClass.C.notnull GtkBoxClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               * FFI.UInt.C.val_
               * GtkPackType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setHomogeneous_ = fn x1 & x2 => (_import "gtk_box_set_homogeneous" : GtkBoxClass.C.notnull GtkBoxClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "gtk_box_set_spacing" : GtkBoxClass.C.notnull GtkBoxClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type pack_type_t = GtkPackType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation spacing = (GtkOrientation.C.withVal &&&> FFI.Int.C.withVal ---> GtkBoxClass.C.fromPtr false) new_ (orientation & spacing)
    fun getHomogeneous self = (GtkBoxClass.C.withPtr ---> FFI.Bool.C.fromVal) getHomogeneous_ self
    fun getSpacing self = (GtkBoxClass.C.withPtr ---> FFI.Int.C.fromVal) getSpacing_ self
    fun packEnd self child expand fill padding =
      (
        GtkBoxClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.UInt.C.withVal
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
        GtkBoxClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.UInt.C.withVal
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
            GtkBoxClass.C.withPtr
             &&&> GtkWidgetClass.C.withPtr
             &&&> FFI.Bool.C.withRefVal
             &&&> FFI.Bool.C.withRefVal
             &&&> FFI.UInt.C.withRefVal
             &&&> GtkPackType.C.withRefVal
             ---> FFI.Bool.C.fromVal
                   && FFI.Bool.C.fromVal
                   && FFI.UInt.C.fromVal
                   && GtkPackType.C.fromVal
                   && I
          )
            queryChildPacking_
            (
              self
               & child
               & FFI.Bool.null
               & FFI.Bool.null
               & FFI.UInt.null
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
        GtkBoxClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Int.C.withVal
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
        GtkBoxClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> GtkPackType.C.withVal
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
    fun setHomogeneous self homogeneous = (GtkBoxClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setSpacing self spacing = (GtkBoxClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSpacing_ (self & spacing)
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
