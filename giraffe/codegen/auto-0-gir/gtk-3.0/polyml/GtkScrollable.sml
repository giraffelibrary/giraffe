structure GtkScrollable :>
  GTK_SCROLLABLE
    where type 'a class = 'a GtkScrollableClass.class
    where type border_t = GtkBorderRecord.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type scrollable_policy_t = GtkScrollablePolicy.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_scrollable_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getBorder_ = call (getSymbol "gtk_scrollable_get_border") (GtkScrollableClass.PolyML.cPtr &&> GtkBorderRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHadjustment_ = call (getSymbol "gtk_scrollable_get_hadjustment") (GtkScrollableClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getHscrollPolicy_ = call (getSymbol "gtk_scrollable_get_hscroll_policy") (GtkScrollableClass.PolyML.cPtr --> GtkScrollablePolicy.PolyML.cVal)
      val getVadjustment_ = call (getSymbol "gtk_scrollable_get_vadjustment") (GtkScrollableClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getVscrollPolicy_ = call (getSymbol "gtk_scrollable_get_vscroll_policy") (GtkScrollableClass.PolyML.cPtr --> GtkScrollablePolicy.PolyML.cVal)
      val setHadjustment_ = call (getSymbol "gtk_scrollable_set_hadjustment") (GtkScrollableClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> cVoid)
      val setHscrollPolicy_ = call (getSymbol "gtk_scrollable_set_hscroll_policy") (GtkScrollableClass.PolyML.cPtr &&> GtkScrollablePolicy.PolyML.cVal --> cVoid)
      val setVadjustment_ = call (getSymbol "gtk_scrollable_set_vadjustment") (GtkScrollableClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> cVoid)
      val setVscrollPolicy_ = call (getSymbol "gtk_scrollable_set_vscroll_policy") (GtkScrollableClass.PolyML.cPtr &&> GtkScrollablePolicy.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkScrollableClass.class
    type border_t = GtkBorderRecord.t
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type scrollable_policy_t = GtkScrollablePolicy.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getBorder self =
      let
        val border & retVal = (GtkScrollableClass.FFI.withPtr false &&&> GtkBorderRecord.FFI.withNewPtr ---> GtkBorderRecord.FFI.fromPtr true && GBool.FFI.fromVal) getBorder_ (self & ())
      in
        if retVal then SOME border else NONE
      end
    fun getHadjustment self = (GtkScrollableClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self before GtkScrollableClass.FFI.touchPtr self
    fun getHscrollPolicy self = (GtkScrollableClass.FFI.withPtr false ---> GtkScrollablePolicy.FFI.fromVal) getHscrollPolicy_ self
    fun getVadjustment self = (GtkScrollableClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getVadjustment_ self before GtkScrollableClass.FFI.touchPtr self
    fun getVscrollPolicy self = (GtkScrollableClass.FFI.withPtr false ---> GtkScrollablePolicy.FFI.fromVal) getVscrollPolicy_ self
    fun setHadjustment self hadjustment = (GtkScrollableClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setHadjustment_ (self & hadjustment)
    fun setHscrollPolicy self policy = (GtkScrollableClass.FFI.withPtr false &&&> GtkScrollablePolicy.FFI.withVal ---> I) setHscrollPolicy_ (self & policy)
    fun setVadjustment self vadjustment = (GtkScrollableClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setVadjustment_ (self & vadjustment)
    fun setVscrollPolicy self policy = (GtkScrollableClass.FFI.withPtr false &&&> GtkScrollablePolicy.FFI.withVal ---> I) setVscrollPolicy_ (self & policy)
    local
      open ValueAccessor
    in
      val hadjustmentProp =
        {
          name = "hadjustment",
          gtype = fn () => C.gtype GtkAdjustmentClass.tOpt (),
          get = fn x => fn () => C.get GtkAdjustmentClass.tOpt x,
          set = fn x => C.set GtkAdjustmentClass.tOpt x,
          init = fn x => C.set GtkAdjustmentClass.tOpt x
        }
      val hscrollPolicyProp =
        {
          name = "hscroll-policy",
          gtype = fn () => C.gtype GtkScrollablePolicy.t (),
          get = fn x => fn () => C.get GtkScrollablePolicy.t x,
          set = fn x => C.set GtkScrollablePolicy.t x,
          init = fn x => C.set GtkScrollablePolicy.t x
        }
      val vadjustmentProp =
        {
          name = "vadjustment",
          gtype = fn () => C.gtype GtkAdjustmentClass.tOpt (),
          get = fn x => fn () => C.get GtkAdjustmentClass.tOpt x,
          set = fn x => C.set GtkAdjustmentClass.tOpt x,
          init = fn x => C.set GtkAdjustmentClass.tOpt x
        }
      val vscrollPolicyProp =
        {
          name = "vscroll-policy",
          gtype = fn () => C.gtype GtkScrollablePolicy.t (),
          get = fn x => fn () => C.get GtkScrollablePolicy.t x,
          set = fn x => C.set GtkScrollablePolicy.t x,
          init = fn x => C.set GtkScrollablePolicy.t x
        }
    end
  end
