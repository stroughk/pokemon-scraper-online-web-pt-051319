class Pokemon

 attr_accessor :id, :name, :type, :hp, :db

def initialize(id:, name:, type:, hp: nil, db:)
   @id, @name, @type, @hp, @db = id, name, type, hp, db
 end

def save
  if self.id
    self.update
  else
    sql = <<-SQL
    INSERT INTO pokemon (name, type, db)
    VALUES (?, ?, ?)
    SQL

    DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
end

end
