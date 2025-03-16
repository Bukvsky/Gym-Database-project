CREATE TABLE Franczyzobiorca (
    ID_Franczyzobiorcy integer  NOT NULL,
    Imie varchar2(40)  NOT NULL,
    Nazwisko varchar2(40)  NOT NULL,
    CONSTRAINT Franczyzobiorca_pk PRIMARY KEY (ID_Franczyzobiorcy)
) ;

-- Table: Klubowicz
CREATE TABLE Klubowicz (
    ID_Klubowicza integer  NOT NULL,
    Imie varchar2(40)  NOT NULL,
    Nazwisko varchar2(40)  NOT NULL,
    Data_dolaczenia date  NOT NULL,
    Rodzaj_subskrypcji_ID_Subskrypcji integer  NOT NULL,
    CONSTRAINT Klubowicz_pk PRIMARY KEY (ID_Klubowicza)
) ;

-- Table: Klubowicz_Silownia
CREATE TABLE Klubowicz_Silownia (
    Silownia_ID_silowni integer  NOT NULL,
    Klubowicz_ID_Klubowicza integer  NOT NULL,
    Data date  NOT NULL,
    CONSTRAINT Klubowicz_Silownia_pk PRIMARY KEY (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data)
) ;

-- Table: Manager_klubu
CREATE TABLE Manager_klubu (
    ID_Managera integer  NOT NULL,
    Imie varchar2(40)  NOT NULL,
    Nazwisko varchar2(40)  NOT NULL,
    CONSTRAINT Manager_klubu_pk PRIMARY KEY (ID_Managera)
) ;

-- Table: Miasto
CREATE TABLE Miasto (
    ID_Miasta integer  NOT NULL,
    Nazwa_Miasta varchar2(50)  NOT NULL,
    Liczba_ludnosci integer  NOT NULL,
    CONSTRAINT Miasto_pk PRIMARY KEY (ID_Miasta)
) ;

-- Table: Pracownik_nizszego_szczebla
CREATE TABLE Pracownik_nizszego_szczebla (
    ID_Pracownika integer  NOT NULL,
    Imie varchar2(40)  NOT NULL,
    Nazwisko varchar2(40)  NOT NULL,
    Stanowisko_ID_Stanowiska integer  NOT NULL,
    Spolka_Franczyzowa_ID_spolki integer  NOT NULL,
    CONSTRAINT Pracownik_nizszego_szczebla_pk PRIMARY KEY (ID_Pracownika)
) ;

-- Table: Rodzaj_subskrypcji
CREATE TABLE Rodzaj_subskrypcji (
    ID_Subskrypcji integer  NOT NULL,
    Nazwa varchar2(20)  NOT NULL,
    Cena integer  NOT NULL,
    CONSTRAINT Rodzaj_subskrypcji_pk PRIMARY KEY (ID_Subskrypcji)
) ;

-- Table: Silownia
CREATE TABLE Silownia (
    ID_silowni integer  NOT NULL,
    Powierzchnia_klubu_mkw integer  NOT NULL,
    Spolka_Franczyzowa_ID_spolki integer  NOT NULL,
    Miasto_ID_Miasta integer  NOT NULL,
    Manager_klubu_ID_Managera integer  NOT NULL,
    CONSTRAINT Silownia_pk PRIMARY KEY (ID_silowni)
) ;

-- Table: Spolka_Franczyzowa
CREATE TABLE Spolka_Franczyzowa (
    ID_spolki integer  NOT NULL,
    Franczyzobiorca_ID_Franczyzobiorcy integer  NOT NULL,
    CONSTRAINT Spolka_Franczyzowa_pk PRIMARY KEY (ID_spolki)
) ;

-- Table: Stanowisko
CREATE TABLE Stanowisko (
    ID_Stanowiska integer  NOT NULL,
    Nazwa varchar2(20)  NOT NULL,
    CONSTRAINT Stanowisko_pk PRIMARY KEY (ID_Stanowiska)
) ;

-- Table: Wyposazenie
CREATE TABLE Wyposazenie (
    ID_wyposazenia integer  NOT NULL,
    Nazwa varchar2(50)  NOT NULL,
    Cena_Katalogowa integer  NOT NULL,
    Opis varchar2(255)  NOT NULL,
    CONSTRAINT Wyposazenie_pk PRIMARY KEY (ID_wyposazenia)
) ;

