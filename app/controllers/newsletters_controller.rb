class NewslettersController < Spree::BaseController 

  def show
    @newsletter=Newsletter.find_by_param(params[:id])
    respond_to do |format|
      format.html{render :layout=>"newsletter"}
    end
  end
  
  def subscribe



    mailing_list=MailingList.find(:first)
    sub=Subscription.find_by_email(params[:email])
    respond_to do |format|

      if params[:newsletter]=="yes"
        if sub.nil?
          subscription=Subscription.new({:mailing_list_id=>mailing_list.id,:email=>params[:email],:user_id=>nil})
          if subscription.save
            format.js {
              render :update do |page|
                page << "alert('Votre inscription a la newsletter a bien été prise en compte. ');"
              end
            }
          else
            format.js {
              render :update do |page|
                page << "alert('Veuillez saisir un email valide.')";
              end
            }
          end
        else
          format.js {
            render :update do |page|
              page << "alert('Vous êtes deja inscrit')";
            end
          }
        end
      else
        unless sub.nil?
          if sub.destroy
            format.js {
              render :update do |page|
                page << "alert('Desinscription ok');"
              end
            }
          else
            format.js {
              render :update do |page|
                page << "alert('#{escape_javascript(subscription.errors.full_messages.to_s)}')";
              end
            }
          end
        else
          format.js {
            render :update do |page|
              page << "alert('Adresse email introuvable')";
            end
          }
        end
      end
    end
  end


end