class Public::ContactsController < ApplicationController

  def new
    @q = Menu.ransack(params[:q])
    @contact = Contact.new
  end

  def confirm
    @q = Menu.ransack(params[:q])
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      flash[:alert] = @contact.errors.full_messages.join(", ")
      @contact = Contact.new
      render :new
    end
  end

  def back
    @q = Menu.ransack(params[:q])
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @q = Menu.ransack(params[:q])
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_contacts_path
    else
      flash[:alert] = @contact.errors.full_messages.join(", ")
      @contact = Contact.new
      render :new
    end
  end

  def done
    @q = Menu.ransack(params[:q])
  end

    private

    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message)
    end
end