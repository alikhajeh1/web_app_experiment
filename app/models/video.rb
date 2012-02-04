require 'socket'

class Video < ActiveRecord::Base
  has_attached_file :movie, :default_style => :view, :processors => [:ffmpeg],
                    :path => ':rails_root/public/system/:class/:id/:style/:basename.:extension',
                    :url => '/:class/:id/movie?style=:style',
                    :styles => {
                        :thumb => { :geometry => '100x100', :format => 'jpg', :time => 1 },
                        :png => { :geometry => '640x480', :format => 'png', :time => 1 },
                        :mp4 => { :geometry => '640x480', :format => 'mp4',
                                  :convert_options => { :output => { :vcodec => 'libx264',
                                                                     :vpre => 'ipod640', :b => '250k', :bt => '50k',
                                                                     :acodec => 'libfaac', :ab => '56k', :ac => 2 } } },
                        :ogg => { :geometry => '640x480', :format => 'ogg',
                                  :convert_options => { :output => { :vcodec => 'libtheora',
                                                                     :b => '250k', :bt => '50k', :acodec => 'libvorbis',
                                                                     :ab => '56k', :ac => 2 } } }
                    }
  process_in_background :movie

  validates :name, :author, :presence => true

  def movie_url(style)
    Rails.application.config.app_hostname + movie.path(style).gsub!(/.*?(?=system)/im, "")
  end

  attr_accessible :name, :description, :author, :movie, :movie_file_name, :movie_content_type, :movie_file_size, :movie_updated_at

end
