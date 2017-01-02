class Person
  attr_accessor :id, :name, :surname
  def initialize(id, name, surname)
    @id = id
    @name = name
    @surname = surname
  end
 # def to_s
 # "[ID: #{id}] #{name} #{surname}"
 # end

 def accountsto_s(account)
   person_account = 'Nazwisko :' << surname.to_s
    person_account << " imie: "<< name.to_s << "\n"
   account.each do |a|
     if a.person.eql?(id)
    person_account << " nazwa konta: " << a.name.to_s
    person_account << 'Stan konta :' << a.balance.to_s << "\n"
end
end
 end
end
# dodaj klienta
# wplac na konto
# wyplac z konta
