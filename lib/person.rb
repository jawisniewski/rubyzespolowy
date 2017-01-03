  class Person

    attr_accessor :id, :name, :surname, :accounts

    def initialize(id, name, surname)
      @id = id
      @name = name
      @surname = surname
      @accounts = []
    end

   def to_s
   person = "#{name} #{surname} \n"
   person << "  Konta:\n  "
   @accounts.each do |i|
     person << " typ " << i.name
     person << " Saldo " << i.balance.to_s
     person << " \n"
 end
 person
   end

def add_account(account)
  @accounts.push(account)
end

  def delete_account(account)
    puts @name
    @accounts.delete_at(account)
    puts @accounts
    @accounts.each do |i|
      if i.id > id
        i.id = i.id - 1
      end
    end
  end



end



# dodaj klienta
# wplac na konto
# wyplac z konta
