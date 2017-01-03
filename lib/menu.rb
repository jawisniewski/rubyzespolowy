class Menu
attr_accessor :menu, :authors, :account, :users
def initialize
@menu = "*********** Bank ***********\n"
@menu << "1. Konto\n"
@account = "1. Pokaz wszystkie konta\n"
@account << "2. Szukaj konto\n"
@account << "3. Dodaj konto\n"
@account << "4. Zmień pin do konta \n"
@account << "5. Usuń konto \n"
@account << "6. Pokaz konta wedlug waluty\n"
@menu << "2. Uzytkownik\n"

@users = "1. Pokaz uzytkownikow \n"
@users << "2. Szukaj uzytkownika \n"
@users << "3. Dodaj uzytkownika\n"
@users << "4. Zmień dane uzytkownika\n"
@users << "5. Usuń uzytkownika\n"
@users << "6. Pokaz uzytkownikow wedlug waluty kont\n"
@menu << "3. Polacz konta z uzytkownikem\n"
@menu << "4. Wplac pieniedze na konta\n"
@menu << "5. Wyplac pieniedze z konto\n"
@menu << "6. Autorzy\n"
@menu << "q. Exit\n"
@menu << "*****************************\n"
@menu << 'Wybierz => '
@authors = "Informatyka, TE2\n\n"
@authors << "Jakub Wiśniewski\n"
@authors << "Aleksandra Tejszerska\n"
@authors << "Szymon Sędek\n"
end
def authors_to_s
authors
end
def to_s
menu
end
def clear
system 'clear'
system 'cls'
end
end
