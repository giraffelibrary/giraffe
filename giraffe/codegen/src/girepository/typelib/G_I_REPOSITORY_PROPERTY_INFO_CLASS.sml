signature G_I_REPOSITORY_PROPERTY_INFO_CLASS =
  sig
    type 'a propertyinfo
    type 'a baseinfo_class
    include CLASS where type 'a class = 'a propertyinfo baseinfo_class
  end
