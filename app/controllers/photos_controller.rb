class PhotosController < ApplicationController
  def index
    
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({:created_at => :desc})

    render({:template => "photo_templates/index.html.erb"})
  end

  def show

    #Parameters: {"path_id"=>"777"}
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({:id => url_id})

    @the_photo = matching_photos.at(0)

    render({:template => "photo_templates/show.html.erb"})
  end


  def delete
    # Parameters: {"toast_id"=>"777"}
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({:id => "the_id"})

    the_photo = matching_photos.at(0)

    #the_photo.destroy
    #render({:template => "photo_templates/delete.html.erb"})

    redirect_to("/photos")
  end

  def create

  #Parameters: {"query_image"=>"a", "query_caption"=>"b", "query_owner_id"=>"81"}
  input_image = params.fetch("input_image")
  input_caption = params.fetch("input_caption")
  input_owner_id = params.fetch("query_owner_id")

  a_new_photo = Photo.new
  a_new_photo.image = input_image
  a_new_photo.caption = input_caption
  a_new_photo.owner_id = input_owner_id

  a_new_photo.save

  #render({:template => "photo_templates/create.html.erb"})
  redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
  #{"input_image"=>"https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.FtNQvubWwhy6RaalTOUWJgHaFr%26pid%3DApi&f=1&ipt=68303eb3b194c1353e9ba9fb263c9659d123c22823a53c8f921d6a8f3766aeae&ipo=images", "input_caption"=>"pooh", "controller"=>"photos", "action"=>"update", "modify_id"=>"951"}

  the_id = params.fetch("modify_id")
  matching_photos = Photo.where({:id => the_id})
  the_photo = matching_photos.at(0)

  input_image = params.fetch("input_image")
  input_caption = params.fetch("input_caption")
  
  the_photo.image = input_image
  the_photo.caption = input_caption

  the_photo.save

  redirect_to("/photos/" +the_photo.id.to_s)
  end

end
