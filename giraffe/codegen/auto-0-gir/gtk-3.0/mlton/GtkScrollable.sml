structure GtkScrollable :>
  GTK_SCROLLABLE
    where type 'a class = 'a GtkScrollableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type scrollable_policy_t = GtkScrollablePolicy.t =
  struct
    val getType_ = _import "gtk_scrollable_get_type" : unit -> GObjectType.C.val_;
    val getHadjustment_ = _import "gtk_scrollable_get_hadjustment" : GtkScrollableClass.C.notnull GtkScrollableClass.C.p -> GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p;
    val getHscrollPolicy_ = _import "gtk_scrollable_get_hscroll_policy" : GtkScrollableClass.C.notnull GtkScrollableClass.C.p -> GtkScrollablePolicy.C.val_;
    val getVadjustment_ = _import "gtk_scrollable_get_vadjustment" : GtkScrollableClass.C.notnull GtkScrollableClass.C.p -> GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p;
    val getVscrollPolicy_ = _import "gtk_scrollable_get_vscroll_policy" : GtkScrollableClass.C.notnull GtkScrollableClass.C.p -> GtkScrollablePolicy.C.val_;
    val setHadjustment_ = fn x1 & x2 => (_import "gtk_scrollable_set_hadjustment" : GtkScrollableClass.C.notnull GtkScrollableClass.C.p * unit GtkAdjustmentClass.C.p -> unit;) (x1, x2)
    val setHscrollPolicy_ = fn x1 & x2 => (_import "gtk_scrollable_set_hscroll_policy" : GtkScrollableClass.C.notnull GtkScrollableClass.C.p * GtkScrollablePolicy.C.val_ -> unit;) (x1, x2)
    val setVadjustment_ = fn x1 & x2 => (_import "gtk_scrollable_set_vadjustment" : GtkScrollableClass.C.notnull GtkScrollableClass.C.p * unit GtkAdjustmentClass.C.p -> unit;) (x1, x2)
    val setVscrollPolicy_ = fn x1 & x2 => (_import "gtk_scrollable_set_vscroll_policy" : GtkScrollableClass.C.notnull GtkScrollableClass.C.p * GtkScrollablePolicy.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkScrollableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type scrollable_policy_t = GtkScrollablePolicy.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getHadjustment self = (GtkScrollableClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getHadjustment_ self
    fun getHscrollPolicy self = (GtkScrollableClass.C.withPtr ---> GtkScrollablePolicy.C.fromVal) getHscrollPolicy_ self
    fun getVadjustment self = (GtkScrollableClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getVadjustment_ self
    fun getVscrollPolicy self = (GtkScrollableClass.C.withPtr ---> GtkScrollablePolicy.C.fromVal) getVscrollPolicy_ self
    fun setHadjustment self hadjustment = (GtkScrollableClass.C.withPtr &&&> GtkAdjustmentClass.C.withOptPtr ---> I) setHadjustment_ (self & hadjustment)
    fun setHscrollPolicy self policy = (GtkScrollableClass.C.withPtr &&&> GtkScrollablePolicy.C.withVal ---> I) setHscrollPolicy_ (self & policy)
    fun setVadjustment self vadjustment = (GtkScrollableClass.C.withPtr &&&> GtkAdjustmentClass.C.withOptPtr ---> I) setVadjustment_ (self & vadjustment)
    fun setVscrollPolicy self policy = (GtkScrollableClass.C.withPtr &&&> GtkScrollablePolicy.C.withVal ---> I) setVscrollPolicy_ (self & policy)
    local
      open Property
    in
      val hadjustmentProp =
        {
          get = fn x => get "hadjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "hadjustment" GtkAdjustmentClass.tOpt x
        }
      val hscrollPolicyProp =
        {
          get = fn x => get "hscroll-policy" GtkScrollablePolicy.t x,
          set = fn x => set "hscroll-policy" GtkScrollablePolicy.t x
        }
      val vadjustmentProp =
        {
          get = fn x => get "vadjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "vadjustment" GtkAdjustmentClass.tOpt x
        }
      val vscrollPolicyProp =
        {
          get = fn x => get "vscroll-policy" GtkScrollablePolicy.t x,
          set = fn x => set "vscroll-policy" GtkScrollablePolicy.t x
        }
    end
  end
