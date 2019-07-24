class Pokemon

 attr_accessor :id, :name, :type, :hp, :db

def initialize(id:, name:, type:, hp: nil, db:)
   @id, @name, @type, @hp, @db = id, name, type, hp, db
 end

def self.save(name, type, db)
  if self.id
    self.update
  else
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?), name, type
    SQL

    DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
end

end
