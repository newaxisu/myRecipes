module ApplicationHelper
  def gravatar_for(chef, options = { size: 80} )
    #chef = Chef.new
    #chef.name = "XXX"
    gravatar_id = Digest::MD5::hexdigest(chef.email)
    #gravatar_id = "55c524fac885d133c5bf3ea063574571" 
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
   image_tag(gravatar_url, alt: chef.name, class: "gravatar")
   #image_tag(gravatar_url, alt: "xxx", class: "gravatar")
  end
end