SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

SHOW WARNINGS;

DROP SCHEMA IF EXISTS `mysport_test`;
CREATE SCHEMA IF NOT EXISTS `mysport_test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mysport_test` ;

-- -----------------------------------------------------
-- Table `USERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `USERS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `USERS` (
  `IDUSER` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID пользователя, уникальный ключ, идентификатор пользователя.\nАвтоматично генерується системою при додаванні користувача, закрите для редагування та відображення \nTable Description: В таблиці USER зберігаються всі облікові картки користувачів. На кожного користувача створюється окрема облікова картка. ',
  `ISBOT` INT(11) NULL DEFAULT NULL COMMENT 'Ідентифікатор належності даного облікового запису до типу БОТ \nАвтоматично проставляється системою у випадку створення активним користувачем іншого користувача. Закрите для редагування, відображається на інтерфейсі. ',
  `IDCREATEDBY` INT(11) NULL DEFAULT NULL COMMENT 'ID користувача, яким було створено даного користувача\nАвтоматично проставляється системою у випадку створення активним користувачем іншого користувача. Закрите для редагування та відображення.',
  `NICKNAME` VARCHAR(60) NULL COMMENT 'Псевдонім. Унікальне ім’я яке вводить сам користувач при реєстрації або редагуванні свого профілю \nДоступне для редагування. Повинно бути унікальним та обов’язково заповненим користувачем, проте в БД може бути пустим',
  `FIRSTNAME` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Ім’я\nДоступне для редагування. ',
  `LASTNAME` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Прізвище\nДоступне для редагування. ',
  `MIDDLENAME` VARCHAR(60) NULL DEFAULT NULL COMMENT 'По-батькові\nДоступне для редагування.',
  `MPHONE` VARCHAR(15) NULL DEFAULT NULL COMMENT 'Номер контактного телефону\nДоступне для редагування.',
  `EMAIL` VARCHAR(100) NULL COMMENT 'e-mail\nДоступне для редагування. Повинно бути обов’язково заповненим користувачем',
  `ISEMAILVERIFIED` INT(11) NULL DEFAULT NULL COMMENT 'Ознака чи e-mail є валідним\nАвтоматично встановлюється системою при підтвердженні поштової адреси',
  `SOCIALNETWORKLOGIN` VARCHAR(100) NULL DEFAULT NULL COMMENT 'Логін в вибраний тип соціальної мережі\nДоступне для редагування. ',
  `SOCIALNETWORKTYPE` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Тип соціальної мережі (необхідно створити таблицю з каталогом)\nДоступне для редагування. ',
  `BIRTHDATE` DATETIME NULL DEFAULT NULL COMMENT 'Дата народження\nДоступне для редагування. ',
  `PERFMARK` DECIMAL(8,2) NULL DEFAULT NULL COMMENT 'Оцінка успішності\nАвтоматично генерується системою. Закрите для редагування. Відображається на інтерфейсі',
  `REPMARK` DECIMAL(8,2) NULL DEFAULT NULL COMMENT 'Оцінка репутації\nАвтоматично генерується системою. Закрите для редагування. Відображається на інтерфейсі',
  `POSITIVEREP` INT(11) NULL DEFAULT NULL COMMENT 'Бали позитивної репутації\nАвтоматично генерується системою. Закрите для редагування та відображення',
  `NEGATIVEREP` INT(11) NULL DEFAULT NULL COMMENT 'Бали негативної репутації\nАвтоматично генерується системою. Закрите для редагування та відображення',
  `STATUS` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Статус облікової картки\nВстановлюється автоматично при видаленні або блокуванні користувача. Закрите для редагування.',
  `LOCALE` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Мова інтерфейсу\nДоступне для редагування. ',
  `GMT` VARCHAR(8) NULL DEFAULT NULL COMMENT 'Часовий пояс в форматі (-n…n)\nДоступне для редагування. ',
  `PWD` VARCHAR(64) NULL DEFAULT NULL COMMENT 'Пароль користувача\nДоступне для редагування через окрему форму зміни пароля. На інтерфейсі не відображається. Обовязковий атрибут користувача.',
  `CREATIONDATE` DATETIME NULL DEFAULT NULL COMMENT 'Дата створення облікового запису',
  `CHANGEDATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Остання дата зміни облікового запису',
  `IDCHANGEBY` INT(11) NULL DEFAULT NULL COMMENT 'ID користувача який змінив дані користувача\nАвтоматично проставляється системою\n',
  PRIMARY KEY (`IDUSER`))
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8 COLLATE utf8_general_ci;
SHOW WARNINGS;
CREATE UNIQUE INDEX `NICKNAME_UNIQUE` ON `USERS` (`NICKNAME` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `EMAIL_UNIQUE` ON `USERS` (`EMAIL` ASC);

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;