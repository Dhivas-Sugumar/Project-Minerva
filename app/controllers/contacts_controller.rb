class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      redirect_to root_url
      flash[:notice] = "You have sent an email to us. We will get back to you!"
    else
      flash[:alert] = 'Could not send message'
      render :new
    end
  end
end


private
def contact_params
  puts params
  params.require(:contact).permit(:name,:email,:message,:nickname)
end
