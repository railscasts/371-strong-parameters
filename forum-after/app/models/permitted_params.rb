class PermittedParams < Struct.new(:params, :user)
  def topic
    params.require(:topic).permit(*topic_attributes)
  end

  def topic_attributes
    if user && user.admin?
      [:name, :sticky]
    else
      [:name]
    end
  end
end
