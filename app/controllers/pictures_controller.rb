class PicturesController < ApplicationController

    def index
        @photo_list = Photo.all.order({ :created_at => "desc"})
        render("pic_templates/front_page.html.erb")
    end
    
    def add_new_photo
        render("pic_templates/blank_form.html.erb")
    end
    
    def photo_created
        p = Photo.new
        p.source = params.fetch("img_source")
        p.caption = params.fetch("img_caption")
        p.save
        @count = Photo.count
        redirect_to("https://photogram-golden-7-meghaagarwal.c9users.io/photos")
        # render("pic_templates/photo_added.html.erb")
    end
    
    def show_details
        id = params.fetch("id_number")
        @a = Photo.find(id)
        render("pic_templates/photo_details.html.erb")
    end
    
    def edit_photos
        id = params.fetch("photo_id")
        @a = Photo.find(id)
        render("pic_templates/edit_form.html.erb")
    end
    
    def updated_row
        id = params.fetch("pic_id")
        b = Photo.find(id)
        @url_id = id
        
        b.caption = params.fetch("img_caption")
        b.source = params.fetch("img_url")
        
        b.save
        redirect_to("https://photogram-golden-7-meghaagarwal.c9users.io/photos/" + id)
        # render("/pic_templates/updated_photo.html.erb")
    end
    
    def delete_row
        id = params.fetch("photo_id")
        Photo.find(id).destroy
        # render("/pic_templates/delete_photo.html.erb")
        redirect_to("https://photogram-golden-7-meghaagarwal.c9users.io/photos")
    end
    
end