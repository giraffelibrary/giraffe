signature G_I_REPOSITORY_REPOSITORY_CLASS =
  sig
    type 'a repository
    type 'a object_class
    include CLASS where type 'a class = 'a repository object_class
  end
