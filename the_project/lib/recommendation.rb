module Recommendation

    def recommended_songs
        other_users = self.class.all.where('id != ?', self.id);

        recommended = Hash.new(0)

        other_users.each do |user|
            common_songs = user.songs & self.songs

            weight = common_songs.size.to_f / user.songs.size

            (user.songs - common_songs).each do |song|
                recommended[song] += weight
            end
        end

        sorted_recommended = recommended.sort_by { |key, value| value }.reverse
    end

end