-- Table: Wyposazenie_Silownia
CREATE TABLE Wyposazenie_Silownia (
    Wyposazenie_ID_wyposazenia integer  NOT NULL,
    Silownia_ID_silowni integer  NOT NULL,
    CONSTRAINT Wyposazenie_Silownia_pk PRIMARY KEY (Wyposazenie_ID_wyposazenia, Silownia_ID_silowni)
) ;

-- foreign keys
-- Reference: Klubowicz_Rodzaj_subskrypcji (table: Klubowicz)
ALTER TABLE Klubowicz ADD CONSTRAINT Klubowicz_Rodzaj_subskrypcji
    FOREIGN KEY (Rodzaj_subskrypcji_ID_Subskrypcji)
    REFERENCES Rodzaj_subskrypcji (ID_Subskrypcji);

-- Reference: Klubowicz_Silownia_Klubowicz (table: Klubowicz_Silownia)
ALTER TABLE Klubowicz_Silownia ADD CONSTRAINT Klubowicz_Silownia_Klubowicz
    FOREIGN KEY (Klubowicz_ID_Klubowicza)
    REFERENCES Klubowicz (ID_Klubowicza);

-- Reference: Klubowicz_Silownia_Silownia (table: Klubowicz_Silownia)
ALTER TABLE Klubowicz_Silownia ADD CONSTRAINT Klubowicz_Silownia_Silownia
    FOREIGN KEY (Silownia_ID_silowni)
    REFERENCES Silownia (ID_silowni);

-- Reference: Pracownik_nizszego_szczebla_Spolka_Franczyzowa (table: Pracownik_nizszego_szczebla)
ALTER TABLE Pracownik_nizszego_szczebla ADD CONSTRAINT Pracownik_nizszego_szczebla_Spolka_Franczyzowa
    FOREIGN KEY (Spolka_Franczyzowa_ID_spolki)
    REFERENCES Spolka_Franczyzowa (ID_spolki);

-- Reference: Pracownik_nizszego_szczebla_Stanowisko (table: Pracownik_nizszego_szczebla)
ALTER TABLE Pracownik_nizszego_szczebla ADD CONSTRAINT Pracownik_nizszego_szczebla_Stanowisko
    FOREIGN KEY (Stanowisko_ID_Stanowiska)
    REFERENCES Stanowisko (ID_Stanowiska);

-- Reference: Silownia_Manager_klubu (table: Silownia)
ALTER TABLE Silownia ADD CONSTRAINT Silownia_Manager_klubu
    FOREIGN KEY (Manager_klubu_ID_Managera)
    REFERENCES Manager_klubu (ID_Managera);

-- Reference: Silownia_Miasto (table: Silownia)
ALTER TABLE Silownia ADD CONSTRAINT Silownia_Miasto
    FOREIGN KEY (Miasto_ID_Miasta)
    REFERENCES Miasto (ID_Miasta);

-- Reference: Silownia_Spolka_Franczyzowa (table: Silownia)
ALTER TABLE Silownia ADD CONSTRAINT Silownia_Spolka_Franczyzowa
    FOREIGN KEY (Spolka_Franczyzowa_ID_spolki)
    REFERENCES Spolka_Franczyzowa (ID_spolki);

-- Reference: Spolka_Franczyzowa_Franczyzobiorca (table: Spolka_Franczyzowa)
ALTER TABLE Spolka_Franczyzowa ADD CONSTRAINT Spolka_Franczyzowa_Franczyzobiorca
    FOREIGN KEY (Franczyzobiorca_ID_Franczyzobiorcy)
    REFERENCES Franczyzobiorca (ID_Franczyzobiorcy);

-- Reference: Wyposazenie_Silownia_Silownia (table: Wyposazenie_Silownia)
ALTER TABLE Wyposazenie_Silownia ADD CONSTRAINT Wyposazenie_Silownia_Silownia
    FOREIGN KEY (Silownia_ID_silowni)
    REFERENCES Silownia (ID_silowni);

