signature G_I_REPOSITORY_REPOSITORY_CLASS =
  sig
    type 'a repository
    include
      CLASS
        where type 'a class = 'a repository GObject.ObjectClass.class
  end
