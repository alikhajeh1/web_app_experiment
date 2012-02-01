class Video < ActiveRecord::Base
  has_attached_file :movie, :default_style => :view, :processors => [:ffmpeg],
                    :path => ':rails_root/public/system/:class/:id/:style/:basename.:extension',
                    :url => '/:class/:id/movie?style=:style',
                    :styles => {
                        :mp4video => { :geometry => '520x390', :format => 'mp4',
                                       :convert_options => { :output => { :vcodec => 'libx264',
                                                                          :vpre => 'ipod640', :b => '250k', :bt => '50k',
                                                                          :acodec => 'libfaac', :ab => '56k', :ac => 2 } } },
                        :oggvideo => { :geometry => '520x390', :format => 'ogg',
                                       :convert_options => { :output => { :vcodec => 'libtheora',
                                                                          :b => '250k', :bt => '50k', :acodec => 'libvorbis',
                                                                          :ab => '56k', :ac => 2 } } },
                        :thumb => { :geometry => '100x100', :format => 'jpg', :time => 10 }
                    }
  process_in_background :movie

  validates :name, :author, :presence => true
  validates_attachment_presence :movie
end