-- Reference: Wyposazenie_Silownia_Wyposazenie (table: Wyposazenie_Silownia)
ALTER TABLE Wyposazenie_Silownia ADD CONSTRAINT Wyposazenie_Silownia_Wyposazenie
    FOREIGN KEY (Wyposazenie_ID_wyposazenia)
    REFERENCES Wyposazenie (ID_wyposazenia);

-- End of file.


-- Tabela Franczyzobiorca
INSERT INTO Franczyzobiorca (ID_Franczyzobiorcy, Imie, Nazwisko) VALUES (1, 'Jan', 'Kowalski');
INSERT INTO Franczyzobiorca (ID_Franczyzobiorcy, Imie, Nazwisko) VALUES (2, 'Anna', 'Nowak');
INSERT INTO Franczyzobiorca (ID_Franczyzobiorcy, Imie, Nazwisko) VALUES (3, 'Piotr', 'Zielinski');
INSERT INTO Franczyzobiorca (ID_Franczyzobiorcy, Imie, Nazwisko) VALUES (4, 'Katarzyna', 'Wisniewska');

-- Tabela Klubowicz
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (1, 'Adam', 'Kowalski', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (2, 'Ewa', 'Nowak', TO_DATE('2023-02-20', 'YYYY-MM-DD'), 2);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (3, 'Jan', 'Zielinski', TO_DATE('2023-03-10', 'YYYY-MM-DD'), 3);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (4, 'Anna', 'Wisniewska', TO_DATE('2023-04-05', 'YYYY-MM-DD'), 1);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (5, 'Tomasz', 'Wojcik', TO_DATE('2023-05-14', 'YYYY-MM-DD'), 2);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (6, 'Katarzyna', 'Krawczyk', TO_DATE('2023-06-18', 'YYYY-MM-DD'), 3);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (7, 'Piotr', 'Kowalczyk', TO_DATE('2023-07-22', 'YYYY-MM-DD'), 1);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (8, 'Agnieszka', 'Zalewska', TO_DATE('2023-08-11', 'YYYY-MM-DD'), 2);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (9, 'Marek', 'Sikora', TO_DATE('2023-09-09', 'YYYY-MM-DD'), 3);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (10, 'Monika', 'Krol', TO_DATE('2023-10-13', 'YYYY-MM-DD'), 1);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (11, 'Kamil', 'Lewandowski', TO_DATE('2023-11-01', 'YYYY-MM-DD'), 2);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (12, 'Olga', 'Wisniewska', TO_DATE('2023-11-12', 'YYYY-MM-DD'), 3);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (13, 'Maciej', 'Kowalski', TO_DATE('2023-12-02', 'YYYY-MM-DD'), 1);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (14, 'Alicja', 'Zielinska', TO_DATE('2023-12-14', 'YYYY-MM-DD'), 2);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (15, 'Mateusz', 'Nowak', TO_DATE('2023-12-24', 'YYYY-MM-DD'), 3);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (16, 'Izabela', 'Wojcik', TO_DATE('2024-01-05', 'YYYY-MM-DD'), 1);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (17, 'Wojciech', 'Krawczyk', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 2);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (18, 'Marta', 'Zalewska', TO_DATE('2024-01-26', 'YYYY-MM-DD'), 3);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (19, 'Grzegorz', 'Sikora', TO_DATE('2024-02-10', 'YYYY-MM-DD'), 1);
INSERT INTO Klubowicz (ID_Klubowicza, Imie, Nazwisko, Data_dolaczenia, Rodzaj_subskrypcji_ID_Subskrypcji) VALUES (20, 'Sylwia', 'Krol', TO_DATE('2024-02-20', 'YYYY-MM-DD'), 2);

-- Tabela Klubowicz_Silownia
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (1, 1, TO_DATE('2023-01-20', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (2, 2, TO_DATE('2023-02-25', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (3, 3, TO_DATE('2023-03-15', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (4, 4, TO_DATE('2023-04-10', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (5, 5, TO_DATE('2023-05-19', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (6, 6, TO_DATE('2023-06-23', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (7, 7, TO_DATE('2023-07-27', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (8, 8, TO_DATE('2023-08-16', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (9, 9, TO_DATE('2023-09-14', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (10, 10, TO_DATE('2023-10-18', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (1, 11, TO_DATE('2023-11-10', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (2, 12, TO_DATE('2023-11-25', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (3, 13, TO_DATE('2023-12-12', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (4, 14, TO_DATE('2023-12-18', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (5, 15, TO_DATE('2024-01-05', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (6, 16, TO_DATE('2024-01-12', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (7, 17, TO_DATE('2024-01-22', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (8, 18, TO_DATE('2024-01-28', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (9, 19, TO_DATE('2024-02-10', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (10, 20, TO_DATE('2024-02-15', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (1, 1, TO_DATE('2024-02-25', 'YYYY-MM-DD'));
INSERT INTO Klubowicz_Silownia (Silownia_ID_silowni, Klubowicz_ID_Klubowicza, Data) VALUES (2, 2, TO_DATE('2024-03-05', 'YYYY-MM-DD'));

-- Tabela Manager_klubu
INSERT INTO Manager_klubu (ID_Managera, Imie, Nazwisko) VALUES (1, 'Rafal', 'Kowalski');
INSERT INTO Manager_klubu (ID_Managera, Imie, Nazwisko) VALUES (2, 'Michal', 'Nowak');
INSERT INTO Manager_klubu (ID_Managera, Imie, Nazwisko) VALUES (3, 'Jakub', 'Zielinski');
INSERT INTO Manager_klubu (ID_Managera, Imie, Nazwisko) VALUES (4, 'Daria', 'Wisniewska');
INSERT INTO Manager_klubu (ID_Managera, Imie, Nazwisko) VALUES (5, 'Paulina', 'Wojcik');
INSERT INTO Manager_klubu (ID_Managera, Imie, Nazwisko) VALUES (6, 'Dorota', 'Krawczyk');
INSERT INTO Manager_klubu (ID_Managera, Imie, Nazwisko) VALUES (7, 'Szymon', 'Kowalczyk');
INSERT INTO Manager_klubu (ID_Managera, Imie, Nazwisko) VALUES (8, 'Magdalena', 'Zalewska');
INSERT INTO Manager_klubu (ID_Managera, Imie, Nazwisko) VALUES (9, 'Filip', 'Sikora');
INSERT INTO Manager_klubu (ID_Managera, Imie, Nazwisko) VALUES (10, 'Justyna', 'Krol');

-- Tabela Miasto
INSERT INTO Miasto (ID_Miasta, Nazwa_Miasta, Liczba_ludnosci) VALUES (1, 'Warszawa', 1790658);
INSERT INTO Miasto (ID_Miasta, Nazwa_Miasta, Liczba_ludnosci) VALUES (2, 'Krakow', 779115);
INSERT INTO Miasto (ID_Miasta, Nazwa_Miasta, Liczba_ludnosci) VALUES (3, 'Lodz', 680348);
INSERT INTO Miasto (ID_Miasta, Nazwa_Miasta, Liczba_ludnosci) VALUES (4, 'Wroclaw', 642869);
INSERT INTO Miasto (ID_Miasta, Nazwa_Miasta, Liczba_ludnosci) VALUES (5, 'Poznan', 535697);
INSERT INTO Miasto (ID_Miasta, Nazwa_Miasta, Liczba_ludnosci) VALUES (6, 'Gdansk', 470907);
INSERT INTO Miasto (ID_Miasta, Nazwa_Miasta, Liczba_ludnosci) VALUES (7, 'Szczecin', 398255);
INSERT INTO Miasto (ID_Miasta, Nazwa_Miasta, Liczba_ludnosci) VALUES (8, 'Bydgoszcz', 349123);
INSERT INTO Miasto (ID_Miasta, Nazwa_Miasta, Liczba_ludnosci) VALUES (9, 'Lublin', 339682);
INSERT INTO Miasto (ID_Miasta, Nazwa_Miasta, Liczba_ludnosci) VALUES (10, 'Katowice', 297586);

-- Tabela Pracownik_nizszego_szczebla
INSERT INTO Pracownik_nizszego_szczebla (ID_Pracownika, Imie, Nazwisko, Stanowisko_ID_Stanowiska, Spolka_Franczyzowa_ID_spolki) VALUES (1, 'Kamil', 'Kowalski', 1, 1);
INSERT INTO Pracownik_nizszego_szczebla (ID_Pracownika, Imie, Nazwisko, Stanowisko_ID_Stanowiska, Spolka_Franczyzowa_ID_spolki) VALUES (2, 'Olga', 'Nowak', 2, 2);
INSERT INTO Pracownik_nizszego_szczebla (ID_Pracownika, Imie, Nazwisko, Stanowisko_ID_Stanowiska, Spolka_Franczyzowa_ID_spolki) VALUES (3, 'Maciej', 'Zielinski', 3, 3);
INSERT INTO Pracownik_nizszego_szczebla (ID_Pracownika, Imie, Nazwisko, Stanowisko_ID_Stanowiska, Spolka_Franczyzowa_ID_spolki) VALUES (4, 'Alicja', 'Wisniewska', 4, 4);
INSERT INTO Pracownik_nizszego_szczebla (ID_Pracownika, Imie, Nazwisko, Stanowisko_ID_Stanowiska, Spolka_Franczyzowa_ID_spolki) VALUES (5, 'Mateusz', 'Wojcik', 5, 5);
INSERT INTO Pracownik_nizszego_szczebla (ID_Pracownika, Imie, Nazwisko, Stanowisko_ID_Stanowiska, Spolka_Franczyzowa_ID_spolki) VALUES (6, 'Izabela', 'Krawczyk', 6, 6);
INSERT INTO Pracownik_nizszego_szczebla (ID_Pracownika, Imie, Nazwisko, Stanowisko_ID_Stanowiska, Spolka_Franczyzowa_ID_spolki) VALUES (7, 'Wojciech', 'Kowalczyk', 7, 7);
INSERT INTO Pracownik_nizszego_szczebla (ID_Pracownika, Imie, Nazwisko, Stanowisko_ID_Stanowiska, Spolka_Franczyzowa_ID_spolki) VALUES (8, 'Marta', 'Zalewska', 8, 8);
INSERT INTO Pracownik_nizszego_szczebla (ID_Pracownika, Imie, Nazwisko, Stanowisko_ID_Stanowiska, Spolka_Franczyzowa_ID_spolki) VALUES (9, 'Grzegorz', 'Sikora', 9, 9);
INSERT INTO Pracownik_nizszego_szczebla (ID_Pracownika, Imie, Nazwisko, Stanowisko_ID_Stanowiska, Spolka_Franczyzowa_ID_spolki) VALUES (10, 'Sylwia', 'Krol', 10, 10);

-- Tabela Rodzaj_subskrypcji
INSERT INTO Rodzaj_subskrypcji (ID_Subskrypcji, Nazwa, Cena) VALUES (1, 'Basic', 100.00);
INSERT INTO Rodzaj_subskrypcji (ID_Subskrypcji, Nazwa, Cena) VALUES (2, 'Standard', 200.00);
INSERT INTO Rodzaj_subskrypcji (ID_Subskrypcji, Nazwa, Cena) VALUES (3, 'Premium', 300.00);

-- Tabela Silownia
INSERT INTO Silownia (ID_silowni, Powierzchnia_klubu_mkw, Spolka_Franczyzowa_ID_spolki, Miasto_ID_Miasta, Manager_klubu_ID_Managera) VALUES (1, 500, 1, 1, 1);
INSERT INTO Silownia (ID_silowni, Powierzchnia_klubu_mkw, Spolka_Franczyzowa_ID_spolki, Miasto_ID_Miasta, Manager_klubu_ID_Managera) VALUES (2, 600, 2, 2, 2);
INSERT INTO Silownia (ID_silowni, Powierzchnia_klubu_mkw, Spolka_Franczyzowa_ID_spolki, Miasto_ID_Miasta, Manager_klubu_ID_Managera) VALUES (3, 700, 3, 3, 3);
INSERT INTO Silownia (ID_silowni, Powierzchnia_klubu_mkw, Spolka_Franczyzowa_ID_spolki, Miasto_ID_Miasta, Manager_klubu_ID_Managera) VALUES (4, 800, 4, 4, 4);
INSERT INTO Silownia (ID_silowni, Powierzchnia_klubu_mkw, Spolka_Franczyzowa_ID_spolki, Miasto_ID_Miasta, Manager_klubu_ID_Managera) VALUES (5, 900, 5, 5, 5);
INSERT INTO Silownia (ID_silowni, Powierzchnia_klubu_mkw, Spolka_Franczyzowa_ID_spolki, Miasto_ID_Miasta, Manager_klubu_ID_Managera) VALUES (6, 1000, 6, 6, 6);
INSERT INTO Silownia (ID_silowni, Powierzchnia_klubu_mkw, Spolka_Franczyzowa_ID_spolki, Miasto_ID_Miasta, Manager_klubu_ID_Managera) VALUES (7, 1100, 7, 7, 7);
INSERT INTO Silownia (ID_silowni, Powierzchnia_klubu_mkw, Spolka_Franczyzowa_ID_spolki, Miasto_ID_Miasta, Manager_klubu_ID_Managera) VALUES (8, 1200, 8, 8, 8);
INSERT INTO Silownia (ID_silowni, Powierzchnia_klubu_mkw, Spolka_Franczyzowa_ID_spolki, Miasto_ID_Miasta, Manager_klubu_ID_Managera) VALUES (9, 1300, 9, 9, 9);
INSERT INTO Silownia (ID_silowni, Powierzchnia_klubu_mkw, Spolka_Franczyzowa_ID_spolki, Miasto_ID_Miasta, Manager_klubu_ID_Managera) VALUES (10, 1400, 10, 10, 10);


-- Tabela Spolka_franczyzowa
INSERT INTO Spolka_Franczyzowa (ID_spolki, Franczyzobiorca_ID_Franczyzobiorcy) VALUES (1, 1);
INSERT INTO Spolka_Franczyzowa (ID_spolki, Franczyzobiorca_ID_Franczyzobiorcy) VALUES (2, 2);
INSERT INTO Spolka_Franczyzowa (ID_spolki, Franczyzobiorca_ID_Franczyzobiorcy) VALUES (3, 3);
INSERT INTO Spolka_Franczyzowa (ID_spolki, Franczyzobiorca_ID_Franczyzobiorcy) VALUES (4, 4);
INSERT INTO Spolka_Franczyzowa (ID_spolki, Franczyzobiorca_ID_Franczyzobiorcy) VALUES (5, 1);
INSERT INTO Spolka_Franczyzowa (ID_spolki, Franczyzobiorca_ID_Franczyzobiorcy) VALUES (6, 2);
INSERT INTO Spolka_Franczyzowa (ID_spolki, Franczyzobiorca_ID_Franczyzobiorcy) VALUES (7, 3);
INSERT INTO Spolka_Franczyzowa (ID_spolki, Franczyzobiorca_ID_Franczyzobiorcy) VALUES (8, 4);
INSERT INTO Spolka_Franczyzowa (ID_spolki, Franczyzobiorca_ID_Franczyzobiorcy) VALUES (9, 1);
INSERT INTO Spolka_Franczyzowa (ID_spolki, Franczyzobiorca_ID_Franczyzobiorcy) VALUES (10, 2);

-- Tabela Stanowisko
INSERT INTO Stanowisko (ID_Stanowiska, Nazwa) VALUES (1, 'Recepcjonista');
INSERT INTO Stanowisko (ID_Stanowiska, Nazwa) VALUES (2, 'Trener personalny');
INSERT INTO Stanowisko (ID_Stanowiska, Nazwa) VALUES (3, 'Serwis sprzatajacy');
INSERT INTO Stanowisko (ID_Stanowiska, Nazwa) VALUES (4, 'Manager obiektu');
INSERT INTO Stanowisko (ID_Stanowiska, Nazwa) VALUES (5, 'Specjalista ds. klienta');
INSERT INTO Stanowisko (ID_Stanowiska, Nazwa) VALUES (6, 'Konsultant fitness');
INSERT INTO Stanowisko (ID_Stanowiska, Nazwa) VALUES (7, 'Instruktor zajęć grupowych');
INSERT INTO Stanowisko (ID_Stanowiska, Nazwa) VALUES (8, 'Dietetyk');
INSERT INTO Stanowisko (ID_Stanowiska, Nazwa) VALUES (9, 'Technik sprzętu fitness');
INSERT INTO Stanowisko (ID_Stanowiska, Nazwa) VALUES (10, 'Pracownik administracyjny');