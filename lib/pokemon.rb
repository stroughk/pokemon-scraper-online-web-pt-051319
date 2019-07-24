class Pokemon

attr_accessor :name, :type, :db, :id

def initialize(id=nil, name, type, db)
  @id = id
  @name = name
  @type = type
  @db = db
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
