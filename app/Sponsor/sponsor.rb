# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Sponsor
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Sponsor.
  # enable :sync

  #add model specifc code here
  def self.seed
    db = ::Rho::RHO.get_user_db()    #If you don't change partition in your models, default partition is user
    db.start_transaction
    begin
      filename = File.join(Rho::RhoApplication::get_model_path('app','Sponsor'), 'sponsor.txt')
      
      File.readlines(filename, "--\n").each do |section|
        lines = section.lines.to_a
        # create hash of field\value pairs
        data = {:name => lines[0].chomp, 
                :type => lines[1].chomp, 
                :description => lines[2..-2].join.chomp}
        Sponsor.create(data) # will create new Model object and save it to db
      end
      
      db.commit
    rescue
      db.rollback
    end
  end
end
