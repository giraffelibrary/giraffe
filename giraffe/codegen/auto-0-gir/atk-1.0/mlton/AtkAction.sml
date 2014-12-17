structure AtkAction :>
  ATK_ACTION
    where type 'a class_t = 'a AtkActionClass.t =
  struct
    val getType_ = _import "atk_action_get_type" : unit -> GObjectType.C.val_;
    val doAction_ = fn x1 & x2 => (_import "atk_action_do_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val getDescription_ = fn x1 & x2 => (_import "atk_action_get_description" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val getKeybinding_ = fn x1 & x2 => (_import "atk_action_get_keybinding" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val getLocalizedName_ = fn x1 & x2 => (_import "atk_action_get_localized_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val getNActions_ = _import "atk_action_get_n_actions" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getName_ = fn x1 & x2 => (_import "atk_action_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val setDescription_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_atk_action_set_description" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * cstring
               * unit CPointer.t
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class_t = 'a AtkActionClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun doAction self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) doAction_ (self & i)
    fun getDescription self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getDescription_ (self & i)
    fun getKeybinding self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getKeybinding_ (self & i)
    fun getLocalizedName self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getLocalizedName_ (self & i)
    fun getNActions self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNActions_ self
    fun getName self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getName_ (self & i)
    fun setDescription self i desc =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
         ---> FFI.Bool.C.fromVal
      )
        setDescription_
        (
          self
           & i
           & desc
        )
  end
