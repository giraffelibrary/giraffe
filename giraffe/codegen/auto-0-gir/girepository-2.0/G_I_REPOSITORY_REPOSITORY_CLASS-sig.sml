signature G_I_REPOSITORY_REPOSITORY_CLASS =
  sig
    type 'a repository
    include
      CLASS
        where type 'a class = 'a repository GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
