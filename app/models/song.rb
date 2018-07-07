class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
  
  def genre_name
    self.genre ? self.genre.name : nil
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist ? self.artist.name : nil
  end
  
  def post_ids=(ids)
     ids.each do |id|
       post = Post.find(id)
       self.posts << post
     end
   end
  
  def note_contents=(notes)
    notes.each do |content|
      if content != ""
        note = Note.find_by(content: content)
        self.notes << note
        #self.notes.build(content: content)
      end
    end
  end
  
  def note_contents
    self.notes.collect { |note| note.content }
  end
end