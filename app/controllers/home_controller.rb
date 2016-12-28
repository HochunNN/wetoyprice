class HomeController < ApplicationController
  def index
    @linetalks = Linetalk.all.order("id desc")
    
  end
  
  def result
    # params[:sort] ||= "product_price"
    if params[:search_product_name].present?
      @search_product_name = Product.where("product_title LIKE '%#{params[:search_product_name]}%'").order("product_price asc").group_by {|t| t.product_title}
    else
      @search_product_name = nil
    end
  end
  
  def board
    @sudas = Suda.order("id desc")
  end
  
  def write
    
  end
  
  def write_save
    suda = Suda.new
    suda.suda_title = params[:suda_title_view]
    if params[:suda_writer_view].present?
      suda.suda_writer = params[:suda_writer_view]
    else
      suda.suda_writer = "롱메"
    end
    suda.suda_content = params[:suda_content_view]
    suda.save
    
    redirect_to "/home/board"
    
  end
  
  def linetalk_write 
    
    talk = Linetalk.new
    talk.linetalk_content = params[:linetalk_content_view]
    talk.save
    
  end
  
  
end
