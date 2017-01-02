require_relative account
require_relative person

class View

  def show_all_account
    j = 0
    @@accounts.each do |i|
    #print i.id
      print @@users[j].name
      print @@users[j].surname
      print i.balance
      print "\n"
      j += 1
    end
  end

  def show_account(account)
    if sprawdzPin(account.id, account.pin)
      puts account.to_s
    end
  end

  def show_user(user)
  puts user.to_s
  end

  def user_accounts(user)

    puts user.accounts_to_s
  end
end
