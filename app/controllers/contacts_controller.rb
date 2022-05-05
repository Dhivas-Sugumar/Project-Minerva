class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash[:success] = 'Message sent!'
    else
      flash[:error] = 'Could not send message'
      render :new
    end
  end
end


private
def contact_params
  puts params
  params.require(:contact).permit(:name,:email,:message,:nickname)
end
