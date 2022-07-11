class CrudNotificationMailer < ApplicationMailer

  def create_notification(object)
    @object = object
    @object_count = object.class.count
 mail to: object.email, subject: "a new entry extend For
 #{object.class} has been created"
  end







  def update_notification(object)
    @object = object
    @object_count = object.class.count
 mail to: object.email, subject: "a entry For
 #{object.class} has been updated"

  end

  def delete_notification(object)
    @object = object
    @object_count = object.class.count
mail to: object.email, subject: "a entry For
  #{object.class} has been deleted"
  end
end
