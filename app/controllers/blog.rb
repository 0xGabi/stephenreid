ActivateApp::App.controllers :blog do
    
  get :index do
    @blog_posts = BlogPost.order_by(:created_at.desc).per_page(5).page(params[:page])
    erb :'blog/index'
  end
  
  get :post, :with => :slug do 
    @blog_post = BlogPost.find_by(slug: params[:slug]) || not_found
    @title = "#{@blog_post.title} · Stephen Reid"
    @og_desc = 'Blog of Stephen Reid, director of the Psychedelic Society and freelance digital creative'
    erb :'blog/post'
  end  
  
end
