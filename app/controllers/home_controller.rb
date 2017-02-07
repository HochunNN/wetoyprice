class HomeController < ApplicationController
##########################################################################################  
################################메인화면 관련#############################################
##########################################################################################

  def page_main
    @linetalks = Linetalk.all.order("id desc")
    @sudas = Suda.order("id desc")
    @reviews = Review.all
  end
  
  def page_main_linetalk_write   
    talk = Linetalk.new
    talk.linetalk_content = params[:linetalk_content_view]
    talk.save
    render :nothing => true
  end

##########################################################################################  
##################################알림방 관련#############################################
##########################################################################################










##########################################################################################  
##############################알뜰게시판 관련#############################################
##########################################################################################
  
  def page_price
    # params[:sort] ||= "product_price"
    if params[:search_product_name].present?
      @search_product_name = Product.where("product_title LIKE '%#{params[:search_product_name]}%'").order("product_price asc").group_by {|t| t.product_title}
    else
      @search_product_name = nil
    end
  end
##########################################################################################  
##############################자유게시판 관련#############################################
##########################################################################################
  def page_board_free
    @sudas = Suda.order("id desc")
  
  end
  
  def page_board_free_detail
    @board_free_detail = Suda.find(params[:post_id])
    
  end
  
  def page_board_free_viewcount
    
    @board_free_viewcount = Suda.find(params[:post_id])
    @board_free_viewcount.suda_viewcount += 1
    @board_free_viewcount.save
    
    render :nothing => true
  end
  
  def page_board_free_write
    
  end
  
  def page_board_free_write_save
    suda = Suda.new
    suda.suda_title = params[:suda_title_view]
    if params[:suda_writer_view].present?
      suda.suda_writer = params[:suda_writer_view]
    else
      suda.suda_writer = "롱메"
    end
    suda.suda_content = params[:suda_content_view]
    suda.suda_passwd = params[:suda_passwd_view]
    suda.save
    
    redirect_to "/home/page_board_free_detail/#{suda.id}"
    
  end
  
  def page_board_free_delete
    board_free_delete = Suda.find(params[:post_id])
  
      if board_free_delete.suda_passwd == params[:checksudapw_view]
          board_free_delete.delete
          
          redirect_to '/home/page_board_free'
          
        else
          flash[:notice] = '비밀번호가 틀렸습니다.'
          redirect_to '/home/page_board_free'
      end
    rescue ActiveRecord::RecordNotFound
    # redirect_to '/home/page_board_free'
    
  end
  
  def page_board_free_update
    @page_board_free_update = Suda.find(params[:post_id])
    
      if @page_board_free_update.suda_passwd == params[:checksudapw_view]
            @page_board_free_update = Suda.find(params[:post_id])  
            
            
            
        else
          flash[:notice] = '비밀번호가 틀렸습니다.'
          redirect_to '/home/page_board_free'
      end
      
  
  end
  
  def page_board_free_update_save
    board_free_update = Suda.find(params[:post_id])
    
    board_free_update.suda_title = params[:suda_title_view]
    if params[:suda_writer_view].present?
      board_free_update.suda_writer = params[:suda_writer_view]
    else
      board_free_update.suda_writer = "롱메"
    end
    board_free_update.suda_content = params[:suda_content_view]
    board_free_update.suda_passwd = params[:suda_passwd_view]
    board_free_update.save
    
    redirect_to "/home/page_board_free_detail/#{params[:post_id]}"
    
  end
  
  
#####################댓글 달기#####################################  
  def page_board_free_reply_save
    sudareply = Sudareply.new
    sudareply.sudareplyname = params[:reply_writer_name]
    sudareply.sudareplycontent = params[:reply_content]
    sudareply.suda_id = params[:id_of_post]
    sudareply.save
    
    render :nothing => true
  end
    
  
  
##########################################################################################
##########################################################################################
##########################################################################################


##########################################################################################  
################################리뷰게시판 관련###########################################
##########################################################################################

  def page_board_review
    @reviews = Review.order("id desc")
  end
  
  def page_board_review_detail
    @board_review_detail = Review.find(params[:post_id])
    
  end
  
  def page_board_review_viewcount
    
    @board_review_viewcount = Review.find(params[:post_id])
    @board_review_viewcount.review_viewcount += 1
    @board_review_viewcount.save
    
    render :nothing => true
  end
  
  def page_board_review_write
    # I will explain this part in a moment.
    websites_filter = Product.pluck(:product_website).uniq
    
      if params[:term]
        @websites = websites_filter.grep(/#{params[:term]}/)
      else
        @websites = websites_filter
      end
    
    
      respond_to do |format|  
        format.html # index.html.erb  
    # Here is where you can specify how to handle the request for "/people.json"
        format.json { render :json => @websites.to_json }
        end
  end
  
  def page_board_review_write_save
    review = Review.new
    review.review_title = params[:review_title_view]
    if params[:review_writer_view].present?
      review.review_writer = params[:review_writer_view]
    else
      review.review_writer = "롱메"
    end
    review.review_content = params[:review_content_view]
    review.review_passwd = params[:review_passwd_view]
    review.review_website = params[:review_website_view]
    review.review_prod_name = params[:review_prod_name_view]
    # review.review_image_url =
    
    review.save
    
    redirect_to "/home/page_board_review_detail/#{review.id}"
  end
  
  def page_board_review_delete
    board_review_delete = Review.find(params[:post_id])
    if board_review_delete.review_passwd == params[:checksudapw_view]
        board_review_delete.delete
        
        redirect_to "/home/page_board_review"
        
      else
        flash[:notice] = '비밀번호가 틀렸습니다.'
        redirect_to "/home/page_board_review_detail/#{board_review_delete.id}"
    end
    rescue ActiveRecord::RecordNotFound
  # redirect_to "/home/page_board_review"
    
  end
  
  def page_board_review_update
    @board_review_update = Review.find(params[:post_id])
    
    websites_filter = Product.pluck(:product_website).uniq
    
    if params[:term]
      @websites = websites_filter.grep(/#{params[:term]}/)
    else
      @websites = websites_filter
    end
    
    
    if @board_review_update.review_passwd == params[:checkreviewpw_view]
        
      respond_to do |format|  
        format.html # index.html.erb  
      # Here is where you can specify how to handle the request for "/people.json"
        format.json { render :json => @websites.to_json }
      end  
        
        
      else
        flash[:notice] = '비밀번호가 틀렸습니다.'
        redirect_to "/home/page_board_review_detail/#{@board_review_update.id}"
    end
    
  end
  
  def page_board_review_update_save
    board_review_update = Review.find(params[:post_id])
    
    board_review_update.review_title = params[:review_title_view]
    if params[:review_writer_view].present?
      board_review_update.review_writer = params[:review_writer_view]
    else
      board_review_update.review_writer = "롱메"
    end
    board_review_update.review_content = params[:review_content_view]
    board_review_update.review_passwd = params[:review_passwd_view]
    board_review_update.review_website = params[:review_website_view]
    board_review_update.review_prod_name = params[:review_prod_name_view]
    # review.review_image_url =
    
    board_review_update.save
    redirect_to "/home/page_board_review_detail/#{params[:post_id]}"
    
  end
  
#####################댓글 달기#####################################  
  def page_board_review_reply_save
    reviewreply = Reviewreply.new
    reviewreply.reviewreplyname = params[:reply_writer_name]
    reviewreply.reviewreplycontent = params[:reply_content]
    reviewreply.review_id = params[:id_of_post]
    reviewreply.save
    
    render :nothing => true
  end
    
  


##########################################################################################
##########################################################################################
##########################################################################################
  
  
end
