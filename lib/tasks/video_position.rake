namespace :update_db do

  desc 'Updates all video DB records with nil value stored in position column'
  task video_position: :environment do
    videos = Video.where(position: nil)

    videos.each do |video|
      video.position = 0
      video.save
    end

    puts "Successfully updated the position of #{videos.size} videos!"
  end
end
