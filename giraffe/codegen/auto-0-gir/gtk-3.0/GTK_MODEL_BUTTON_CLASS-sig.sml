signature GTK_MODEL_BUTTON_CLASS =
  sig
    type 'a model_button
    type 'a button_class
    include
      CLASS
        where type 'a class = 'a model_button button_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
