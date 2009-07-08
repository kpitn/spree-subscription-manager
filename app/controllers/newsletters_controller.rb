class NewslettersController < Spree::BaseController 

  def subscribe



    mailing_list=MailingList.find(:first)
    sub=Subscription.find_by_email(params[:email])
    respond_to do |format|

      if params[:newsletter]=="yes"
        if sub.nil?
          subscription=Subscription.new({:mailing_list_id=>mailing_list.id,:email=>params[:email]})
          if subscription.save
            format.js {
              render :update do |page|
                page << "alert('inscription ok');"
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